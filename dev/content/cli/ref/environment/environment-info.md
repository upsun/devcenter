---
title: "<code>environment:info</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:info
----------------
Read or set properties for an environment

## Usage:

```
upsun environment:info [--refresh] [--date-fmt DATE-FMT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<property>] [<value>]
```

### Arguments

* `property` (optional)  
  The name of the property

* `value` (optional)  
  Set a new value for the property

### Options

* `--refresh`  
  Whether to refresh the cache

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (`-c`) (multiple values allowed)  
  Columns to display.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--no-header`  
  Do not output the table header

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

* Read all environment properties:  
  ```
  phar-4.20.5 environment:info 
  ```

* Show the environment's status:  
  ```
  phar-4.20.5 environment:info status
  ```

* Show the date the environment was created:  
  ```
  phar-4.20.5 environment:info created_at
  ```

* Enable email sending:  
  ```
  phar-4.20.5 environment:info enable_smtp true
  ```

* Change the environment title:  
  ```
  phar-4.20.5 environment:info title "New feature"
  ```

* Change the environment's parent branch:  
  ```
  phar-4.20.5 environment:info parent sprint-2
  ```

* Unset the environment's parent branch:  
  ```
  phar-4.20.5 environment:info parent -
  ```


