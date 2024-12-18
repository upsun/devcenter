---
title: Automate your code updates
linkTitle: Automate code updates
description: Learn how to automate your dependency updates through a source operation.
---

Upsun allows you to update your dependencies through [source operations](/docs/create-apps/source-operations.md).

## Before you start

You need:

- The [Upsun CLI](/docs/administration/cli/_index.md)
- An [API token](/docs/administration/cli/api-tokens.md#2-create-an-api-token)

## Steps

{{% steps %}}

### Define a source operation to update your dependencies

To facilitate updating your dependencies in your project,
define a source operation in your `.upsun/config.yaml` file
depending on your dependency manager:

<!--vale off -->
{{< tabs items="Composer, npm, Yarn, Go, Pipenv, Bundler" >}}

{{< tab >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    ...
    source:
      operations:
        update:
          command: |
            set -e
            composer update
            git add composer.lock
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

{{< /tab >}}

{{< tab >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    ...
    source:
      operations:
        update:
          command: |
            set -e
            npm update
            git add package.json package-lock.json
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

{{< /tab >}}

{{< tab >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    ...
    source:
      operations:
        update:
          command: |
            set -e
            yarn upgrade
            git add yarn.lock
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

{{< /tab >}}

{{< tab >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    ...
    source:
      operations:
        update:
          command: |
            set -e
            go get -u
            go mod tidy
            git add go.mod go.sum
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

{{< /tab >}}

{{< tab >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    ...
    source:
      operations:
        update:
          command: |
            set -e
            pipenv update
            git add Pipfile Pipfile.lock
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

{{< /tab >}}

{{< tab >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  myapp:
    ...
    source:
      operations:
        update:
          command: |
            set -e
            bundle update --all
            git add Gemfile Gemfile.lock
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

{{< /tab >}}

{{< /tabs >}}

<!--vale on -->

### Automate your dependency updates with a cron job

After you've defined a source operation to [update your dependencies on your project](#1-define-a-source-operation-to-update-your-dependencies),
you can automate it using a cron job.

Note that it’s best not to run source operations on your production environment,
but rather on a dedicated environment where you can test changes.

Make sure you have the [Upsun CLI](/docs/administration/cli/_index.md) installed
and [an API token](/docs/administration/cli/api-tokens.md#2-create-an-api-token)
so you can run a cron job in your app container.

**1. Set your API token as a top-level environment variable.**

    {{< callout type="orange" >}}
      Once you add the API token as an environment variable,
      anyone with [SSH access](/docs/development/ssh/_index.md) can read its value.
      Make sure you carefully check your [user access on this project](/docs/administration/users.md#manage-project-users).
    {{< /callout >}}

{{< tabs items="Using the CLI, Using Git" >}}

{{< tab >}}
1. List all your projects by running the following command:

   ```bash
   {{% vendor/cli %}} projects
   ```

2. Retrieve the project you want to back up by running the following command:

   ```bash
   {{% vendor/cli %}} get PROJECT_ID
   ```

{{< /tab >}}

{{< tab >}}

1. In the [Console](https://console.upsun.com/), open your project and click **Code** {{< icon "chevron" >}}.
2. Click **Git**.
3. To copy the command, click {{< icon "copy" >}} **Copy**.
   The command is similar to the following:

   ```text
   git clone abcdefgh1234567@git.eu.upsun.com:abcdefgh1234567.git project-name
   ```

{{< /tab >}}

{{< /tabs >}}

**2. Add a build hook to your app configuration to install the CLI as part of the build process:**

```yaml {filename=".upsun/config.yaml" lineNos="true" lineNoStart="1" hl_Lines="3-10"}
applications:
  myapp:
    hooks:
      build: |
        set -e
        echo "Installing Upsun CLI"
        curl -fsSL https://raw.githubusercontent.com/platformsh/cli/main/installer.sh | bash

        echo "Testing Upsun CLI"
        {{% vendor/cli %}}
    ...
    source:
      operations:
        update:
          command: |
            set -e
            ...
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

**3. Add a cron job**

Then, to configure a cron job to automatically update your dependencies once a day, use a configuration similar to the following:

```yaml {filename=".upsun/config.yaml" lineNos="true" lineNoStart="1" hl_Lines="11-19"}
applications:
  myapp:
    hooks:
      build: |
        set -e
        echo "Installing Upsun CLI"
        curl -fsSL https://raw.githubusercontent.com/platformsh/cli/main/installer.sh | bash

        echo "Testing Upsun CLI"
        {{% vendor/cli %}}
    crons:
      update:
        # Run the code below every day at midnight.
        spec: '0 0 * * *'
        commands:
          start: |
            set -e
            {{% vendor/cli %}} sync -e development code data --no-wait --yes
            {{% vendor/cli %}} source-operation:run update --no-wait --yes
    source:
      operations:
        update:
          command: |
            set -e
            ...
            git add -A
            git diff-index --quiet HEAD || git commit --allow-empty -m "Update dependencies"
```

The example above synchronizes the `development` environment with its parent
and then runs the `update` source operation defined [previously](#1-define-a-source-operation-to-update-your-dependencies).

### Configure notifications about dependency updates

To get notified every time a source operation is triggered and therefore every time a dependency is updated,
you can configure activity scripts or webhooks.

{{% /steps %}}
