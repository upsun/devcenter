---
title: "<code>organization:subscription:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

organization:subscription:list
------------------------------
List subscriptions within an organization

Aliases: `org:subs`

## Usage:

```
upsun org:subs [--page PAGE] [-c|--count COUNT] [-o|--org ORG] [-p|--project PROJECT] [--format FORMAT] [--columns COLUMNS] [--no-header]
```

### Options

* `--page` (expects a value)  
  Page number. This enables pagination, despite configuration or --count.

* `--count` (`-c`) (expects a value)  
  The number of items to display per page. Use 0 to disable pagination. Ignored if --page is specified.

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

* `--project` (`-p`) (expects a value)  
  The project ID or URL, to auto-select the organization if --org is not used

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (multiple values allowed)  
  Columns to display.
Available columns: id*, project_id*, project_title*, project_region*, created_at, updated_at (* = default columns).
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


