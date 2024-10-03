---
title: "<code>organization:user:add</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

organization:user:add
---------------------
Invite a user to an organization

## Usage:

```
upsun organization:user:add [-o|--org ORG] [--permission PERMISSION] [--] [<email>]
```

### Arguments

* `email` (optional)  
  The email address of the user

### Options

* `--org` (`-o`) (expects a value)  
  The organization name (or ID)

* `--permission` (multiple values allowed)  
  Permission(s) for the user on the organization. 
Valid permissions are: billing, members, plans, projects:create, projects:list

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


