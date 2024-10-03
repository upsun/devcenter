---
title: "<code>team:create</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

team:create
-----------
Create a new team

## Usage:

```
upsun team:create [--label LABEL] [--no-check-unique] [-r|--role ROLE] [--output-id] [-o|--org ORG]
```

### Options

* `--label` (expects a value)  
  The team label

* `--no-check-unique`  
  Do not error if another team exists with the same label in the organization

* `--role` (`-r`) (multiple values allowed)  
  Set the team's project and environment type roles
Values may be split by commas (e.g. "a,b,c") and/or whitespace.
The % or * characters may be used as a wildcard.

* `--output-id`  
  Output the new team's ID to stdout (instead of displaying the team info)

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

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


