---
title: "<code>auth:browser-login</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

auth:browser-login
------------------
Log in to Upsun via a browser

Aliases: `login`

## Usage:

```
upsun login [-f|--force] [--method METHOD] [--max-age MAX-AGE] [--browser BROWSER] [--pipe]
```

Use this command to log in to the Upsun CLI using a web browser.

It launches a temporary local website which redirects you to log in if
necessary, and then captures the resulting authorization code.

Your system's default browser will be used. You can override this using the
--browser option.

Alternatively, to log in using an API token (without a browser), run:
upsun auth:api-token-login

To authenticate non-interactively, configure an API token using the
UPSUN_CLI_TOKEN environment variable.

### Options

* `--force` (`-f`)  
  Log in again, even if already logged in

* `--method` (multiple values allowed)  
  Require specific authentication method(s)

* `--max-age` (expects a value)  
  The maximum age (in seconds) of the web authentication session

* `--browser` (expects a value)  
  The browser to use to open the URL. Set 0 for none.

* `--pipe`  
  Output the URL to stdout.

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


