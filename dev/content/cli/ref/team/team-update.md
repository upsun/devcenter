---
title: "<code>team:update</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

team:update
-----------
Update a team

## Usage:

```
upsun team:update [--label LABEL] [--no-check-unique] [-r|--role ROLE] [-t|--team TEAM] [-o|--org ORG] [-W|--no-wait] [--wait]
```

### Options

* `--label` (expects a value)  
  Set a new team label

* `--no-check-unique`  
  Do not error if another team exists with the same label in the organization

* `--role` (`-r`) (multiple values allowed)  
  Set the team's project and environment type roles
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The % or * characters may be used as a wildcard.

* `--team` (`-t`) (expects a value)  
  The team ID

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

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


