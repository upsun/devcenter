---
title: "<code>metrics:all</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

metrics:all
-----------
Show CPU, disk and memory metrics for an environment

Aliases: `metrics`, `met`

## Usage:

```
upsun metrics [-B|--bytes] [-r|--range RANGE] [-i|--interval INTERVAL] [--to TO] [-1|--latest] [-s|--service SERVICE] [--type TYPE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

### Options

* `--bytes` (`-B`)  
  Show sizes in bytes

* `--range` (`-r`) (expects a value)  
  The time range. Metrics will be loaded for this duration until the end time (--to).
You can specify units: hours (h), minutes (m), or seconds (s).
Minimum 5m, maximum 8h or more (depending on the project), default 10m.

* `--interval` (`-i`) (expects a value)  
  The time interval. Defaults to a division of the range.
You can specify units: hours (h), minutes (m), or seconds (s).
Minimum 1m.

* `--to` (expects a value)  
  The end time. Defaults to now.

* `--latest` (`-1`)  
  Show only the latest single data point

* `--service` (`-s`) (multiple values allowed)  
  Filter by service or application name
The % or * characters may be used as a wildcard.

* `--type` (multiple values allowed)  
  Filter by service type (if --service is not provided). The version is not required.
The % or * characters may be used as a wildcard.

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (`-c`) (multiple values allowed)  
  Columns to display.
Available columns: timestamp*, service*, cpu_percent*, mem_percent*, disk_percent*, tmp_disk_percent*, cpu_limit, cpu_used, disk_limit, disk_used, inodes_limit, inodes_percent, inodes_used, mem_limit, mem_used, tmp_disk_limit, tmp_disk_used, tmp_inodes_limit, tmp_inodes_percent, tmp_inodes_used, type (* = default columns).
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

## Examples

* Show metrics for the last 10m:  
  ```
  phar-4.20.5 metrics 
  ```

* Show metrics in five-minute intervals over the last hour:  
  ```
  phar-4.20.5 metrics -i 5m -r 1h
  ```

* Show metrics for all SQL services:  
  ```
  phar-4.20.5 metrics --type mariadb,%sql
  ```

