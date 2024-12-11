---
title: Configure your project
weight: 3
description: Configure your project
layout: single
pagination: true
prev: /docs/get-started/here/create-project.md
next: /docs/get-started/here/set-resources.md
---

## Required files

To host your application on {{% vendor/name %}}, a configuration file (YAML) is needed to manage the way your application behaves.
This configuration file is located inside a `.upsun`folder at the root of your source code:

{{< filetree/container >}}
  {{< filetree/folder name="myapp" >}}
    {{< filetree/folder name=".upsun" state="open" >}}
      {{< filetree/file name="config.yaml" >}}
    {{< /filetree/folder >}}
    {{< filetree/file name="\[.environment\]" >}}
    {{< filetree/file name="\[project sources\]" >}}
  {{< /filetree/folder >}}
{{< /filetree/container >}}

To pre-generate these YAML files, run the following command from the root of your project.

```bash {filename="Terminal"}
{{% vendor/cli %}} project:init
```

Follow the prompts. The `{{% vendor/cli %}} project:init` command does the following:

- If possible, automatically detects which framework you’re using. If not detected, you are asked which runtime language your codebase is in.
- Asks if you want to add any services.
- Generates the corresponding `{{% vendor/configfile "app" %}}` and `.environment` files.

The generated configuration varies slightly based on your answers to these prompts and whether a framework is detected.
However, the structure of the configuration file remains similar to the following:

```yaml {fileName=".upsun/config.yaml"}
applications:
    # Configuration for all applications within an environment.
    myapp:
        # configuration for the application 'myapp'

services:
    # Configuration for all services within an environment.
    db:
        # configuration for service 'db'

routes:
    # Configuration for routing to applications
    "https://{default}/": 
        # configuration for route 'https://{default}/'
```

{{% callout %}}
If you want more information on the structure of this configuration file, see the dedicated [YAML page](/docs/learn/overview/yaml/_index.md).
{{% /callout %}}

{{< callout type="blue" title="Committing variables" >}}
**Committing variables**

An additional [`.environment` file](/docs/development/variables/set-variables.md#set-variables-via-script) may be located at the root of your source code. 
This file contains Upsun-specific environment variables.
{{< /callout >}}

Commit your new files:

```bash {fileName="Terminal"}
git add . && git commit -m "Add configuration for {{% vendor/name %}}."
```

Push up to your {{% vendor/name %}} project:

```bash {fileName="Terminal"}
{{% vendor/cli %}} push
```

{{% vendor/name %}} now reads your configuration files, begins building your application image and allocates resources to your various containers.

{{< callout >}}
By default, {{% vendor/name %}} uses default resources for each of your services/apps. You can [adjust these resources](/docs/get-started/here/set-resources).
{{< /callout >}}

## Errors on first push

If you try to push a source code that is not {{% vendor/name %}} ready, the following error is usually triggered at this point:

{{< tabs items="Using the CLI, Using the management console" >}}

{{< tab >}}
```bash
Found 749 commits

E: Error parsing configuration files:
- : Configuration directory '.{{% vendor/cli %}}' not found.

E: Error: Invalid configuration files, aborting build
```
{{< /tab >}}

{{< tab >}}
![Create project options](/images/console/first-fail.png "0.4")
{{< /tab >}}

{{< /tabs >}}

This error is triggered because you have not yet added {{% vendor/name %}} configuration to your project to setup deployments.

## Errors

The `project:init` CLI command uses your responses and some framework-detection logic to attempt to set some sane configuration for your project.
Your project - like most projects - is unique, and this goal of a seamless first deployment may yet be incomplete at this stage.

Have no fear! {{% vendor/name %}} provides a highly customizable configuration schema that can be adjusted for your particular package manager, environment variables, builds, deploys, workers, crons, and other requirements to get you fully deployed.

To start exploring what might still be needed, see the following language-specific configuration pages:

- [JavaScript/Node.js](/docs/get-started/here/configure/nodejs)
- [PHP](/docs/get-started/here/configure/php)
- [Python](/docs/get-started/here/configure/python)

## Next steps

With your deployment finished, you may have noticed that the resources allocated to the application and service containers of your project have been set automatically:

```bash
  Opening environment
  Environment configuration
    app (type: php:8.2, cpu: 0.5, memory: 224, disk: 512)
    db (type: mariadb:12.4, cpu: 0.5, memory: 1408, disk: 512)
    memcached (type: memcached:1.6, cpu: 0.5, memory: 1088)
```

{{% callout type="blue" %}}
Each time you create a new branch, your new environment inherits its parent environment's resource allocation.
{{% /callout %}}

If you need more disk for uploaded files, or less memory for rarely used services, you can [adjust resources](/docs/manage-resources/adjust-resources.md) at any time.