---
title: "<code>environment:push</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

environment:push
----------------
Push code to an environment

Aliases: `push`

## Usage:

```
upsun push [--target TARGET] [-f|--force] [--force-with-lease] [-u|--set-upstream] [--activate] [--parent PARENT] [--type TYPE] [--no-clone-parent] [--resources-init RESOURCES-INIT] [-W|--no-wait] [--wait] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<source>]
```

### Arguments

* `source` (optional)  
  The Git source ref, e.g. a branch name or a commit hash.  
  Default: `'HEAD'``

### Options

* `--target` (expects a value)  
  The target branch name. Defaults to the current branch.

* `--force` (`-f`)  
  Allow non-fast-forward updates

* `--force-with-lease`  
  Allow non-fast-forward updates, if the remote-tracking branch is up to date

* `--set-upstream` (`-u`)  
  Set the target environment as the upstream for the source branch. This will also set the target project as the remote for the local repository.

* `--activate`  
  Activate the environment. Paused environments will be resumed. This will ensure the environment is active even if no changes were pushed.

* `--branch`  
  DEPRECATED: alias of --activate

* `--parent` (expects a value)  
  Set the environment parent (only used with --activate)

* `--type` (expects a value)  
  Set the environment type (only used with --activate )

* `--no-clone-parent`  
  Do not clone the parent branch's data (only used with --activate)

* `--resources-init` (expects a value)  
  Set the resources to use for new services: parent, default, minimum, or manual.
Currently the default is "default" but this will change to "parent" in future.

* `--no-wait` (`-W`)  
  Do not wait for the operation to complete

* `--wait`  
  Wait for the operation to complete (default)

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

* `--environment` (`-e`) (expects a value)  
  The environment ID. Use "." to select the project's default environment.

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

* Push code to the current environment:  
  ```
  phar-4.20.5 push 
  ```

* Push code, without waiting for deployment:  
  ```
  phar-4.20.5 push --no-wait
  ```

* Push code, branching or activating the environment as a child of 'develop':  
  ```
  phar-4.20.5 push --activate --parent develop
  ```


