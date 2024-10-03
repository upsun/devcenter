---
title: "<code>team:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

team:list
---------
List teams

Aliases: `teams`

## Usage:

```
upsun teams [-c|--count COUNT] [--sort SORT] [--reverse] [-o|--org ORG] [-p|--project PROJECT] [--date-fmt DATE-FMT] [--format FORMAT] [--columns COLUMNS] [--no-header]
```

### Options

* `--count` (`-c`) (expects a value)  
  The number of items to display per page. Use 0 to disable pagination.

* `--sort` (expects a value)  
  A team property to sort by  
  Default: `'label'`

* `--reverse`  
  Sort in reverse order

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

* `--project` (`-p`) (expects a value)  
  The project ID or URL, to auto-select the organization if --org is not used

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (multiple values allowed)  
  Columns to display.
Available columns: id*, label*, member_count*, project_count*, project_permissions*, created_at, updated_at (* = default columns).
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


