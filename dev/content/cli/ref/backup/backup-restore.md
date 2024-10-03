---
title: "<code>backup:restore</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

backup:restore
--------------
Restore an environment backup

## Usage:

```
upsun backup:restore [--target TARGET] [--branch-from BRANCH-FROM] [--no-code] [--no-resources] [--resources-init RESOURCES-INIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<backup>]
```

### Arguments

* `backup` (optional)  
  The ID of the backup. Defaults to the most recent one

### Options

* `--target` (expects a value)  
  The environment to restore to. Defaults to the backup's current environment

* `--branch-from` (expects a value)  
  If the --target does not yet exist, this specifies the parent of the new environment

* `--no-code`  
  Do not restore code, only data.

* `--restore-code`  
  [DEPRECATED] This option no longer has an effect.

* `--no-resources`  
  Do not override the target's existing resource settings.

* `--resources-init` (expects a value)  
  Set the resources to use for new services: backup, parent, default or minimum.
If not set, "backup" will be used.

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

* Restore the most recent backup:  
  ```
  phar-4.20.5 backup:restore 
  ```

* Restore a specific backup:  
  ```
  phar-4.20.5 backup:restore 92c9a4b2aa75422efb3d
  ```


