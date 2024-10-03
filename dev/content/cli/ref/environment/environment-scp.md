---
title: "<code>environment:scp</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:scp
---------------
Copy files to and from an environment using scp

Aliases: `scp`

## Usage:

```
upsun scp [-r|--recursive] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [--] [<files>]...
```

### Arguments

* `files` (optional; multiple values allowed)  
  Files to copy. Use the remote: prefix to define remote locations.

### Options

* `--recursive` (`-r`)  
  Recursively copy entire directories

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--app` (`-A`) (expects a value)  
  The remote application name

* `--worker` (expects a value)  
  A worker name

* `--instance` (`-I`) (expects a value)  
  An instance ID

* `--identity-file` (`-i`) (expects a value)  
  Deprecated: an SSH identity (private key) to use. The auto-generated certificate is recommended instead.

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

* Copy local files a.txt and b.txt to remote mount var/files:  
  ```
  phar-4.20.5 scp a.txt b.txt remote:var/files
  ```

* Copy remote files c.txt to current directory:  
  ```
  phar-4.20.5 scp remote:c.txt .
  ```

* Copy subdirectory dump/ to remote mount var/files:  
  ```
  phar-4.20.5 scp -r dump remote:var/logs
  ```

* Copy files inside subdirectory dump/ to remote mount var/files:  
  ```
  phar-4.20.5 scp -r dump/* remote:var/logs
  ```


