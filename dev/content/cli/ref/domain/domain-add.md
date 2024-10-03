---
title: "<code>domain:add</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

domain:add
----------
Add a new domain to the project

## Usage:

```
upsun domain:add [--cert CERT] [--key KEY] [--chain CHAIN] [--attach ATTACH] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

### Arguments

* `name` (required)  
  The domain name

### Options

* `--cert` (expects a value)  
  The path to a custom certificate file

* `--key` (expects a value)  
  The path to the private key for the custom certificate

* `--chain` (multiple values allowed)  
  The path to the chain file(s) for the custom certificate

* `--attach` (expects a value)  
  The production domain that this one replaces in the environment's routes. Required for non-production environment domains.

* `--replace` (`-r`) (expects a value)  
  Deprecated: this has been renamed to --attach

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

* Add the domain example.com:  
  ```
  phar-4.20.5 domain:add example.com
  ```

* Add the domain example.org with a custom SSL/TLS certificate:  
  ```
  phar-4.20.5 domain:add example.org --cert example-org.crt --key example-org.key
  ```


