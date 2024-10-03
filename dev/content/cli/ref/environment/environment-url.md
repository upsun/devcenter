---
title: "<code>environment:url</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:url
---------------
Get the public URLs of an environment

Aliases: `url`

## Usage:

```
upsun url [-1|--primary] [--browser BROWSER] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

### Options

* `--primary` (`-1`)  
  Only return the URL for the primary route

* `--browser` (expects a value)  
  The browser to use to open the URL. Set 0 for none.

* `--pipe`  
  Output the URL to stdout.

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

* Give a choice of URLs to open (or print all URLs if there is no browser):  
  ```
  phar-4.20.5 url 
  ```

* Print all URLs:  
  ```
  phar-4.20.5 url --pipe
  ```

* Print and/or open the primary route URL:  
  ```
  phar-4.20.5 url --primary
  ```

* Print the primary route URL:  
  ```
  phar-4.20.5 url --primary --pipe
  ```


