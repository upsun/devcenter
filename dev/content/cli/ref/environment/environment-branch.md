---
title: "<code>environment:branch</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:branch
------------------
Branch an environment

Aliases: `branch`

## Usage:

```
upsun branch [--title TITLE] [--type TYPE] [--no-clone-parent] [--no-checkout] [--resources-init RESOURCES-INIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<id>] [<parent>]
```

### Arguments

* `id` (optional)  
  The ID (branch name) of the new environment

* `parent` (optional)  
  The parent of the new environment

### Options

* `--title` (expects a value)  
  The title of the new environment

* `--type` (expects a value)  
  The type of the new environment

* `--no-clone-parent`  
  Do not clone the parent environment's data

* `--no-checkout`  
  Do not check out the branch locally

* `--dry-run`  
  Dry run: do not create a new environment

* `--resources-init` (expects a value)  
  Set the resources to use for new services: parent, default or minimum.
If not set, "parent" will be used.

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--no-wait` (`-W`)  
  Do not wait for the operation to complete

* `--wait`  
  Wait for the operation to complete (default)

* `--force`  
  Deprecated option, no longer used

* `--identity-file` (`-i`) (expects a value)  
  Deprecated option, no longer used

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

## Examples

* Create a new branch "sprint-2", based on "develop":  
  ```
  phar-4.20.5 branch sprint-2 develop
  ```


