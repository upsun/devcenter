---
title: "<code>repo:cat</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

repo:cat
--------
Read a file in the project repository

## Usage:

```
upsun repo:cat [-c|--commit COMMIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] <path>
```

### Arguments

* `path` (required)  
  The path to the file

### Options

* `--commit` (`-c`) (expects a value)  
  The commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.

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

* Read the services configuration file:  
  ```
  phar-4.20.5 repo:cat .upsun/services.yaml
  ```

