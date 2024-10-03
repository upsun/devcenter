---
title: "<code>integration:add</code>"
type: docs
---

{{< callout >}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{< /callout >}}

integration:add
---------------
Add an integration to the project

## Usage:

```
upsun integration:add [--type TYPE] [--base-url BASE-URL] [--bitbucket-url BITBUCKET-URL] [--username USERNAME] [--token TOKEN] [--key KEY] [--secret SECRET] [--license-key LICENSE-KEY] [--server-project SERVER-PROJECT] [--repository REPOSITORY] [--build-merge-requests BUILD-MERGE-REQUESTS] [--build-pull-requests BUILD-PULL-REQUESTS] [--build-draft-pull-requests BUILD-DRAFT-PULL-REQUESTS] [--build-pull-requests-post-merge BUILD-PULL-REQUESTS-POST-MERGE] [--build-wip-merge-requests BUILD-WIP-MERGE-REQUESTS] [--merge-requests-clone-parent-data MERGE-REQUESTS-CLONE-PARENT-DATA] [--pull-requests-clone-parent-data PULL-REQUESTS-CLONE-PARENT-DATA] [--resync-pull-requests RESYNC-PULL-REQUESTS] [--fetch-branches FETCH-BRANCHES] [--prune-branches PRUNE-BRANCHES] [--resources-init RESOURCES-INIT] [--url URL] [--shared-key SHARED-KEY] [--file FILE] [--events EVENTS] [--states STATES] [--environments ENVIRONMENTS] [--excluded-environments EXCLUDED-ENVIRONMENTS] [--from-address FROM-ADDRESS] [--recipients RECIPIENTS] [--channel CHANNEL] [--routing-key ROUTING-KEY] [--category CATEGORY] [--index INDEX] [--sourcetype SOURCETYPE] [--protocol PROTOCOL] [--syslog-host SYSLOG-HOST] [--syslog-port SYSLOG-PORT] [--facility FACILITY] [--message-format MESSAGE-FORMAT] [--auth-mode AUTH-MODE] [--auth-token AUTH-TOKEN] [--verify-tls VERIFY-TLS] [--header HEADER] [-p|--project PROJECT] [-W|--no-wait] [--wait]
```

### Options

* `--type` (expects a value)  
  The integration type ('bitbucket', 'bitbucket_server', 'github', 'gitlab', 'webhook', 'health.email', 'health.pagerduty', 'health.slack', 'health.webhook', 'httplog', 'script', 'newrelic', 'splunk', 'sumologic', 'syslog')

* `--base-url` (expects a value)  
  The base URL of the server installation

* `--bitbucket-url` (expects a value)  
  The base URL of the Bitbucket Server installation

* `--username` (expects a value)  
  The Bitbucket Server username

* `--token` (expects a value)  
  An authentication or access token for the integration

* `--key` (expects a value)  
  A Bitbucket OAuth consumer key

* `--secret` (expects a value)  
  A Bitbucket OAuth consumer secret

* `--license-key` (expects a value)  
  The New Relic Logs license key

* `--server-project` (expects a value)  
  The project (e.g. 'namespace/repo')

* `--repository` (expects a value)  
  The repository to track (e.g. 'owner/repository')

* `--build-merge-requests` (expects a value)  
  GitLab: build merge requests as environments  
  Default: `true`

* `--build-pull-requests` (expects a value)  
  Build every pull request as an environment  
  Default: `true`

* `--build-draft-pull-requests` (expects a value)  
  Build draft pull requests  
  Default: `true`

* `--build-pull-requests-post-merge` (expects a value)  
  Build pull requests based on their post-merge state

* `--build-wip-merge-requests` (expects a value)  
  GitLab: build WIP merge requests  
  Default: `true`

* `--merge-requests-clone-parent-data` (expects a value)  
  GitLab: clone data for merge requests  
  Default: `true`

* `--pull-requests-clone-parent-data` (expects a value)  
  Clone the parent environment's data for pull requests  
  Default: `true`

* `--resync-pull-requests` (expects a value)  
  Re-sync pull request environment data on every build

* `--fetch-branches` (expects a value)  
  Fetch all branches from the remote (as inactive environments)  
  Default: `true`

* `--prune-branches` (expects a value)  
  Delete branches that do not exist on the remote  
  Default: `true`

* `--resources-init` (expects a value)  
  The resources to use when initializing a new service ('minimum', 'default', 'manual', 'parent')  
  Default: `'parent'`

* `--url` (expects a value)  
  The URL or API endpoint for the integration

* `--shared-key` (expects a value)  
  Webhook: the JWS shared secret key

* `--file` (expects a value)  
  The name of a local file that contains the script to upload

* `--events` (multiple values allowed)  
  A list of events to act on, e.g. environment.push  
  Default: `array (
  0 => '*',
)`

* `--states` (multiple values allowed)  
  A list of states to act on, e.g. pending, in_progress, complete  
  Default: `array (
  0 => 'complete',
)`

* `--environments` (multiple values allowed)  
  The environment IDs to include  
  Default: `array (
  0 => '*',
)`

* `--excluded-environments` (multiple values allowed)  
  The environment IDs to exclude

* `--from-address` (expects a value)  
  [Optional] Custom From address for alert emails

* `--recipients` (multiple values allowed)  
  The recipient email address(es)

* `--channel` (expects a value)  
  The Slack channel

* `--routing-key` (expects a value)  
  The PagerDuty routing key

* `--category` (expects a value)  
  The Sumo Logic category, used for filtering

* `--index` (expects a value)  
  The Splunk index

* `--sourcetype` (expects a value)  
  The Splunk event source type

* `--protocol` (expects a value)  
  Syslog transport protocol ('tcp', 'udp', 'tls')  
  Default: `'tls'`

* `--syslog-host` (expects a value)  
  Syslog relay/collector host

* `--syslog-port` (expects a value)  
  Syslog relay/collector port

* `--facility` (expects a value)  
  Syslog facility  
  Default: `1`

* `--message-format` (expects a value)  
  Syslog message format ('rfc3164' or 'rfc5424')  
  Default: `'rfc5424'`

* `--auth-mode` (expects a value)  
  Authentication mode ('prefix' or 'structured_data')  
  Default: `'prefix'`

* `--auth-token` (expects a value)  
  Authentication token

* `--verify-tls` (expects a value)  
  Whether HTTPS certificate verification should be enabled (recommended)  
  Default: `true`

* `--header` (multiple values allowed)  
  HTTP header(s) to use in POST requests. Separate names and values with a colon (:).

* `--project` (`-p`) (expects a value)  
  The project ID or URL

* `--host` (expects a value)  
  Deprecated option, no longer used

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

* Add an integration with a GitHub repository:  
  ```
  phar-4.20.5 integration:add --type github --repository myuser/example-repo --token 9218376e14c2797e0d06e8d2f918d45f --fetch-branches 0
  ```

* Add an integration with a GitLab repository:  
  ```
  phar-4.20.5 integration:add --type gitlab --server-project mygroup/example-repo --token 22fe4d70dfbc20e4f668568a0b5422e2 --base-url https://gitlab.example.com
  ```


