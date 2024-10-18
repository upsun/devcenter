---
#################################
# Don't touch these settings.
date: '2024-05-27T10:10:36+02:00'
sidebar:
    exclude: true
type: media
#################################
# Update the title
title: "Transforming Symfony monolith to multi-apps: A step-by-step guide"

# (optional) Override the image produced for the video page.
# When undefined, the following will be used.
# image: https://img.youtube.com/vi/YOUTUBE_ID/hqdefault.jpg

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - flovntp
  
# Choose ONE of the options below:
categories:
#  - demos
#   - livestreams
#   - podcasts
  - talks
#   - webinars

# Tags don't do anything yet, so ignore for now.
tags:
  - events
#   - events
#   - integrations
---
From monolith to multi-app join us as we explore more in this Symfony demo: Once upon a time, great people created a great Symfony demo, to be used as a living code example and help us all learn: Bigfoot. Since then, the DevRel team at Platform.sh has forked this repository and created a really fun escape game to showcase Blackfire. And we thought it would be good to have a dedicated frontend for our game, instead of reusing the Bigfoot design.

So we forked it to create an instance for Django. And then we forked it again to make an instance for Drupal. And then another fork, and another. Slowly, we realized that the way forward was to refactor our dear monolith to better fit our needs. Let Florent HUCK show you how we stopped forking around!
______________________________________

Enterprise Symfony for the future: Platform.sh is the official Symfony Cloud Platform.
______________________________________

Learn more: https://platform.sh/blog/how-to-host-multiple-applications/

Links to check out:
👉 Get your free Upsun trial: https://brnw.ch/21wFxKr
👉 Learn more about Blackfire: https://brnw.ch/21wFxKp
👉 Get started with Platform.sh: https://brnw.ch/21wFxKj

Key moments:
0:00 - Intro

1:46 - Upsun in the web ecosystem
* Motivates refactoring monoliths into multi-apps for decoupling.
* Discusses default architecture on Platform.sh.

2:11 - Hosting Symfony apps on Upsun
* Demonstrates deploying Symfony apps with four commands.
* Integrates Symfony CLI with Upsun CLI for seamless deployment.

3:17 - Symfony projects on Platform.sh
* Highlights the Bigfoot App as an example of transitioning from a Symfony monolith to multiple apps.

3:54 - DIY architecture
* Contrasts Platform.sh's architecture with self-hosting.
* Highlights Platform.sh's simplicity in deployment and management.

4:40 - Bigfoot App
* Introduces Bigfoot website's transition from a monolith to multiple apps using Symfony, API Platform, Gatsby, and Mercure.

7:03 - Steps from single to multi-app
* Outlines steps to transition from single Symfony app to multiple apps.
* Emphasizes creating new environments and transforming folder structures.

8:19 - Create a new environment
* Details environment creation on Platform.sh.
* Highlights automatic URL generation and SSL certificate management.

9:32 - Transform folder structure
* Describes restructuring folder architecture for multiple apps.
* Introduces separate folders for each app.

10:19 - Add other application sources
* Explains adding Symfony, API Platform, Gatsby, and Mercure as separate applications.
* Provides guidance on copying existing Symfony source code.

10:55 - Configure apps
* Guides configuring applications in Platform.sh.
* Highlights routing configuration and automatic HTTPS redirection.

11:35 - Configure routing
* Explains configuring routing for multiple apps using YAML files.
* Highlights defining source routes and application endpoints.

13:10 - Configure services
* Provides guidance on configuring services like databases and caches.
* Explains service definition syntax and automation of service installation.

14:19 - Configure applications
* Explains how to configure applications for deployment.
* Covers defining runtime, PHP extensions, source route, relationships, mounts, index.php, build, and deploy steps.
* Mentions using Symfony CLI for deploying applications efficiently.

17:18 - Help the Symfony project by using Upsun
* Introduces the concept of supporting Symfony by using Upsun.
* Explains the significance of contributing a percentage of subscription to Symfony.

17:53 - Push to Upsun
* Describes the process of pushing changes to Upsun.
* Highlights the seamless integration with Git flow and Symphony CLI for automatic deployment.

19:00 - Push it live
* Details the steps to push changes live.
* Emphasizes the ease of testing and deploying features with Upsun.

20:34 - Platform.sh vs Upsun resource allocation
* Compares resource allocation between Platform.sh and Upsun.
* Highlights Upsun's flexibility in allocating resources per container and managing costs.

23:23 - Tips & tricks
* Provides additional tips and tricks for efficient deployment.
* Mentions integrating with GitHub, GitLab, or Bitbucket repositories for automatic deployment.
* Advises on adapting resource allocation to manage costs effectively.

28:30 - Ending