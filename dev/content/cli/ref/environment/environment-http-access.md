---
title: "<code>environment:http-access</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:http-access
-----------------------
Update HTTP access settings for an environment

Aliases: `httpaccess`

## Usage:

```
upsun httpaccess [--access ACCESS] [--auth AUTH] [--enabled ENABLED] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait]
```

### Options

* `--access` (multiple values allowed)  
  Access restriction in the format "permission:address". Use 0 to clear all addresses.

* `--auth` (multiple values allowed)  
  HTTP Basic auth credentials in the format "username:password". Use 0 to clear all credentials.

* `--enabled` (expects a value)  
  Whether access control should be enabled: 1 to enable, 0 to disable

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

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

* Require a username and password:  
  ```
  phar-4.20.5 httpaccess --auth myname:mypassword
  ```

* Restrict access to only one IP address:  
  ```
  phar-4.20.5 httpaccess --access allow:69.208.1.192 --access deny:any
  ```

* Remove the password requirement, keeping IP restrictions:  
  ```
  phar-4.20.5 httpaccess --auth 0
  ```

* Disable all HTTP access control:  
  ```
  phar-4.20.5 httpaccess --enabled 0
  ```


