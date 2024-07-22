---
title: activity:cancel
weight: something
type: docs
---


Cancel an activity

## Usage:

```
upsun activity:cancel [-t|--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [-a|--all] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<id>]
```

### Arguments

* `id` (optional)  
  The activity ID. Defaults to the most recent cancellable activity.

### Options

* `--type` (`-t`) (multiple values allowed)  
  Filter by type (when selecting a default activity).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The % or * characters can be used as a wildcard for the type, e.g. '%var%' to select variable-related activities.

* `--exclude-type` (`-x`) (multiple values allowed)  
  Exclude by type (when selecting a default activity).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The % or * characters can be used as a wildcard to exclude types.

* `--all` (`-a`)  
  Check recent activities on all environments (when selecting a default activity)

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


