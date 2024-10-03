---
title: "<code>environment:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:list
----------------
Get a list of environments

Aliases: `environments`, `env`

## Usage:

```
upsun environments [-I|--no-inactive] [--status STATUS] [--pipe] [--refresh REFRESH] [--sort SORT] [--reverse] [--type TYPE] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT]
```

### Options

* `--no-inactive` (`-I`)  
  Do not show inactive environments

* `--status` (multiple values allowed)  
  Filter environments by status (active, inactive, dirty, paused, deleting).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--pipe`  
  Output a simple list of environment IDs.

* `--refresh` (expects a value)  
  Whether to refresh the list.  
  Default: `1`

* `--sort` (expects a value)  
  A property to sort by  
  Default: `'title'`

* `--reverse`  
  Sort in reverse (descending) order

* `--type` (multiple values allowed)  
  Filter the list by environment type(s).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (`-c`) (multiple values allowed)  
  Columns to display.
Available columns: id*, title*, status*, type*, created, machine_name, updated (* = default columns).
The character "+" can be used as a placeholder for the default columns.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--no-header`  
  Do not output the table header

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
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


