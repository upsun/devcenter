---
title: "<code>activity:log</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

activity:log
------------
Display the log for an activity

## Usage:

```
upsun activity:log [--refresh REFRESH] [-t|--timestamps] [--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [--state STATE] [--result RESULT] [-i|--incomplete] [-a|--all] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<id>]
```

### Arguments

* `id` (optional)  
  The activity ID. Defaults to the most recent activity.

### Options

* `--refresh` (expects a value)  
  Activity refresh interval (seconds). Set to 0 to disable refreshing.  
  Default: `3`

* `--timestamps` (`-t`)  
  Display a timestamp next to each message

* `--type` (multiple values allowed)  
  Filter by type (when selecting a default activity).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The % or * characters can be used as a wildcard for the type, e.g. '%var%' to select variable-related activities.

* `--exclude-type` (`-x`) (multiple values allowed)  
  Exclude by type (when selecting a default activity).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The % or * characters can be used as a wildcard to exclude types.

* `--state` (multiple values allowed)  
  Filter by state (when selecting a default activity): in_progress, pending, complete, or cancelled.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--result` (expects a value)  
  Filter by result (when selecting a default activity): success or failure

* `--incomplete` (`-i`)  
  Include only incomplete activities (when selecting a default activity).
This is a shorthand for --state=in_progress,pending

* `--all` (`-a`)  
  Check recent activities on all environments (when selecting a default activity)

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

* Display the log for the last push on the current environment:  
  ```
  phar-4.20.5 activity:log --type environment.push
  ```

* Display the log for the last activity on the current project:  
  ```
  phar-4.20.5 activity:log --all
  ```

* Display the log for the last push, with microsecond timestamps:  
  ```
  phar-4.20.5 activity:log -a -t --type %push --date-fmt 'Y-m-d\TH:i:s.uP'
  ```


