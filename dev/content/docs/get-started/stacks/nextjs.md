---
title: Deploy Next.js on Upsun
linkTitle: Next.js
icon: nextjs

#################################################################
# Docs migration block - remove when migrated.
# excludeSearch: true
# sidebar:
#   external: false
#   link: https://docs.upsun.com/get-started/stacks/nextjs.html
#################################################################

description: |
    Complete the last required steps to successfully deploy Next.js on Upsun.
weight: 2
---

{{< callout type="blue" >}}
**Note**

Before you start, check out the [{{% vendor/name %}} demo app](https://console.upsun.com/projects/create-project) and the main [Getting started guide](/docs/get-started/here/_index.md).
They provide all of the core concepts and common commands you need to know before using the materials below.

{{< /callout >}}

## Before you begin

You need:

- [Git](https://git-scm.com/downloads).
  Git is the primary tool to manage everything your app needs to run.
  Push commits to deploy changes and control configuration through YAML files.
  These files describe your infrastructure, making it transparent and version-controlled.
- An Upsun account.
  If you don't already have one, [register for a trial account](https://auth.upsun.com/register).
  You can sign up with an email address or an existing GitHub, Bitbucket, or Google account.
  If you choose one of these accounts, you can set a password for your Upsun account later.
- The [Upsun CLI](/docs/administration/cli/_index.md).
  This lets you interact with your project from the command line.
  You can also do most things through the [Web Console](docs/administration/web/_index.md).

## Steps

{{% steps %}}

### Create a Next.js app

To create your Next.js app, follow these steps.

1. Follow the Next.js [installation guide](https://nextjs.org/docs/getting-started/installation).
   To fast track the process, run the following commands:

   ```bash {filename="Terminal"}
   npx create-next-app@latest myapp
   ```

2. To initialize the local Git repository and commit local files, run the following commands:

   ```bash {filename="Terminal"}
   cd myapp
   git init
   git add .
   git commit -m "Init Next.js application."
   ```

{{< callout type="blue" >}}
You can view the running app locally by running `npm run dev`.
{{< /callout >}}

### Create a new project

To create a project on {{% vendor/name %}},
follow these steps.

{{< callout title="Remember" >}}
**Remember**

After creating your {{% vendor/name %}} project, copy your new **project ID** for later use.
{{< /callout >}}

{{< tabs items="Using the CLI,Using the Console" >}}

{{< tab >}}
To create a new project with the {{% vendor/name %}} CLI, use the following command and follow the prompts:

```bash {filename="Terminal"}
{{% vendor/cli %}} project:create
```

{{< callout >}}

When creating a new project using the {{% vendor/name %}} CLI command `project:create`,
you are asked if you want to set the local remote to your new project. Enter **Yes (y)**.

Your local source code is automatically linked to your newly created {{% vendor/name %}} project
through the creation of a `.{{% vendor/cli %}}/local/project.yaml`.
This file contains the corresponding `<projectId>` for the {{% vendor/name %}} CLI to use,
and sets a Git remote to `{{% vendor/cli %}}`.

{{< /callout >}}

{{< /tab >}}

{{< tab >}}

1. Create an organization or select an existing one.

2. Click **Create from scratch**.

3. Fill in details like the project name and [region](/docs/development/regions.md).

   {{% callout %}}

   You can define resources for your project later on, after your first push.

   {{% /callout %}}

4. To link your local source code to your new {{% vendor/name %}} project,
   run the following command:

   ```bash {location="Terminal"}
   {{% vendor/cli %}} project:set-remote <projectId>
   ```

   This command adds a new remote called `{{% vendor/cli %}}` to your local Git repository,
   which is equivalent to the following commands:

   ```bash {location="Terminal"}
   git remote
   origin
   {{% vendor/cli %}}
   ```

   It also creates a new `.{{% vendor/cli %}}/local/project.yaml` file that contains the `<projectId>`
   for the `{{% vendor/cli %}}` CLI to use.

   {{< callout type="blue" theme="info" title="Tip" >}}
   **Tip**

   If you forget your `<projectId>`, run the following command and find your project in the list:

   ```bash {location="Terminal"}
   {{% vendor/cli %}} project:list
   ```
   {{< /callout >}}

{{< /tab >}}

{{< /tabs >}}

### Choose your Git workflow

You can use {{% vendor/name %}} projects as a classic Git repository,
where you are able to push your source code in different ways,
using either the Git CLI or the {{% vendor/name %}} CLI.
You can choose which way —or Git workflow— you want to use for your project from the following options:

- Your project source code is **hosted on a {{% vendor/name %}} Git repository**
- Your project source code is **hosted on your own GitHub repository**

{{< tabs items="Git repository,GitHub repository" >}}

{{< tab >}}
For the rest of this guide, you will use the normal Git workflow (`git add . && git commit -m "message" && git push {{% vendor/cli %}}`) to commit your source code changes to Git history.
You will also use the {{% vendor/name %}} CLI to deploy your [{{% vendor/name %}} environment](/docs/environments/_index.md) with the latest code updates.
{{< /tab >}}

{{< tab >}}
{{% vendor/name %}} provides a [Github integration](/docs/integrations/source/github.md) that allows your {{% vendor/name %}} project to be fully integrated with your Github repository.
This enables you, as a developer, to use a normal Git workflow (`git add . && git commit -m "message" && git push`) to deploy your environment—with no need to connect to the {{% vendor/name %}} Console.

{{< callout type="blue" >}}
Make sure you complete the following steps before adding a [Github integration](/docs/integrations/source/github.md):

1. Create a Git repository in your own organization following the relevant [Github repository creation guide](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository).
2. Create a [Github integration](/docs/integrations/source/github.md).
3. Add a Git remote to your local project, from the root of your Next.js directory.</br>
   To do so, run the following commands:

    ```bash {location="Terminal"}
    git remote add origin <urlOfYourOwnGitHubRepo>
    git add . && git commit -m "init nextjs"
    git push origin
    ```

{{< /callout >}}

{{< /tab >}}

{{< /tabs >}}

### Configure your project

To host your Next.js application on {{% vendor/name %}},
you need to have a few YAML configuration files at the root of your project.
These files manage your app's behavior.
They are located in a `.{{% vendor/cli %}}/` folder at the root of your source code
and structured in a similar way to this:

{{< filetree/container >}}
{{< filetree/folder name="my-nextjs-app" >}}
{{< filetree/folder name=".upsun" state="open" >}}
{{< filetree/file name="config.yaml" >}}
{{< /filetree/folder >}}
{{< filetree/file name="\[.environment\]" >}}
{{< filetree/file name="\[project sources\]" >}}
{{< /filetree/folder >}}
{{< /filetree/container >}}

To generate these files, run the following command at the root of your project:

``` {filename="Terminal"}
{{% vendor/cli %}} project:init
```

Follow the prompts, and you should result in such a config file.

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    source:
      root: "/"
    type: "nodejs:{{% latest "nodejs" %}}"
    mounts:
      "/.npm":
        source: "storage"
        source_path: "npm"
    hooks:
      build: |
        set -eux
        npm i
        npm run build
    web:
      commands:
        start: "npx next start -p $PORT"
      upstream:
        socket_family: tcp
      locations:
        "/":
          passthru: true
routes:
  "https://{default}/": { type: upstream, upstream: "myapp:http" }
  "http://{default}/": { type: redirect, to: "https://{default}/" }
```

As an example, above is the minimum configuration needed to deploy a Next.js application on {{% vendor/name %}} without any services.
Depending on your answers to the prompts, you may also have `relationships` and `services` defined.

To commit your new files, run the following commands:

```bash {filename="Terminal"}
git add .
git commit -m "Add {{% vendor/name %}} config files"
```

### Deploy

And just like that, it’s time to deploy!

Depending on the Git workflow you chose at the beginning of this tutorial,
there are two ways to deploy your source code changes.

{{< tabs items="Using Upsun Git repository,Using a third-party Git repository" >}}

{{< tab >}}
You can push your code using the normal Git workflow (`git add . && git commit -m "message" && git push`). This pushes your source code changes to your `{{% vendor/cli %}}` remote repository. Alternatively, you can use the following {{% vendor/name %}} CLI command:

```bash {filename="Terminal"}
{{% vendor/cli %}} push
```
{{< /tab >}}

{{< tab >}}

When you choose to use a third-party Git hosting service, the {{< vendor/name >}} Git
repository becomes a read-only mirror of the third-party repository. All your
changes take place in the third-party repository.

Add an integration to your existing third-party repository:

- [BitBucket](/docs/integrations/source/bitbucket.md)
- [GitHub](/docs/integrations/source/github.md)
- [GitLab](/docs/integrations/source/gitlab.md)

If you are using an integration, on each code updates,
use the normal Git workflow (`git add . && git commit -m "message" && git push`) to push your code to your external repository.
To do so, run the following command:

```bash {filename="Terminal"}
git push origin
```

Your GitHub, GitLab, or Bibucket integration process then automatically deploys changes to your environment.
If you're pushing a new Git branch, a new environment is created.

{{< /tab >}}

{{< /tabs >}}

{{% vendor/name %}} then reads your configuration files,
and deploys your project using [default container resources](/docs/manage-resources/resource-init.md).
If you don't want to use those default resources,
define your own [resource initialization strategy](/docs/manage-resources/resource-init#specify-a-resource-initialization-strategy),
or [amend those default container resources](/docs/manage-resources/adjust-resources.md) after your project is deployed.

Et voilà, your Next.js application is live!

{{< callout title="Tip" type="blue" >}}
**Tip**

Each environment has its own domain name.
To open the URL of your new environment, run the following command:

   ```bash {location="Terminal"}
   {{% vendor/cli %}} environment:url --primary
   ```
{{< /callout >}}

### Make changes to your project

Now that your project is deployed, you can start making changes to it.
For example, you might want to fix a bug or add a new feature.

In your project, the `main` branch always represents the production environment.
Other branches are for developing new features, fixing bugs, or updating the infrastructure.

To make changes to your project, follow these steps:

1. Create a new environment (a Git branch) to make changes without impacting production:

   ```bash {location="Terminal"}
   {{% vendor/cli %}} branch feat-a
   ```

   This command creates a new local `feat-a` Git branch based on the main Git branch,
   and activates a related environment on {{< vendor/name >}}.
   The new environment inherits the data (service data and assets) of its parent environment (the production environment here).

2. Make changes to your project.
   For example, edit the `views/index.jade` file and make the following changes:

   ```diff
   diff --git a/views/index.jade b/views/index.jade
   index 3d63b9a..77aee43 100644
   --- a/views/index.jade
   +++ b/views/index.jade
   @@ -2,4 +2,4 @@ extends layout

    block content
      h1= title
   -  p Welcome to #{title}
   +  p Welcome to #{title} on {{% vendor/name %}}
   ```

3. Commit your changes:

   ```bash {location="Terminal"}
   git add views/index.jade
   git commit -m "Update index page view."
   ```

4. Deploy your changes to the `feat-a` environment:

   ```bash {location="Terminal"}
   {{% vendor/cli %}} push
   ```

5. Iterate by changing the code, committing, and deploying.
   When satisfied with your changes, merge them to the main branch,
   and remove the feature branch:

   ```bash {location="Terminal"}
   $ {{% vendor/cli %}} merge
       Are you sure you want to merge feat-a into its parent, main? [Y/n] y
   $ {{% vendor/cli %}} checkout main
   $ git pull {{% vendor/cli %}} main
   $ {{% vendor/cli %}} environment:delete feat-a
   $ git fetch --prune
   ```
   
   Note that deploying to production is fast because the image built for the `feat-a` environment is reused.

   For a long running branch, to keep the code up-to-date with the main branch, use `git merge main` or `git rebase main`.
   You can also keep the data in sync with the production environment by using `{{% vendor/cli %}} env:sync`.

{{% /steps %}}

## More resources

### Documentation

- [JavaScript/Node.js documentation](/docs/languages/nodejs/_index.md)
- [Managing dependencies](/docs/languages/nodejs/_index.md#dependencies)

### Community content

- [Next.js topics](https://support.platform.sh/hc/en-us/search?utf8=%E2%9C%93&query=nextjs)
- [Node.js topics](https://support.platform.sh/hc/en-us/search?utf8=%E2%9C%93&query=node)
- [JavaScript topics](https://support.platform.sh/hc/en-us/search?utf8=%E2%9C%93&query=js)

### Blogs

- [A quick-start guide on hosting Next.js on {{% vendor/name %}}](https://upsun.com/blog/setting-up-next-js-on-upsun/)
