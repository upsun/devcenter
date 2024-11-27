---
#################################
# Don't touch these settings.
date: '2024-10-07T08:30:05-04:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "Add context on your Blackfire timeline from a Google Alerts RSS Feed"

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/google-alerts/google-alert-marker.png

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - flovntp

# Choose ONE of the options below:
categories:
#   - core-concepts
  # - how-it-works
#   - discussions
  # - experiments
  - how-tos
#   - releases
#   - tutorials
  # - featured

# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations
math: true
---

{{< figure src="/images/google-alerts/google-alert-marker.png" >}}

Observing your application is essential to be able to find what needs (and what does not need) to be optimized.
Understand your traffic spike is key but when an external source lead to those traffic spikes, that's not any easy path to find out the exact reason.  

As an example, your CEO talks about your brand on a TV show, this automatically leads to a raise of your traffic few seconds later and by ricochet, potential performance issues: that's what I call in this article the `TV show effect`.
Other names can be found for these external events leading to traffic spikes: [Slashdot effects](https://en.wikipedia.org/wiki/Slashdot_effect) or [Hug of death](https://nordvpn.com/fr/cybersecurity/glossary/hug-of-death/).
Of course, most of the requests on your website would be absorbed by your reverse proxy in front (Varnish, Faslty,...), but some of those requests won't and would lead to an increase of the resource consumption.

[Blackfire](https://blackfire.io) is a great Application Performance Monitoring (APM) tool to observe and gather data about consumed server resources like memory, CPU time, and I/O operations.
On the Monitoring section of your Blackfire dashboard, the [timeline](https://docs.blackfire.io/profiling-cookbooks/understanding-timelines) helps you to analyse the behavior of your application, by giving a lot of metrics in a specific timeframe of your traffic.
[Blackfire](https://blackfire.io) also provides a great (and not so well known) feature to spot markers on this timeline.
These markers are a way to add more context for your observers to better understand what's going on (when and why?).

We saw in a previous tutorial [How to automatically spot markers on your Blackfire timeline for any occuring Upsun infrastructure processes](https://dev.to/upsun/how-to-get-notifications-when-an-upsun-infrastructure-event-occurs-2257).
In this current tutorial, I will showcase how you can import any new [Google alerts](https://www.google.fr/alerts) that pops up and spot markers on your Blackfire timeline.
As a summary for this tutorial, we will import, via a cron, any new RSS Feed entries in a [Symfony](https://www.symfony.com) database (SQLite), and spot corresponding markers on your Blackfire timeline.

{{< callout >}}

🚨 **Please note:**
I choose to use [Google alerts](https://www.google.fr/alerts) (RSS Feed) as it's an easy way to get notification when a new article/page is added in their index 
but that's just an example. 
Everything related to Google alerts in this article can easily be adapted to another RSS Feed structure. 
You would just need to adapt the PHP code to import RSS entries (function `createFeed` from class `src/Services/BlackfireGoogleAlert.php`) to your new RSS Feed structure.

{{< /callout >}}

## Google alerts and Blackfire markers

{{< callout >}}

**Assumptions:**

- You already have a [Google Account](https://www.google.com)
- You already have a [GitHub account](https://github.com/)
- You already have an Upsun account. If you don’t, [please register for a trial account](https://auth.upsun.com/register). You can sign up with an email address or an existing GitHub, Bitbucket, or Google account. If you choose one of these accounts, you can set a password for your Upsun account later.
- You have the [Upsun CLI](https://docs.upsun.com/administration/cli.html) installed locally.
- (optional) Your local environment is compatible with [Symfony requirements](https://symfony.com/doc/current/setup.html)

{{< /callout >}}

{{% steps %}}

### Create a new Google alert RSS Feed

The first step is to create a new RSS Feed alert. 

To do so, connect to your Google account and go on [Google alerts](https://www.google.fr/alerts) page and follow this [official tutorial](https://support.google.com/websearch/answer/4815696?hl=en).
Please fill it with the following options:

{{< figure src="/images/google-alerts/google-alert-form.png" caption="Google alert form with RSS Feed options">}}

### Create a fork of the `blackfire-google-alert-example` repository

To ease your work, I already developed a small Symfony application that contains the minimum codebase for importing all feeds from a Google Alert RSS Feed in your database and spotting corresponding markers on your Blackfire timeline, using a [cron](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#crons).

You can start by [creating a fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) of this [`blackfire-google-alert-example` GitHub repository](https://github.com/upsun/blackfire-google-alert-example) in your own GitHub organization for later usage.   

{{< callout >}}

🚨 **Please note**: for this tutorial, we use a [Symfony](https://www.symfony.com) application but feel free to reuse the business logic and come up with a solution using any other framework you like.

{{< /callout >}}

The source code in this GitHub repository is already Upsun-ready.
After creating a fork, you can clone it locally and [create an empty Upsun project](https://docs.upsun.com/get-started/here/create-project.html). 
Use the 3 following command lines from the root of your source code, and follow prompts:

```shell
git clone git@github.com:<OWNER/REPOSITORY>
cd <REPOSITORY>
upsun project:create
```

Final output should be:
```
  ...
  The Upsun Bot is activating your project

      ▄     ▄  
      ▄█▄▄▄█▄  
    ▄██▄███▄██▄
    █ █▀▀▀▀▀█ █
       ▀▀ ▀▀   

  The project is now ready!
  <PROJECT_ID>
``` 

* `<OWNER/REPOSITORY>` is your forked `<REPOSITORY>` in GitHub.
* `<PROJECT_ID>`: keep this project ID in mind for later use

At this step, your Upsun project is not deployed yet. 

We need first to pass to the application your previously created RSS Feed uri via an environment variable.  

### Define your RSS Feed uri in an environment variable
Before deploying, please note that this `blackfire-google-alerts` app need you to define an environment variable for your RSS Feed uri (`<GOOGLE_RSS_ALERT_URI>`). 

For local usage of this application, you can define this `GOOGLE_RSS_ALERT ` environment variable in a `.env` file:
```shell {location=".env"}
GOOGLE_RSS_ALERT=<GOOGLE_RSS_ALERT_URI>
```

As Upsun projects does not import `.env` file (local Symfony server), there are 3 ways to define environment variables for your Upsun environment/project. 
<BR>You can either: 
* use an [`.environment` file](https://docs.upsun.com/development/variables/set-variables.html#testing-environment-scripts) 
  ```shell {location=".environment"}
  GOOGLE_RSS_ALERT=<GOOGLE_RSS_ALERT_URI>
  ```
  Then you need to add this file to your Git history 
  ```
  git add .environment && git commit -m "adding GOOGLE_RSS_ALERT envVar"
  ```
  
* use the [Upsun CLI](https://docs.upsun.com/administration/cli.html).
```shell
upsun variable:create --level project --name GOOGLE_RSS_ALERT --prefix env --value <GOOGLE_RSS_ALERT_URI>
```

* define it from the [Upsun Console](https://console.upsun.com): to do so, please follow steps described in the [corresponding documentation page](https://docs.upsun.com/development/variables/set-variables.html#create-project-variables) (`In the Console` tab)

### Add a source integration to your fork

Then, you need to [add a source integration](https://docs.upsun.com/integrations/source/github.html) to sync your Upsun project with your new forked GitHub repository.
```shell
upsun integration:add --type github --repository <OWNER/REPOSITORY> --token <GITHUB_ACCESS_TOKEN> [--project <PROJECT_ID>] 
```
* `<PROJECT_ID>` is the ID of your new `blackfire-google-alert` project ID (from `upsun project:create` command).
* `<GITHUB_ACCESS_TOKEN>` is your [generated GitHub API Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens).

{{< callout >}}

For more information about source integration, please refer to the [enable source integration documentation page](https://docs.upsun.com/integrations/source/github.html#2-enable-the-integration).

{{< /callout >}}

### Blackfire Timeline testing
From the [Upsun Console](https://console.upsun.com) of your project, wait for the first deploy to be completed (~3 minutes) and then click on `Launch Blackfire` button on the left menu.

{{< callout >}}
  🚨 **Please note**: If you would like to automatically open your current project Console dashboard from your terminal, you can use this command from the root of your source code:
  ```shell
  upsun web
  ```

    
{{< /callout >}}

{{< figure src="/images/google-alerts/google-alert-button.png" >}}

You then land on the Blackfire dashboard (Health report). 
CLick on the ``Monitoring`` menu item on the left.
Markers should appear on the timeline, such as:

{{< figure src="/images/google-alerts/google-alert-timeline.png" >}}

{{< callout >}}

🚨 **Please note**: The ``blackfire-google-alerts`` app imports RSS Feed entries via a cron that runs every 5 minutes, so depending on the timing, you probably need to wait a bit for the first import to take place.
<BR>If you want to manually trigger the first import, you can also execute this command:
```shell
upsun ssh 'php bin/console blackfire:import-google-alerts'
```

{{< /callout >}}

{{% /steps %}}

## Conclusion
Adding more context to your Observability timeline is crucial if you are running applications with a lot of traffic and if you want to be able to detect what i called `TV show effects`.

In this guide, we took a look at how to automatically add context to your Blackfire timeline using an external source (here, Google Alert RSS Feed).
Some next steps could include importing any other external source of information that could explain traffic spikes on your application, 
or give a way for your marketing team to manually spot incoming events on your Blackfire timeline?
* In 2 weeks, your CEO is willing to be at a TV show, talking about your brand?
* A new 1 month nurturing campaign is planned in 3 weeks (start|end markers?)?

Possibilities are infinite, and all of these features to add context on your Blackfire timeline would help a lot your observers/developers to analyse your traffic and understand why and when a performance bottleneck is happening.

I keep you posted, I will soon write another episode to go further on contextualisation of your observability strategy.  

Remain up-to-date on the latest from us over on our social media and community channels: [DEV.to](https://dev.to/upsun), [Reddit](https://www.reddit.com/r/upsun/), and [Discord](https://discord.gg/platformsh). 
