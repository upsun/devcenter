---
title: JavaScript/Node.js
# description: All you need to know about creating a new project with Upsun.

# linkTitle: Comments
weight: 1
---

When dealing with Javascript/Node.js stacks, the information below may help customize your configuration.
These sections provide Javascript/Node.js-specific configuration details, but you can also refer to the common {{% vendor/name %}} documentation:

- [Configuring applications](/docs/create-apps/_index.md)
- [Setting up managed services](/docs/add-services/_index.md)
- [Handling requests](/docs/define-routes/_index.md)

## Build flavors

By default, {{% vendor/name %}} makes assumptions about how you want to build your application. 
Namely, that you are managing your dependencies with npm, and that the very first thing you'd like to run is a particular and common production flavor of `npm install`.

This is called a build `flavor`, but its assumption may prove inappropriate for your application and cause your builds to fail (such as if you'd like to use yarn or bun instead of npm).
Therefore, you can [disable this feature](/docs/languages/nodejs/_index.md#dependencies).

## Available package managers

Certain package managers come pre-installed on all {{% vendor/name %}} `nodejs` container types:

* *npm*; example: ``npm install platformsh-config``
* *npx*; example: ``npx create-strapi-app <APP_NAME>``
* *bun*; example: ``bun install platformsh-config``

You can also use Yarn if you [install it explicitly](/docs/languages/nodejs/_index.md#use-yarn-as-a-package-manager), or [nvm](/docs/languages/nodejs/node-version.md#use-nvm).

## Sample configuration

Below are some examples from common Node.js framework configuration:

{{< tabs items="Next.js, Express, Strapi" >}}

{{< tab >}}
```yaml {fileName=".upsun/config.yaml"}
applications:
  myapp:
    source:
      root: "/"
    type: "nodejs:20"
    web:
      commands:
        start: "npx next start -p $PORT"
    build:
      flavor: none
    dependencies:
      nodejs:
        sharp: "*"
#services:
#  db:
#    type: postgresql:15
routes:
  "https://{default}/":
    type: upstream
    upstream: "myapp:http"
  "https://www.{default}/":
    type: redirect
    to: "https://{default}/"
```
{{< /tab >}}

{{< tab >}}
```yaml {fileName=".upsun/config.yaml"}
applications:
  myapp:
    source:
      root: "/"
    type: "nodejs:20"
    web:
      commands:
        start: "node index.js"
    build:
      flavor: none
    dependencies:
      nodejs:
        sharp: "*"
#services:
#  db:
#    type: postgresql:14
routes:
  "https://{default}/":
    type: upstream
    upstream: "myapp:http"
  "https://www.{default}/":
    type: redirect
    to: "https://{default}/"
```
{{< /tab >}}

{{< tab >}}
```yaml {fileName=".upsun/config.yaml"}
applications:
  myapp:
    source:
      root: "/"
    type: "nodejs:20"
    relationships:
      postgresql:
    mounts:
      ...
    web:
      commands:
        start: "NODE_ENV=production yarn start"
    build:
      flavor: none
    dependencies:
      nodejs:
        yarn: "^1.22.0"
    hooks:
      build: |
        set -eux
        yarn
        yarn build
services:
  postgresql:
    type: postgresql:15

routes:
  "https://{default}/":
    type: upstream
    upstream: "myapp:http"
  "https://www.{default}/":
    type: redirect
    to: "https://{default}/"
```
{{< /tab >}}

{{< /tabs >}}

## Frameworks

The {{% vendor/name %}} documentation includes a wide array of community resources to help with framework-specific configuration:

- [Express](/docs/get-started/stacks/express)
- [Next.js](/docs/get-started/stacks/nextjs)
- [Strapi](/docs/get-started/stacks/strapi)

## Get support

While there are virtually no restrictions to you deploying any kind of application on {{% vendor/name %}}, configuration may still be unclear at this point.

Not to worry! The {{% vendor/name %}} community is here to help.
Come and say hello, share your work, ask for help, and peek in on what others are working on.

Welcome to the {{% vendor/name %}} community!

{{% community-buttons %}}

