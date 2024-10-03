---
title: "<code>certificate:list</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

certificate:list
----------------
List project certificates

Aliases: `certificates`, `certs`

## Usage:

```
upsun certificates [--domain DOMAIN] [--exclude-domain EXCLUDE-DOMAIN] [--issuer ISSUER] [--only-auto] [--no-auto] [--ignore-expiry] [--only-expired] [--no-expired] [--pipe-domains] [--date-fmt DATE-FMT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT]
```

### Options

* `--domain` (expects a value)  
  Filter by domain name (case-insensitive search)

* `--exclude-domain` (expects a value)  
  Exclude certificates, matching by domain name (case-insensitive search)

* `--issuer` (expects a value)  
  Filter by issuer

* `--only-auto`  
  Show only auto-provisioned certificates

* `--no-auto`  
  Show only manually added certificates

* `--ignore-expiry`  
  Show both expired and non-expired certificates

* `--only-expired`  
  Show only expired certificates

* `--no-expired`  
  Show only non-expired certificates (default)

* `--pipe-domains`  
  Only return a list of domain names covered by the certificates

* `--date-fmt` (expects a value)  
  The date format (as a PHP date format string)  
  Default: `'c'`

* `--format` (expects a value)  
  The output format: table, csv, tsv, or plain  
  Default: `'table'`

* `--columns` (`-c`) (multiple values allowed)  
  Columns to display.
Available columns: created, domains, expires, id, issuer.
The % or * characters may be used as a wildcard.
Values may be split by commas (e.g. "a,b,c") and/or whitespace.

* `--no-header`  
  Do not output the table header

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

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

* Output a list of domains covered by valid certificates:  
  ```
  phar-4.20.5 certificates --pipe-domains --no-expired
  ```


