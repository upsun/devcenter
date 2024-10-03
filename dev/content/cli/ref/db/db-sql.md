---
title: "<code>db:sql</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

db:sql
------
Run SQL on the remote database

Aliases: `sql`

## Usage:

```
upsun sql [--raw] [--schema SCHEMA] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-r|--relationship RELATIONSHIP] [--] [<query>]
```

### Arguments

* `query` (optional)  
  An SQL statement to execute

### Options

* `--raw`  
  Produce raw, non-tabular output

* `--schema` (expects a value)  
  The schema to use. Omit to use the default schema (usually "main"). Pass an empty string to not use any schema.

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--app` (`-A`) (expects a value)  
  The remote application name

* `--relationship` (`-r`) (expects a value)  
  The service relationship to use

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

* Open an SQL console on the remote database:  
  ```
  phar-4.20.5 sql 
  ```

* View tables on the remote database:  
  ```
  phar-4.20.5 sql 'SHOW TABLES'
  ```

* Import a dump file into the remote database:  
  ```
  phar-4.20.5 sql < dump.sql
  ```


