---
title: "<code>user:add</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

user:add
--------
Add a user to the project

## Usage:

```
upsun user:add [-r|--role ROLE] [--force-invite] [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<email>]
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

* `--force-invite`  
  Send an invitation, even if one has already been sent

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

* Add Alice as a project admin:  
  ```
  phar-4.20.5 user:add alice@example.com -r admin
  ```

* Add Bob as a viewer on the "production" environment type, and a contributor on "development" environments:  
  ```
  phar-4.20.5 user:add bob@example.com -r production:v -r development:c
  ```

* Add Charlie as viewer on "production" and "development":  
  ```
  phar-4.20.5 user:add charlie@example.com -r prod%:v -r dev%:v
  ```


