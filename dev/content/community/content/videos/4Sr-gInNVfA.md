---
#################################
# Don't touch these settings.
date: '2024-07-01T12:16:05+02:00'
sidebar:
    exclude: true
type: media
#################################
# Update the title
title: "Django schema migrations and deployments minus the misery l Upsun"

# (optional) Override the image produced for the video page.
# When undefined, the following will be used.
# image: https://img.youtube.com/vi/YOUTUBE_ID/hqdefault.jpg

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - akalipetis
  
# Choose ONE of the options below:
categories:
  - demos
#   - livestreams
#   - podcasts
#   - talks
#   - webinars

# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations
---
Django powers some of the world’s leading websites, offering a robust framework that propels projects from conception to production with ease. At its core, Django's migration framework and static asset management streamline development, but the journey doesn’t stop there. As applications expand and evolve, scaling introduces new challenges, particularly when deploying updates across multiple instances.

How do we manage schema and static asset versions during rolling updates or blue/green deployments without disrupting the user experience? This presentation dives into the trenches of scaling Django applications. We’ll unravel the complexities of running multiple instances with varying schema and static assets, exploring the intricacies of forward and backward-compatible migrations and the nuances of serving static assets in a distributed environment. Prepare to get your hands dirty as we navigate through real-world scenarios, weighing compromises and strategizing for success. Whether you’re scaling your first project or optimizing an enterprise-level system, this session will arm you with the knowledge to tackle these challenges head-on.

Topic:
Deployment
Audience Level:
Beginner
Speaker:
Antonis Kalipetis

Antonis is a Docker Captain and a Software Engineer at Platform.sh — a cloud platform for responsibly building, running, and scaling fleets of websites and applications. He is a Python lover and developer who helps teams embrace containers and improve their development workflow. He loves automating stuff and sharing knowledge around all things containers, DevOps and developer workflows.

Try Upsun for your Django projects: https://upsun.com/blog/setting-up-dja...

Key moments:
0:00 - Intro
2:28 - Understanding Django deployments
2:36 - A typical Django application
3:20 - Proxy
4:20 - Application server
6:00 - Cache
6:37 - Database
7:30 - Static asset management in Django
10:59 - Static files app
13:28 - Storages
14:46 - Schema migrations in Django
16:29 - Challenges in horizontally scaling Django apps
17:29 - Static files
19:03 - Migrations
20:49 - GitHub repository and CLI
21:24 - Demo: Django deployments in Upsun
52:00 - Ending