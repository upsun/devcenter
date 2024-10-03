---
title: "<code>db:dump</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

db:dump
-------
Create a local dump of the remote database

## Usage:

```
upsun db:dump [--schema SCHEMA] [-f|--file FILE] [-d|--directory DIRECTORY] [-z|--gzip] [-t|--timestamp] [-o|--stdout] [--table TABLE] [--exclude-table EXCLUDE-TABLE] [--schema-only] [--charset CHARSET] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-r|--relationship RELATIONSHIP]
```

### Options

* `--schema` (expects a value)  
  The schema to dump. Omit to use the default schema (usually "main").

* `--file` (`-f`) (expects a value)  
  A custom filename for the dump

* `--directory` (`-d`) (expects a value)  
  A custom directory for the dump

* `--gzip` (`-z`)  
  Compress the dump using gzip

* `--timestamp` (`-t`)  
  Add a timestamp to the dump filename

* `--stdout` (`-o`)  
  Output to STDOUT instead of a file

* `--table` (multiple values allowed)  
  Table(s) to include

* `--exclude-table` (multiple values allowed)  
  Table(s) to exclude

* `--schema-only`  
  Dump only schemas, no data

* `--charset` (expects a value)  
  The character set encoding for the dump

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

* Create an SQL dump file:  
  ```
  phar-4.20.5 db:dump 
  ```

* Create a gzipped SQL dump file named "dump.sql.gz":  
  ```
  phar-4.20.5 db:dump --gzip -f dump.sql.gz
  ```


