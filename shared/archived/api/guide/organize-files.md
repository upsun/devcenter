---
title: Add a project domain
weight: 1
prev: /docs/guide
type: docs
---

{{% custom/endpoint method="post" path="/projects/{projectId}/domains" %}}

Add a single domain to a project. If the `ssl` field is left blank without an object containing a PEM-encoded SSL certificate, a certificate will be [provisioned for you via Let's Encrypt](https://docs.platform.sh/configuration/routes/https.html#lets-encrypt).

```bash
https://api.upsun.com/projects/{projectId}/domains
```

{{% details title="Related" %}}

Below are details for using the Upsun API to execute this action.
Please see the following related documentation for other methods and examples.

<ul class="api-details">
  <li>{{< icon name="code" attributes="class=\"required-icon\"" >}} <a href="/configuration/routes/https.html#lets-encrypt"><code>upsun domain:add</code>: Add a new domain to the project</a>
  </li>
  <li>{{< icon name="desktop-computer" attributes="class=\"required-icon\"" >}} <a href="/configuration/routes/https.html#lets-encrypt">Console: managing domains</a>
  </li>
</ul>

{{% /details %}}

## Requests 

### Authorizations

{{% details title=OAuth2 closed="true" %}}

<ul class="api-details">
  <li>{{< icon name="lock-closed" attributes="class=\"required-icon\"" >}} <strong>OAuth2</strong>: OAuth2</li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Flow type</strong>: <code>authorizationCode</code></li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Authorization URL</strong>: <code>https://auth.api.platform.sh/oauth2/authorize</code></li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Token URL</strong>: <code>https://auth.api.platform.sh/oauth2/token</code></li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Refresh URL</strong>: <code>https://auth.api.platform.sh/oauth2/token</code></li>
</ul>

{{% /details %}}

### Path paramaters

<ul class="api-details api-details-underlined">
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <strong><code>projectId</code></strong> <span class="api-type">string</span> 
  
  <p style="margin-top: 0.5rem;">Unique project ID</p>
  
  </li>
</ul>

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">parameter is required.</span>

### Request body

One of:

{{% details title=ProdDomainStorageCreateInput closed="true" %}}

**Request body schema:** `application/json`

<ul class="api-details api-details-underlined">
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <strong><code>name</code></strong> <span class="api-type">string</span>
  
  <p style="margin-top: 0.5rem;">Domain name</p>
  
  </li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong><code>attributes</code></strong> <span class="api-type">object</span>
  
  <p style="margin-top: 0.5rem;">Arbitrary attributes attached to this resource</p>
  
  </li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong><code>is_default</code></strong> <span class="api-type">boolean</span>
  
  <p style="margin-top: 0.5rem;">Is this domain default</p>
  
  </li>
</ul>

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">denotes parameter is required.</span>

#### Example 

**Content type:** `application/json`

```json
{
  "name": "string",
  "attributes": {
    "property1": "string",
    "property2": "string"
  },
  "is_default": true
}
```

{{% /details %}}

{{% details title=ReplacementDomainStorageCreateInput closed="true" %}}

<ul class="api-details api-details-underlined">
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <strong><code>name</code></strong> <span class="api-type">string</span>
  
  <p style="margin-top: 0.5rem;">Domain name</p>
  
  </li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong><code>attributes</code></strong> <span class="api-type">object</span>
  
  <p style="margin-top: 0.5rem;">Arbitrary attributes attached to this resource</p>
  
  </li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong><code>replacement_for</code></strong> <span class="api-type">string</span>
  
  <p style="margin-top: 0.5rem;">Prod domain which will be replaced by this domain</p>
  
  </li>
</ul>

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">denotes parameter is required.</span>

#### Example 

**Content type:** `application/json`

```json
{
  "name": "string",
  "attributes": {
    "property1": "string",
    "property2": "string"
  },
  "replacement_for": "string"
}
```

{{% /details %}}

## Responses

{{% details title=default closed="true" %}}

**Response schema**: `application/json`

<ul class="api-details api-details-underlined">
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <strong><code>status</code></strong> <span class="api-type">string</span>
  
  <p style="margin-top: 0.5rem;">The status text of the response</p>
  
  </li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong><code>code</code></strong> <span class="api-type">integer</span>
  
  <p style="margin-top: 0.5rem;">The status code of the response</p>
  
  </li>
</ul>

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">denotes parameter is required.</span>

#### Example 

**Content type:** `application/json`

```json
{
  "status": "string",
  "code": 0
}
```

{{% /details %}}

## Examples

{{< callout type="warning" >}}
  Most, if not all, of the examples below assume that you have already [created an API token](/configuration/routes/https.html#lets-encrypt), and that you have exported it to a local environment variable `PLATFORM_CLI_TOKEN`. Additional assumptions will be addressed inline.
{{< /callout >}}

{{< tabs items="CLI,cURL,Elixir,Go,Java,JS,PHP,Python,Ruby,Rust,Wget" >}}

  {{< tab >}}

  Both examples below assume that you are 
  
  - in a project directory
  - that has an Upsun project as a remote repository (`upsun project:set-remote`)
  - that you are logged in (`upsun login`).

  **Using the built-in command**

  ```bash
  upsun domain:add example.com
  ```

  > View the CLI documentation for [`upsun domain:add`](/configuration/routes/https.html#lets-encrypt).

  **Using `api:curl`**
  
  ```bash {filename="add-a-project-domain.sh"}
  #!/usr/bin/env bash

  projectId=$(upsun project:info id)

  upsun api:curl -X POST /projects/$projectId/domains \
    --json '{"capabilities":["member_permissions","teams"]}' -vvv 
  ```
  
  > Running a `cURL` through the CLI can be useful in some circumstances, but more often than not you should use the built-in CLI command [`upsun domain:add`](/configuration/routes/https.html#lets-encrypt).

  {{< /tab >}}
  {{< tab >}}
  
  ```bash {filename="add-a-project-domain.sh"}
  #!/usr/bin/env bash
  # The PLATFORMSH_API_TOKEN environment variable must be set.
  # It will be used to retrieve the OAuth2 token that will be used for actual requests.

  # Variables. Edit for your needs.
  HEADER="Content-Type: application/json"
  projectId="UPSUN_PROJECT_ID"
  name="https://example.com"

  # Retrieve OAuth2 token from API token.
  refreshOAuthToken() {
      curl -sX POST \
          -H "$HEADER" \
          -d '{
              "client_id": "platform-api-user",
              "grant_type": "api_token",
              "api_token": "'"$PLATFORMSH_API_TOKEN"'"
          }' \
          https://accounts.platform.sh/oauth2/token | jq -r '.access_token'
  }

  # Add a project domain.
  addAProjectDomain() {
      # Authentication and headers.
      AUTH="Authorization: Bearer $(refreshOAuthToken)"
      # Request.
      RESPONSE=$(curl -sX POST \
        -H "$HEADER" -H "$AUTH" \
        -d '{
            "name": "'"$name"'",
            "attributes": {
              "property1": "spam",
              "property2": "eggs"
            },
            "is_default": true
        }' \
        https://api.platform.sh/projects/$projectId/domains)
  }

  addAProjectDomain
  ```
  
  
  {{< /tab >}}
  {{< tab >}}Elixir coming soon.{{< /tab >}}
  {{< tab >}}Go coming soon.{{< /tab >}}
  {{< tab >}}Java coming soon.{{< /tab >}}
  {{< tab >}}JS coming soon.{{< /tab >}}
  {{< tab >}}PHP coming soon.{{< /tab >}}
  {{< tab >}}

Run the script below (within a virtual environment; see below for details) using the command:

```bash
python add-a-project-domain.py UPSUN_PROJECT_ID example.com
```

```python {filename="add-a-project-domain.py"}
import os, sys, requests

projectId = sys.argv[1]
name = sys.argv[2]

def refreshOAuthToken():
    oauth_headers = {
      'Content-Type': 'application/json'
    }
    oauth_data = {
        "client_id": "platform-api-user",
        "grant_type": "api_token",
        "api_token": os.getenv("PLATFORMSH_API_TOKEN")
    }
    response = requests.post('https://accounts.platform.sh/oauth2/token', 
      headers=oauth_header, json=oauth_data)
    return response.json()["api_token"]

oauth_token = refreshOAuthToken

headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer {0}'.format(oauth_token),
}

data = {
    'name': name,
    'is_default': True,
}

response = requests.post('https://api.platform.sh/projects/projectID/domains', headers=headers, json=data)
```

{{% details title="How to set up a virtual environment" closed="true" %}}

Create a workspace:

```bash
mkdir upsun-demo && cd upsun-demo
```

Create a virtual environment:

```bash
python -m venv env
```

> Run `pip install virtualenv` to install `virtualenv` globally if you don't have it already.

Activate the virtual environment:

```bash
source env/bin/activate
```

Within the virtual enviornment, install dependencies:

```bash
pip install requests
```

> You can save these dependencies in a manifest file by running `pip freeze > requirements.txt`.

When you have made the desired changes to your project(s), deactivate the environment:

```bash
deactivate
```

{{% /details %}}

  {{< /tab >}}
  {{< tab >}}Ruby coming soon.{{< /tab >}}
  {{< tab >}}Rust coming soon.{{< /tab >}}
  {{< tab >}}Wget coming soon.{{< /tab >}}

{{< /tabs >}}