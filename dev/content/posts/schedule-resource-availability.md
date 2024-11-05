---
#################################
# Don't touch these settings.
date: '2024-10-24T13:45:55+07:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "Scheduling resources"
subtitle: "Development resources available during working hours, but saving money overnight."
# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/red-background.webp

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - dman

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
#   - how-it-works
#   - discussions
#   - experiments
  - how-tos
#   - releases
#   - transcripts
#   - tutorials
#   - use-cases

# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations
math: true
---

As Upsun does purely usage-driven billing, 
rapid provisioning, and no-downtime scaling, 
you have the ability to turn things off when they are not being used.
In this example, we will look at a way to scale down your development environments 
and take them offline overnight when they are not in use. 
This has the potential to reduce your hosting costs significantly. 
...And reduce needless energy consumption also! 

> [Platform.sh is committed to "Green Hosting" and better environmental sustainability.](https://platform.sh/blog/b-corp-certification/) 

## Overview

To keep things simple to start with, 
We will set up two small cron jobs 
that will put your development environments to sleep at the end of the day, 
and wake them up again before you start work.

The ability to turn things on and off requires access to an API key that can be used to invoke the `upsun` CLI utility.

{{< callout >}}

**Assumptions:**

- You already have a project hosted on Upsun.
  - with at least one development environment
  - and resources to add one more
- You have the Upsun CLI installed.

{{< /callout >}}

## Steps

{{% steps %}}

### Create a feature branch environment

We will be adding and testing this new work in a feature branch.

Open a CLI in the project root and:

```
FEATURE_BRANCH='pauseSun'
git checkout -b $FEATURE_BRANCH
git push --set-upstream upsun $FEATURE_BRANCH
upsun environment:activate -y --environment=$FEATURE_BRANCH 
```

> Upsun also [provides the equivalent of these git commands](https://docs.upsun.com/administration/cli.html#choose-between-the-cli-and-git-commands) - that can useful.

### Create an API token

You can do this either [via the console](https://docs.upsun.com/administration/cli/api-tokens.html#2-create-an-api-token), or with the CLI as outlined below:

{{< callout type="info" emoji="ℹ" >}}
Generating a new token cannot be done using a CLI token.
Need to force browser login to make this work.
{{< /callout >}}


```bash
unset UPSUN_CLI_TOKEN
upsun auth:logout
upsun auth:browser-login
new_token_response=$(upsun api:curl users/"$(upsun auth:info id)"/api-tokens --json '{"name":"pauseSun runner"}')
new_token=$(echo $new_token_reponse | jq -r ".token")
```

### Embed the token into the feature branch environment

Do this the easy way [by setting an environment variable in the console](https://docs.upsun.com/administration/cli/api-tokens.html#authenticate-in-an-environment).

... or the hard way

```bash
upsun variable:create \
   -e $FEATURE_BRANCH \
   --level environment \
   --prefix 'env' \
   --name UPSUN_CLI_TOKEN \
   --sensitive true \
   --value "$new_token" \
   --inheritable false \
   --visible-build true \
   --no-interaction
   ```

### Install `upsun` CLI

Now [add a build hook to your app configuration](https://docs.upsun.com/administration/cli/api-tokens.html#authenticate-in-an-environment) to install the CLI as part of the build process.

```yaml {filename=".upsun/config.yaml"}
applications:
  app:
    hooks:
      #...
      build: |
        set -e
        echo "Installing Upsun CLI"
        curl -fsSL https://raw.githubusercontent.com/platformsh/cli/main/installer.sh | VENDOR=upsun bash
```

### Verify

If you push the code with the build hook now, you should see the message 
`Upsun CLI has been installed successfully.` in your build log.

You can also `upsun ssh` into the environment and ensure that running `upsun` commands there works as expected and the token is valid.

```bash
me@Platform Upsun-Tools-Demo % upsun ssh
 _   _                   
| | | |_ __ ____  _ _ _  
| |_| | '_ (_-< || | ' \ 
 \___/| .__/__/\_,_|_||_|
      |_|                

 Welcome to Upsun.
Environment: pausesun-varzi3y
Branch: pauseSun
Project: ce4ywrmdpxgbk

web@app.0:~$ upsun

Warning:
An API token is set. Anyone with SSH access to this environment can read the token.
Please ensure the token only has strictly necessary access.

Welcome to Upsun!

Project: Drupal10-Platformsh (ce4rmdpywxgbk)
Environment: pauseSun (type: development)
Application name: static
```

### Write the script

This could be done in any language you are comfortable with, but seeing as we are mostly just running commands on the CLI, I will stay in `bash`.

{{< callout type="info" emoji="ℹ" >}}
The default shell in `upsun` environments is actually `dash`, but that won't make a difference here.
{{< /callout >}}

This script will be stored in a `scripts/` directory *inside your app folder*. So in my case with my application in  a folder called `app/`, this will be `app/scripts/` in the repository, but just `scripts/` from the runtime environment application root.

It's very easy to ask the API for the list of environments.
I want only `active`, `development` environments - don't want to touch the `production` environment!

```
upsun environment:list --columns=ID --no-header --format=plain --type=development --status=active
```

Then, use the API to turn environments on and off within a script:

```bash {filename="scripts/pause_environments"}
#!/usr/bin/env bash
# Pause all development environments

ENVIRONMENTS=$(upsun environment:list --no-interaction --columns=ID --no-header --format=plain --type=development --status=active)

for ENVIRONMENT in $ENVIRONMENTS; do
  # Exclude self.
  if [ "$ENVIRONMENT" != "$PLATFORM_BRANCH" ]; then 
    echo "$0 is pausing $ENVIRONMENT.."
    upsun environment:pause --no-interaction --no-wait --environment="$ENVIRONMENT"
  fi
done
```

Here I use `--no-wait` and loop through all the environments. This will result in the activities being queued by the orchestration system, while this command returns immediately.
If you have a number of environments, it may take a few minutes for them to all process sequentially.
Check out the activity log to watch the queue in action.

We can set this script to be executable now, and `git add`, `commit`, `push`, and test it.

```
chmod a+x app/scripts/pause_environments
git add app/scripts/pause_environments
git commit -m "Added script to pause all environments"
git push
```

### Optional - publish this as a runtime operation

This will make it easy to turn everything on or off with one button!

```yaml {filename=".upsun/config.yaml"}
application:
  app:
    operations:
      #...
      pause_environments:
        role: admin
        commands:
          start: scripts/pause_environments
```

{{< figure src="/images/pauseSun-runtime-operation.png" title="You can now trigger the runtime operation from the Web Console" >}}

### Set a schedule

This is as simple as [adding a line in the `crons` section](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#crons) of your `.upsun/config.yaml`

```yaml {filename=".upsun/config.yaml"}
application:
  app:
    crons:
      #...
      pause_environments_at_7pm:
        spec: '0 19 * * *'
        commands:
          start: scripts/pause_environments
```

{{< callout type="info" emoji="ℹ" >}}
Take care for time zones!!
[`cron` will run on the system timezone. Adjust as needed.](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#cron-job-timing)
{{< /callout >}}

Once you `git add`, `commit`, and `push` this to your environment, all should be ready to run.

You can test the operation immediately by invoking it from the console via "Run runtime operation"

### Repeat this for turning back on in the morning

Almost the same additions can be made to reverse the process.

We use `upsun environment:resume` (not `environment:activate`) so as to not accidentally turn on new environments.

```bash {filename="scripts/resume_environments"}
#!/usr/bin/env bash
# Wake up all development environments

ENVIRONMENTS=$(upsun environment:list --no-interaction --columns=ID --no-header --format=plain --type=development --status=paused)

for ENVIRONMENT in $ENVIRONMENTS; do
  if [ "$ENVIRONMENT" != "$PLATFORM_BRANCH" ]; then 
    echo "$0 is activating $ENVIRONMENT.."
    upsun environment:resume --no-interaction --no-wait --environment="$ENVIRONMENT"
  fi
done
```

In `upsun/config.yaml`, add the cron job and runtime operation to turn things on:

```yaml {filename=".upsun/config.yaml"}
application:
  app:
    operations:
      #...
      resume_environments:
        role: admin
        commands:
          start: scripts/resume_environments

    ...
 
    crons:
      #...
      resume_environments_at_7am:
        spec: '0 7 * * 1-5'
        commands:
          start: scripts/resume_environments 
```

DONE!

{{% /steps %}}


## Conclusions

You now have a short, simple way to schedule downtime for your development environments when you are not using them.

This simple example doesn't contain much business logic, though I do try to leave things off over the weekend also.
For real use you may want to maybe adjust the schedule to be more selective about which environments really have to be turned on every day.

In this example, I developed and tested in a dedicated branch environment.
For real use, I could now merge this addition into the `production` branch, and have the schedule running from there.
This is because the `production` is expected to be always-on, and we can't put the scheduler into an environment that might itself become paused.

You could even put this script (and the corresponding `upsun` CLI and token) in a separate hosting environment altogether. This tutorial is an example of the building blocks that you can adjust to your own workflows.

