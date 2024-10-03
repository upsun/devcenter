---
title: "<code>project:get</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

project:get
-----------
Clone a project locally

Aliases: `get`

## Usage:

```
upsun get [-e|--environment ENVIRONMENT] [--depth DEPTH] [-p|--project PROJECT] [--] [<project>] [<directory>]
```

### Arguments

* `project` (optional)  
  The project ID

* `directory` (optional)  
  The directory to clone to. Defaults to the project title

### Options

* `--environment` (`-e`) (expects a value)  
  The environment ID to clone. Defaults to the project default, or the first available environment

* `--depth` (expects a value)  
  Create a shallow clone: limit the number of commits in the history

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--identity-file` (`-i`) (expects a value)  
  Deprecated: an SSH identity (private key) to use. The auto-generated certificate is recommended instead.

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

* Clone the project "abc123" into the directory "my-project":  
  ```
  phar-4.20.5 get abc123 my-project
  ```


