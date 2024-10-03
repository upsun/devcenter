---
title: "<code>backup:create</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

backup:create
-------------
Make a backup of an environment

Aliases: `backup`

## Usage:

```
upsun backup [--live] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]
```

### Arguments

* `environment` (optional)  
  The environment

### Options

* `--live`  
  Live backup: do not stop the environment.
If set, this leaves the environment running and open to connections during the backup.
This reduces downtime, at the risk of backing up data in an inconsistent state.

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

* `--unsafe`  
  Deprecated option: use --live instead

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

* Make a backup of the current environment:  
  ```
  phar-4.20.5 backup 
  ```

* Request a backup (and exit quickly):  
  ```
  phar-4.20.5 backup --no-wait
  ```

* Make a backup avoiding downtime (but risking inconsistency):  
  ```
  phar-4.20.5 backup --live
  ```


