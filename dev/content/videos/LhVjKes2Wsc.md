---
#################################
# Don't touch these settings.
date: '2024-05-27T10:58:05+02:00'
sidebar:
    exclude: true
type: media
#################################
# Update the title
title: "Container environment maintenance - Master container management"

# (optional) Override the image produced for the video page.
# When undefined, the following will be used.
# image: https://img.youtube.com/vi/YOUTUBE_ID/hqdefault.jpg

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - lolautruche
  
# Choose ONE of the options below:
categories:
  - talks
#   - livestreams
#   - podcasts
#   - talks
#   - webinars

# Tags don't do anything yet, so ignore for now.
tags:
  - events
#   - integrations
---
Producing and happily maintaining container images. ✅🙂
Including many up-to-date packages. 💪
While still delivering older runtimes. 🫠🤯

Dependency hell is this annoying guest who’s ruining your party and making the situation uncomfortable. You didn’t realize they were invited, but now they’re here breaking everything.
Would it be possible to generate and maintain sane up-to-date environments, with packages having eerie dependencies? The answer is YES, and you don’t have to read the Necronomicon to make that happen. It’s called Nix, and it ain't dark magic…

Get ready to Nix with Jérôme Vieilledent.
______________________________________

Enterprise Symfony for the future: Platform.sh is the official Symfony Cloud Platform.
______________________________________

A bright, new offer powered by Platform.sh—adopted (and ❤️) by 16,000+ developers, 7,000 customers, and proven over the last 8 years—Upsun provides out-of-the-box capabilities that serve as the launchpad for creative development teams’ out-of-the-box thinking. A single, fully managed, self-service PaaS for development teams who just want to build their next, great application.

Learn more: https://platform.sh/blog/the-container-is-a-lie/

Links to check out:
👉 Get your free Upsun trial: https://brnw.ch/21wFxKr
👉 Learn more about Blackfire: https://brnw.ch/21wFxKp
👉 Get started with Platform.sh: https://brnw.ch/21wFxKj

Key moments:
0:00 - Intro

1:11 - Containers on Platform.sh
* Details the use of Linux containers instead of Docker for historical stability reasons.
* Mentions the industrialized orchestration used, not Kubernetes.
* Explains the goal of platform.sh as a horizontal Platform as a Service.
* Highlights the complexity of maintaining containers for various runtimes and services, with 166 images maintained by three people full-time.

5:43 - What about packages?
* Discusses the need for additional packages within containers beyond just PHP.
* Provides examples of packages like ImageMagick, PDF converters, etc., that may be required.
* Illustrates the challenge of managing dependencies and versions within containers, leading to "dependency hell."

10:38 - What is Nix?
* Introduces Nix as a functional package manager.
* Defines functional programming language support and its implications for package management.
* Explains the concept of "derivations" in Nix and how packages are treated as values with no side effects.
* Describes the Nix store and how packages are stored with unique identifiers.
* Mentions the ease of building and managing packages with Nix expressions.
* Highlights the extensive package availability in the Nix packages repository.
* Illustrates the isolation and dependency resolution capabilities of Nix with a visual example of package dependencies.

17:36 - Demo
* The speaker demonstrates setting up a PHP development environment using NYX shell.
* They specify their desired PHP version, extensions, and other dependencies.
* NYX shell is used to create a temporary environment with the required packages.
* Pre-downloaded packages are used to avoid long wait times during the demonstration.
* The speaker highlights the simplicity of Nix's language for specifying package dependencies.
* They showcase the successful setup of the PHP environment with the desired versions of PHP, Python, ImageMagick, etc.
* The speaker emphasizes the time-saving aspect of automating environment setup with NYX.

25:22 - Questions

34:30 - Ending
