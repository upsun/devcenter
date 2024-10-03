---
title: "<code>service:redis-cli</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

service:redis-cli
-----------------
Access the Redis CLI

Aliases: `redis`

## Usage:

```
upsun redis [-r|--relationship RELATIONSHIP] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--] [<args>]
```

### Arguments

* `args` (optional)  
  Arguments to add to the Redis command

### Options

* `--relationship` (`-r`) (expects a value)  
  The service relationship to use

* `--identity-file` (`-i`) (expects a value)  
  Deprecated: an SSH identity (private key) to use. The auto-generated certificate is recommended instead.

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

* `--app` (`-A`) (expects a value)  
  The remote application name

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

* Open the redis-cli shell:  
  ```
  phar-4.20.5 redis 
  ```

* Ping the Redis server:  
  ```
  phar-4.20.5 redis ping
  ```

* Show Redis status information:  
  ```
  phar-4.20.5 redis info
  ```

* Scan keys:  
  ```
  phar-4.20.5 redis -- --scan
  ```

* Scan keys matching a pattern:  
  ```
  phar-4.20.5 redis -- "--scan --pattern '*-11*'"
  ```


