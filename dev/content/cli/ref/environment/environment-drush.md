---
title: "<code>environment:drush</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:drush
-----------------
Run a drush command on the remote environment

Aliases: `drush`

## Usage:

```
upsun drush [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--] [<cmd>]...
```

### Arguments

* `cmd` (optional; multiple values allowed)  
  A command to pass to Drush  
  Default: `array (
  0 => 'status',
)``

### Options

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--app` (`-A`) (expects a value)  
  The remote application name

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

* Run "drush status" on the remote environment:  
  ```
  phar-4.20.5 drush status
  ```

* Enable the Overlay module on the remote environment:  
  ```
  phar-4.20.5 drush en overlay
  ```

* Get a one-time login link (using -- before options):  
  ```
  phar-4.20.5 drush user-login -- --mail=name@example.com
  ```

* Alternative syntax (quoting the whole command):  
  ```
  phar-4.20.5 drush 'user-login --mail=name@example.com'
  ```

