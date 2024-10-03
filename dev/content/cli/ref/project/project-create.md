---
title: "<code>project:create</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

project:create
--------------
Create a new project

Aliases: `create`

## Usage:

```
upsun create [-o|--org ORG] [--title TITLE] [--region REGION] [--plan PLAN] [--environments ENVIRONMENTS] [--storage STORAGE] [--default-branch DEFAULT-BRANCH] [--set-remote] [--no-set-remote]
```

Use this command to create a new project.

An interactive form will be presented with the available options. If the
command is run non-interactively (with --yes), the form will not be displayed,
and the --region option will be required.

A project subscription will be requested, and then checked periodically (every
3 seconds) until the project has been activated, or until the process times
out (15 minutes by default).

If known, the project ID will be output to STDOUT. All other output will be sent
to STDERR.

### Options

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

* `--title` (expects a value)  
  The initial project title  
  Default: `'Untitled Project'`

* `--region` (expects a value)  
  The region where the project will be hosted.
Get a 3% discount on resources for regions with a carbon intensity of less than 100 gCO2eq/kWh.

* `--plan` (expects a value)  
  The subscription plan

* `--environments` (expects a value)  
  The number of environments  
  Default: `3`

* `--storage` (expects a value)  
  The amount of storage per environment, in GiB  
  Default: `5`

* `--default-branch` (expects a value)  
  The default Git branch name for the project (the production environment)  
  Default: `'main'`

* `--set-remote`  
  Set the new project as the remote for this repository. This is the default if no remote project is already set.

* `--no-set-remote`  
  Do not set the new project as the remote for this repository

* `--check-timeout` (expects a value)  
  The API timeout while checking the project status  
  Default: `30`

* `--timeout` (expects a value)  
  The total timeout for all API checks (0 to disable the timeout)  
  Default: `900`

* `--help` (`-h`)  
  Display this help message

* `--verbose` (`-v|-vv|-vvv`)  
  Increase the verbosity of messages

* `--version` (`-V`)  
  Display this application version

* `--yes` (`-y`)  
  Answer "yes" to confirmation questions; accept the default value for other questions; disable interaction

* `--no-interaction`  
  Do not ask any interactive questions; accept default values. Equivalent to using the environment variable: UPSUN_CLI_NO_INTERACTION=1

* `--ansi`  
  Force ANSI output

* `--no-ansi`  
  Disable ANSI output

* `--no` (`-n`)  
  Answer "no" to confirmation questions; accept the default value for other questions; disable interaction

* `--quiet` (`-q`)  
  Do not output any message


