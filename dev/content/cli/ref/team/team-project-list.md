---
title: "<code>team:project:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

team:project:list
-----------------
List projects in a team

Aliases: `team:projects`, `team:pro`

## Usage:

```
upsun team:projects [-c|--count COUNT] [-o|--org ORG] [-t|--team TEAM] [--date-fmt DATE-FMT] [--format FORMAT] [--columns COLUMNS] [--no-header]
```

### Options

* `--count` (`-c`) (expects a value)  
  The number of items to display per page (max: 200). Use 0 to disable pagination

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

* `--team` (`-t`) (expects a value)  
  The team ID

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (multiple values allowed)  
  Columns to display.
Available columns: id*, title*, granted_at*, updated_at (* = default columns).
The character "+" can be used as a placeholder for the default columns.
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


