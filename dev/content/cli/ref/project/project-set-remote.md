---
title: "<code>project:set-remote</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

project:set-remote
------------------
Set the remote project for the current Git repository

Aliases: `set-remote`

## Usage:

```
upsun set-remote [<project>]
```

### Arguments

* `project` (optional)  
  The project ID

### Options

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

* Set the remote project for this repository to "abcdef123456":  
  ```
  phar-4.20.5 set-remote abcdef123456
  ```

* Unset the remote project for this repository:  
  ```
  phar-4.20.5 set-remote -
  ```


