---
title: "<code>team:project:add</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

team:project:add
----------------
Add project(s) to a team

## Usage:

```
upsun team:project:add [--all] [-o|--org ORG] [-t|--team TEAM] [--] [<projects>]...
```

### Arguments

* `projects` (optional; multiple values allowed)  
  The project ID(s).
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

### Options

* `--all`  
  Add all the projects that currently exist in the organization

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

* `--team` (`-t`) (expects a value)  
  The team ID

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


