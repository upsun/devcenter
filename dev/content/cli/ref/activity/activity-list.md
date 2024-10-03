---
title: "<code>activity:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

activity:list
-------------
Get a list of activities for an environment or project

Aliases: `activities`, `act`

## Usage:

```
upsun activities [-t|--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [--limit LIMIT] [--start START] [--state STATE] [--result RESULT] [-i|--incomplete] [-a|--all] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

### Options

* `--type` (`-t`) (multiple values allowed)  
  Filter activities by type
For a list of types see: https://docs.upsun.com/integrations/activity/reference.html#type
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The first part of the activity name can be omitted, e.g. 'cron' can select 'environment.cron' activities.
The % or * characters can be used as a wildcard, e.g. '%var%' to select variable-related activities.

* `--exclude-type` (`-x`) (multiple values allowed)  
  Exclude activities by type.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The first part of the activity name can be omitted, e.g. 'cron' can exclude 'environment.cron' activities.
The % or * characters can be used as a wildcard to exclude types.

* `--limit` (expects a value)  
  Limit the number of results displayed  
  Default: `10`

* `--start` (expects a value)  
  Only activities created before this date will be listed

* `--state` (multiple values allowed)  
  Filter activities by state: in_progress, pending, complete, or cancelled.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--result` (expects a value)  
  Filter activities by result: success or failure

* `--incomplete` (`-i`)  
  Only list incomplete activities

* `--all` (`-a`)  
  List activities on all environments

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (`-c`) (multiple values allowed)  
  Columns to display.
Available columns: id*, created*, description*, progress*, state*, result*, completed, environments, time_build, time_deploy, time_execute, time_wait, type (* = default columns).
The character "+" can be used as a placeholder for the default columns.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--no-header`  
  Do not output the table header

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

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

* List recent activities for the current environment:  
  ```
  phar-4.20.5 activities 
  ```

* List all recent activities for the current project:  
  ```
  phar-4.20.5 activities --all
  ```

* List recent pushes:  
  ```
  phar-4.20.5 activities --type push
  ```

* List all recent activities excluding crons and redeploys:  
  ```
  phar-4.20.5 activities --exclude-type '*.cron,*.backup*'
  ```

* List pushes made before 15 March:  
  ```
  phar-4.20.5 activities --type push --start 2015-03-15
  ```

* List up to 25 incomplete activities:  
  ```
  phar-4.20.5 activities --limit 25 -i
  ```


