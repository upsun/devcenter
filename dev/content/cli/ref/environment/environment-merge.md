---
title: "<code>environment:merge</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:merge
-----------------
Merge an environment

Aliases: `merge`

## Usage:

```
upsun merge [--resources-init RESOURCES-INIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]
```

This command will initiate a Git merge of the specified environment into its parent environment.

### Arguments

* `environment` (optional)  
  The environment to merge

### Options

* `--resources-init` (expects a value)  
  Set the resources to use for new services: child, default, minimum or manual.
If not set, "child" will be used.

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

* Merge the environment "sprint-2" into its parent:  
  ```
  phar-4.20.5 merge sprint-2
  ```


