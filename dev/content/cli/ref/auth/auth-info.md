---
title: "<code>auth:info</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

auth:info
---------
Display your account information

## Usage:

```
upsun auth:info [--no-auto-login] [-P|--property PROPERTY] [--refresh] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--] [<property>]
```

### Arguments

* `property` (optional)  
  The account property to view

### Options

* `--no-auto-login`  
  Skips auto login. Nothing will be output if not logged in, and the exit code will be 0, assuming no other errors.

* `--property` (`-P`) (expects a value)  
  The account property to view (alternate syntax)

* `--refresh`  
  Whether to refresh the cache

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (`-c`) (multiple values allowed)  
  Columns to display.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--no-header`  
  Do not output the table header

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

* Print your user ID:  
  ```
  phar-4.20.5 auth:info id
  ```

* Print your email address:  
  ```
  phar-4.20.5 auth:info email
  ```

* Print your user ID (or nothing if not logged in):  
  ```
  phar-4.20.5 auth:info id --no-auto-login
  ```


