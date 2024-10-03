---
title: "<code>project:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

project:list
------------
Get a list of all active projects

Aliases: `projects`, `pro`

## Usage:

```
upsun projects [--pipe] [--region REGION] [--title TITLE] [--my] [--refresh REFRESH] [--sort SORT] [--reverse] [--page PAGE] [-c|--count COUNT] [-o|--org ORG] [--format FORMAT] [--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

### Options

* `--pipe`  
  Output a simple list of project IDs. Disables pagination.

* `--region` (expects a value)  
  Filter by region (exact match)

* `--host` (expects a value)  
  Deprecated: replaced by --region

* `--title` (expects a value)  
  Filter by title (case-insensitive search)

* `--my`  
  Display only the projects you own (through organizations you own)

* `--refresh` (expects a value)  
  Whether to refresh the list  
  Default: `1`

* `--sort` (expects a value)  
  A property to sort by  
  Default: `'title'`

* `--reverse`  
  Sort in reverse (descending) order

* `--page` (expects a value)  
  Page number. This enables pagination, despite configuration or --count. Ignored if --pipe is specified.

* `--count` (`-c`) (expects a value)  
  The number of projects to display per page. Use 0 to disable pagination. Ignored if --page is specified.

* `--org` (`-o`) (expects a value)  
  Filter by organization name or ID

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (multiple values allowed)  
  Columns to display.
Available columns: id*, title*, region*, organization_name*, created_at, organization_id, organization_label, status (* = default columns).
The character "+" can be used as a placeholder for the default columns.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--no-header`  
  Do not output the table header

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

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


