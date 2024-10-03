---
title: "<code>variable:update</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

variable:update
---------------
Update a variable

## Usage:

```
upsun variable:update [--allow-no-change] [-l|--level LEVEL] [--value VALUE] [--json JSON] [--sensitive SENSITIVE] [--enabled ENABLED] [--inheritable INHERITABLE] [--visible-build VISIBLE-BUILD] [--visible-runtime VISIBLE-RUNTIME] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

### Arguments

* `name` (required)  
  The variable name

### Options

* `--allow-no-change`  
  Return success (zero exit code) if no changes were provided

* `--level` (`-l`) (expects a value)  
  The variable level ('project', 'environment', 'p' or 'e')

* `--value` (expects a value)  
  The variable's value

* `--json` (expects a value)  
  Whether the variable value is JSON-formatted

* `--sensitive` (expects a value)  
  Whether the variable value is sensitive

* `--enabled` (expects a value)  
  Whether the variable should be enabled on the environment  
  Default: `true`

* `--inheritable` (expects a value)  
  Whether the variable is inheritable by child environments  
  Default: `true`

* `--visible-build` (expects a value)  
  Whether the variable should be visible at build time

* `--visible-runtime` (expects a value)  
  Whether the variable should be visible at runtime  
  Default: `true`

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


