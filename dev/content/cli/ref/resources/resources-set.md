---
title: "<code>resources:set</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

resources:set
-------------
Set the resources of apps and services on an environment

## Usage:

```
upsun resources:set [-S|--size SIZE] [-C|--count COUNT] [-D|--disk DISK] [-f|--force] [--dry-run] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait]
```

Configure the resources allocated to apps, workers and services on an environment.

The resources may be the profile size, the instance count, or the disk size (MB).

Profile sizes are predefined CPU & memory values that can be viewed by running: upsun resources:sizes

If the same service and resource is specified on the command line multiple times, only the final value will be used.

### Options

* `--size` (`-S`) (multiple values allowed)  
  Set the profile size (CPU and memory) of apps, workers, or services.
Items are in the format name:value and may be comma-separated.
The % or * characters may be used as a wildcard for the name.
List available sizes with the resources:sizes command.
A value of 'default' will use the default size, and 'min' or 'minimum' will use the minimum.

* `--count` (`-C`) (multiple values allowed)  
  Set the instance count of apps or workers.
Items are in the format name:value as above.

* `--disk` (`-D`) (multiple values allowed)  
  Set the disk size (in MB) of apps or services.
Items are in the format name:value as above.
A value of 'default' will use the default size, and 'min' or 'minimum' will use the minimum.

* `--force` (`-f`)  
  Try to run the update, even if it might exceed your limits

* `--dry-run`  
  Show the changes that would be made, without changing anything

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

* Set profile sizes for two apps and a service:  
  ```
  phar-4.20.5 resources:set --size frontend:0.1,backend:.25,database:1
  ```

* Give the "backend" app 3 instances:  
  ```
  phar-4.20.5 resources:set --count backend:3
  ```

* Give 512 MB disk to the "backend" app and 2 GB to the "database" service:  
  ```
  phar-4.20.5 resources:set --disk backend:512,database:2048
  ```

* Set the same profile size for the "backend" and "frontend" apps using a wildcard:  
  ```
  phar-4.20.5 resources:set --size '*end:0.1'
  ```

* Set the same instance count for all apps using a wildcard:  
  ```
  phar-4.20.5 resources:set --count '*:3'
  ```


