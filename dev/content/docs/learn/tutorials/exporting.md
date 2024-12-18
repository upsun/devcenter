---
title: "Exporting data"
description: See how to export your code, files and service data.
---

As an Upsun user, your code and data belong to you.
At any time, you can download your site's data for local development, to back up your data, or to change provider.

## Before you begin

You need:

- [Git](https://git-scm.com/downloads)
- A Upsun account
- Code in your project
- Optional: the [Upsun CLI](/docs/administration/cli/_index.md)

## Steps

{{% steps %}}

### Download your app's code

Your app's code is maintained through the Git version control system.

To download your entire app's code history:

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

### Download your files

Some files might not be stored in Git,
such as data your app writes [in mounts](/docs/create-apps/app-reference/single-runtime-image.md#mounts).

You can download your files [using the CLI](/docs/development/file-transfer.md#transfer-files-using-the-cli) or [using SSH](/docs/development/file-transfer.md#transfer-files-using-an-ssh-client).


### Download data from services

The mechanism for downloading from each service (such as your database) varies.

For services designed to hold non-persistent data, such as [Redis](/docs/add-services/redis.md) or [Solr](/docs/add-services/solr.md),
it's generally not necessary to download data as it can be rebuilt from the primary data store.

For services designed to hold persistent data, see each service's page for instructions:

- [MySQL](/docs/add-services/mysql/_index.md#exporting-data)
- [PostgreSQL](/docs/add-services/postgresql.md#exporting-data)
- [MongoDB](/docs/add-services/mongodb.md#exporting-data)
- [InfluxDB](/docs/add-services/influxdb.md#export-data)

### Get environment variables

Environment variables can contain critical information such as tokens or additional configuration options for your app.

Environment variables can have different prefixes:

- Variables beginning with `env:` are exposed [as Unix environment variables](/docs/development/variables/_index.md#top-level-environment-variables).
- Variables beginning with `php:` are interpreted [as `php.ini` directives](/docs/development/variables/_index.md#php-specific-variables).

All other variables are [part of `$PLATFORM_VARIABLES`](/docs/development/variables/use-variables.md#use-provided-variables).

To back up your environment variables:

{{< tabs items="Using the CLI, Using Git" >}}

{{< tab >}}
1. Get the variable's values by running the following command:

   ```bash
   {{% vendor/cli %}} ssh -- 'echo $PLATFORM_VARIABLES | base64 -d | jq'
   ```

   Note that you can also get all the environment variable values by running the following command:

   ```bash
   {{% vendor/cli %}} ssh -- env
   ```

2. Store the data somewhere secure on your computer.

{{< /tab >}}

{{< tab >}}

1. In the [Console](https://console.upsun.com/), open your project and click {{< icon "settings" >}}.
2. Click **Project Settings** {{< icon "chevron" >}}.
3. Click **Variables** and access your variable's values and settings.
4. Store the data somewhere secure on your computer.

Note that in the Console, you can't access the value of variables that have been [marked as sensitive](/docs/development/variables/set-variables.md#variable-options).
Use the CLI to retrieve these values.

{{< /tab >}}

{{< /tabs >}}

{{% /steps %}}

## What's next

- Migrate data from elsewhere [into Upsun](/docs/learn/tutorials/migrating/_index.md).
- Migrate to [another region](/docs/projects/region-migration.md).
- To use data from an environment locally, export your data and set up your [local development environment](/docs/development/local/_index.md).
