---
title: "<code>commit:get</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

commit:get
----------
Show commit details

## Usage:

```
upsun commit:get [-P|--property PROPERTY] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--date-fmt DATE-FMT] [--] [<commit>]
```

### Arguments

* `commit` (optional)  
  The commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.  
  Default: `'HEAD'``

### Options

* `--property` (`-P`) (expects a value)  
  The commit property to display.

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

* `--format` (expects a value)  
  DEPRECATED

* `--columns` (multiple values allowed)  
  DEPRECATED

* `--no-header`  
  DEPRECATED

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

* Display the current commit on the environment:  
  ```
  phar-4.20.5 commit:get 
  ```

* Display the previous commit:  
  ```
  phar-4.20.5 commit:get HEAD~
  ```

* Display the 3rd commit before the current one:  
  ```
  phar-4.20.5 commit:get HEAD~3
  ```

* Display the email address of the last commit author:  
  ```
  phar-4.20.5 commit:get -P author.email
  ```


