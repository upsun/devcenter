---
title: "<code>user:update</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

user:update
-----------
Update user role(s) on a project

## Usage:

```
upsun user:update [-r|--role ROLE] [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<email>]
```

### Arguments

* `email` (optional)  
  The user's email address

### Options

* `--role` (`-r`) (multiple values allowed)  
  The user's project role ('admin' or 'viewer') or environment type role (e.g. 'staging:contributor' or 'production:viewer').
To remove a user from an environment type, set the role as 'none'.
The % or * characters can be used as a wildcard for the environment type, e.g. '%:viewer' to give the user the 'viewer' role on all types.
The role can be abbreviated, e.g. 'production:v'.

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

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

## Examples

* Make Bob an admin on the "development" and "staging" environment types:  
  ```
  phar-4.20.5 user:update bob@example.com -r development:a,staging:a
  ```

* Make Charlie a contributor on all environment types:  
  ```
  phar-4.20.5 user:update charlie@example.com -r %:c
  ```


