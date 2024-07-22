---
linkTitle: "API"
title: API reference
---

{{% custom/openapi-test %}}

These endpoints can be used to add, modify, or remove domains from a project. For more information on how domains function on Platform.sh, see the Domains section of our documentation.

## Get list of project domains

Retrieve a list of objects representing the user-specified domains associated with a project. Note that this does not return the domains automatically assigned to a project that appear under "Access site" on the user interface.

## Add a project domain

<!-- # Get a list of project domains -->

{{% custom/endpoint method="post" path="/projects/{projectId}/domains" %}}

Add a single domain to a project. If the `ssl` field is left blank without an object containing a PEM-encoded SSL certificate, a certificate will be [provisioned for you via Let's Encrypt](https://docs.platform.sh/configuration/routes/https.html#lets-encrypt).

```bash
https://api.upsun.com/projects/{projectId}/domains
```

### Requests 

#### Authorizations

{{% details title=OAuth2 closed="true" %}}

<ul class="api-details">
  <li>{{< icon name="lock-closed" attributes="class=\"required-icon\"" >}} <strong>OAuth2</strong>: OAuth2</li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Flow type</strong>: <code>authorizationCode</code></li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Authorization URL</strong>: <code>https://auth.api.platform.sh/oauth2/authorize</code></li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Token URL</strong>: <code>https://auth.api.platform.sh/oauth2/token</code></li>
  <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <strong>Refresh URL</strong>: <code>https://auth.api.platform.sh/oauth2/token</code></li>
</ul>

{{% /details %}}

#### Path paramaters

<ul class="api-details">
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <code>projectId</code>: string</li>
</ul>

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">denotes parameter is required.</span>

#### Request body schema

Request body schema: `application/json`

One of:

{{< tabs items="ProdDomainStorageCreateInput, ReplacementDomainStorageCreateInput" >}}

  {{< tab >}}

  <ul class="api-details">
    <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <code>name</code>: string (Domain name)</li>
    <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <code>attributed</code>: object (Arbitrary attributed attaches to this resource)</li>
    <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <code>is_default</code>: boolean (is this domain default)</li>
  </ul>
  
  {{< /tab >}}
  {{< tab >}}

  <ul class="api-details">
    <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <code>name</code>: string (Domain name)</li>
    <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <code>attributed</code>: object (Arbitrary attributed attaches to this resource)</li>
    <li>{{< icon name="arrow-sm-right" attributes="class=\"required-icon\"" >}} <code>replacement_for</code>: string (Prod domain which will be replaced by this domain)</li>
  </ul>

  {{< /tab >}}

{{< /tabs >}}

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">denotes parameter is required.</span>

#### Request body samples

{{< tabs items="ProdDomainStorageCreateInput, ReplacementDomainStorageCreateInput" >}}

  {{< tab >}}

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
  
  {{< /tab >}}
  {{< tab >}}

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

  {{< /tab >}}

{{< /tabs >}}

### Responses

#### Response schema

Response schema: `application/json`

{{% details title=default closed="true" %}}

<ul class="api-details">
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <code>status</code>: string (The status text of the response)</li>
  <li>{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <code>code</code>: integer (The status code of the response)</li>
</ul>

{{% /details %}}

{{< icon name="check-circle" attributes="class=\"required-icon required\"" >}} <span class="hx-text-gray-500">denotes parameter is required.</span>

#### Response samples

{{< tabs items="default" >}}

  {{< tab >}}

  **Content type:** `application/json`

  ```json
  {
    "status": "string",
    "code": 0
  }
  ```
  
  {{< /tab >}}

{{< /tabs >}}

<!-- {{% details title="<span class=\"endpoint endpoint-get\">GET</span><code class=\"endpoint-path\">/projects{projectId}/domains</code>" %}}

Retrieve a list of objects representing the user-specified domains associated with a project. Note that this does not return the domains automatically assigned to a project that appear under "Access site" on the user interface.

#### Path paramaters

| Parameter   | Required     | Type   |
| :--------  | :--------: | :------ |
| `projectId` | ✔ | string |

#### Request body schema

#### Authorizations

- **OAuth2:** OAuth2
- **Flow type:** `authorizationCode`
- **Authorization URL:** `https://auth.api.platform.sh/oauth2/authorize`
- **Token URL:** `https://auth.api.platform.sh/oauth2/token`
- **Refresh URL:** `https://auth.api.platform.sh/oauth2/token`

{{% /details %}}

To authenticate further API requests, include this returned bearer token
in the `Authorization` header. For example, to retrieve a list of
[Projects](#tag/Project)
accessible by the current user, you can make the following request
(substituting the dummy token for your own):

```bash
curl -H "Authorization: Bearer <em><b>abcdefghij1234567890</b></em>" \
    https://api.platform.sh/projects
```

Platform.sh is a container-based Platform-as-a-Service. Our main API
is simply Git. With a single `git push` and a couple of YAML files in
your repository you can deploy an arbitrarily complex cluster.
Every [**Project**](#tag/Project) can have multiple applications (PHP,
Node.js, Python, Ruby, Go, etc.) and managed, automatically
provisioned services (databases, message queues, etc.).

## Introduction


Platform.sh is a container-based Platform-as-a-Service. Our main API
is simply Git. With a single `git push` and a couple of YAML files in
your repository you can deploy an arbitrarily complex cluster.
Every [**Project**](#tag/Project) can have multiple applications (PHP,
Node.js, Python, Ruby, Go, etc.) and managed, automatically
provisioned services (databases, message queues, etc.).

Each project also comes with multiple concurrent
live staging/development [**Environments**](#tag/Environment).
These ephemeral development environments
are automatically created every time you push a new branch or create a
pull request, and each has a full copy of the data of its parent branch,
which is created on-the-fly in seconds.

Our Git implementation supports integrations with third party Git
providers such as GitHub, Bitbucket, or GitLab, allowing you to simply
integrate Platform.sh into your existing workflow.

## Using the REST API

In addition to the Git API, we also offer a REST API that allows you to manage
every aspect of the platform, from managing projects and environments,
to accessing accounts and subscriptions, to creating robust workflows
and integrations with your CI systems and internal services.

These API docs are generated from a standard **OpenAPI (Swagger)** Specification document
which you can find here in [YAML](openapispec-platformsh.yaml) and in [JSON](openapispec-platformsh.json) formats.

This RESTful API consumes and produces HAL-style JSON over HTTPS,
and any REST library can be used to access it. On GitHub, we also host
a few API libraries that you can use to make API access easier, such as our
[PHP API client](https://github.com/platformsh/platformsh-client-php)
and our [JavaScript API client](https://github.com/platformsh/platformsh-client-js).

In order to use the API you will first need to have a Platform.sh
account (we have a [free trial](https://accounts.platform.sh/platform/trial/general/setup)
available) and create an API Token.

# Authentication

## OAuth2

API authentication is done with OAuth2 access tokens.

### API tokens

You can use an API token as one way to get an OAuth2 access token. This
is particularly useful in scripts, e.g. for CI pipelines.

To create an API token, go to the "API Tokens" section
of the "Account Settings" tab on the [Console](https://console.platform.sh).

To exchange this API token for an access token, a `POST` request
must be made to `https://auth.api.platform.sh/oauth2/token`.

The request will look like this in cURL:

<pre>
curl -u platform-api-user: \
    -d 'grant_type=api_token&amp;api_token=<em><b>API_TOKEN</b></em>' \
    https://auth.api.platform.sh/oauth2/token
</pre>

This will return a "Bearer" access token that
can be used to authenticate further API requests, for example:

<pre>
{
    "access_token": "<em><b>abcdefghij1234567890</b></em>",
    "expires_in": 900,
    "token_type": "bearer"
}
</pre>

### Using the Access Token

To authenticate further API requests, include this returned bearer token
in the `Authorization` header. For example, to retrieve a list of
[Projects](#tag/Project)
accessible by the current user, you can make the following request
(substituting the dummy token for your own):

```bash
curl -H "Authorization: Bearer <em><b>abcdefghij1234567890</b></em>" \
    https://api.platform.sh/projects
```

# HAL Links

Most endpoints in the API return fields which defines a HAL
(Hypertext Application Language) schema for the requested endpoint.
The particular objects returns and their contents can vary by endpoint.
The payload examples we give here for the requests do not show these
elements. These links can allow you to create a fully dynamic API client
that does not need to hardcode any method or schema.

Unless they are used for pagination we do not show the HAL links in the
payload examples in this documentation for brevity and as their content
is contextual (based on the permissions of the user).

## _links Objects

Most endpoints that respond to `GET` requests will include a `_links` object
in their response. The `_links` object contains a key-object pair labelled `self`, which defines
two further key-value pairs:

* `href` - A URL string referring to the fully qualified name of the returned object. For many endpoints, this will be the direct link to the API endpoint on the region gateway, rather than on the general API gateway. This means it may reference a host of, for example, `eu-2.platform.sh` rather than `api.platform.sh`.
* `meta` - An object defining the OpenAPI Specification (OAS) [schema object](https://swagger.io/specification/#schemaObject) of the component returned by the endpoint.

There may be zero or more other fields in the `_links` object resembling fragment identifiers
beginning with a hash mark, e.g. `#edit` or `#delete`. Each of these keys
refers to a JSON object containing two key-value pairs:

* `href` - A URL string referring to the path name of endpoint which can perform the action named in the key.
* `meta` - An object defining the OAS schema of the endpoint. This consists of a key-value pair, with the key defining an HTTP method and the value defining the [operation object](https://swagger.io/specification/#operationObject) of the endpoint.

To use one of these HAL links, you must send a new request to the URL defined
in the `href` field which contains a body defined the schema object in the `meta` field.

For example, if you make a request such as `GET /projects/abcdefghij1234567890`, the `_links`
object in the returned response will include the key `#delete`. That object
will look something like this fragment:

```
"#delete": {
    "href": "/api/projects/abcdefghij1234567890",
    "meta": {
        "delete": {
            "responses": {
                . . . // Response definition omitted for space
            },
            "parameters": []
        }
    }
}
```

To use this information to delete a project, you would then send a `DELETE`
request to the endpoint `https://api.platform.sh/api/projects/abcdefghij1234567890`
with no body or parameters to delete the project that was originally requested.

## _embedded Objects

Requests to endpoints which create or modify objects, such as `POST`, `PATCH`, or `DELETE`
requests, will include an `_embedded` key in their response. The object
represented by this key will contain the created or modified object. This
object is identical to what would be returned by a subsequent `GET` request
for the object referred to by the endpoint. -->
