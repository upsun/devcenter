---
title: "Set up a local environment"
linkTitle: "Running locally"
type: docs
comments: false
---

Docker and Hugo are required.

- Clone [this repository](https://lab.plat.farm/devrel/community/upsun-developer-center) locally
- Start Docker
- `git submodule init`
- `git submodule update`
- `docker-compose up --remove-orphans -d`

Visit the site at [http://localhost:1313](http://localhost:1313).

Cleaning up:

- `docker-compose down`
- `docker container prune`
