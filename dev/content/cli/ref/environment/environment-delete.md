---
title: "<code>environment:delete</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:delete
------------------
Delete one or more environments

## Usage:

```
upsun environment:delete [--delete-branch] [--no-delete-branch] [--type TYPE] [-t|--only-type ONLY-TYPE] [--exclude EXCLUDE] [--exclude-type EXCLUDE-TYPE] [--inactive] [--status STATUS] [--only-status ONLY-STATUS] [--exclude-status EXCLUDE-STATUS] [--merged] [--allow-delete-parent] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]...
```

When a Upsun environment is deleted, it will become "inactive": it will
exist only as a Git branch, containing code but no services, databases nor
files.

This command allows you to delete environments as well as their Git branches.

### Arguments

* `environment` (optional; multiple values allowed)  
  The environment(s) to delete.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

### Options

* `--delete-branch`  
  Delete Git branch(es) for inactive environments, without confirmation

* `--no-delete-branch`  
  Do not delete any Git branch(es) (inactive environments)

* `--type` (multiple values allowed)  
  Delete all environments of a type (adding to any others selected)
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--only-type` (`-t`) (multiple values allowed)  
  Only delete environments of a specific type
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--exclude` (multiple values allowed)  
  Environment(s) not to delete.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--exclude-type` (multiple values allowed)  
  Environment type(s) of which not to delete
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--inactive`  
  Delete all inactive environments (adding to any others selected)

* `--status` (multiple values allowed)  
  Delete all environments of a status (adding to any others selected)
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--only-status` (multiple values allowed)  
  Only delete environments of a specific status
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--exclude-status` (multiple values allowed)  
  Environment status(es) of which not to delete
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--merged`  
  Delete all merged environments (adding to any others selected)

* `--allow-delete-parent`  
  Allow environments that have children to be deleted

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

* Delete the currently checked out environment:  
  ```
  phar-4.20.5 environment:delete 
  ```

* Delete the environments "test" and "example-1":  
  ```
  phar-4.20.5 environment:delete test example-1
  ```

* Delete all inactive environments:  
  ```
  phar-4.20.5 environment:delete --inactive
  ```

* Delete all environments merged with their parent:  
  ```
  phar-4.20.5 environment:delete --merged
  ```


