---
title: "Set up a local environment"
linkTitle: "Running locally"
type: docs
comments: false
---

Docker and Hugo are required.

- Clone this repository locally
- Start Docker
- `git submodule init`
- `git submodule update`
- `docker-compose up --remove-orphans`

Visit the site at [http://localhost:1313](http://localhost:1313).

Cleaning up:

- `docker-compose down`
- `docker container prune`
