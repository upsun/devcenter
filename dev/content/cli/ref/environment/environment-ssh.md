---
title: "<code>environment:ssh</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:ssh
---------------
SSH to the current environment

Aliases: `ssh`

## Usage:

```
upsun ssh [--pipe] [--all] [-o|--option OPTION] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [--] [<cmd>]...
```

### Arguments

* `cmd` (optional; multiple values allowed)  
  A command to run on the environment.

### Options

* `--pipe`  
  Output the SSH URL only.

* `--all`  
  Output all SSH URLs (for every app).

* `--option` (`-o`) (multiple values allowed)  
  Pass an extra option to SSH

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

* Open a shell over SSH:  
  ```
  phar-4.20.5 ssh 
  ```

* Pass an extra option to SSH:  
  ```
  phar-4.20.5 ssh -o 'RequestTTY force'
  ```

* List files:  
  ```
  phar-4.20.5 ssh ls
  ```

* Monitor the app log (use '--' before flags):  
  ```
  phar-4.20.5 ssh tail /var/log/app.log -- -n50 -f
  ```

* Display relationships (use quotes for complex syntax):  
  ```
  phar-4.20.5 ssh 'echo $PLATFORM_RELATIONSHIPS | base64 --decode'
  ```


