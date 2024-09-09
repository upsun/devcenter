---
title: "Set up a local environment"
linkTitle: "Running locally"
type: docs
comments: false

excludeSearch: true
sidebar:
  exclude: true
---

Docker and Hugo are required.

- Clone [this repository](https://lab.plat.farm/devrel/community/upsun-developer-center) locally
- Start Docker
- `git submodule init`
- `git submodule update`
- `docker-compose up --remove-orphans`

> Please note: if you add a ``-d`` option to the `docker-compose` command, you won't be able to see logs in your terminal
>
> As you will not get back to the terminal prompt, please open a new tab in your terminal for executing this command.

Visit the site at [http://localhost:1313](http://localhost:1313).

Cleaning up:

- `docker-compose down`
- `docker container prune`
