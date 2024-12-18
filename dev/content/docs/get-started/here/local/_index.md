---
title: Local development
weight: 6
layout: single
description: |
    All you need to know about working locally with an Upsun project.
pagination: true
prev: /docs/get-started/here/make-changes.md
next: /docs/get-started/here/third-party.md
---

A significant amount of work developing your app takes place locally rather than on an active {{% vendor/name %}} environment.
You want to ensure that the process of local development is as close as possible to a deployed environment.

You can achieve this through the following approaches:

- [Tethered local development](/docs/get-started/here/local/tethered)
- DDEV (coming soon!)

Each of these approaches [^1]:

- Creates a local development environment for your site.
- Syncs data from the active {{% vendor/name %}} environment where team review takes place.
- Commits aspects of that local development method to the project so collaborators can replicate configuration to contribute.

[^1]: If you're already using Docker Compose, consult the Community guide on [using Docker Compose with Django and Upsun](https://community.platform.sh/t/using-docker-compose-with-django/1205&).