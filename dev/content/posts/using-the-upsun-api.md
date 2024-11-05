---
#################################
# Don't touch these settings.
date: '2024-09-19T14:19:39+07:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "Using the Upsun API"

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/red-background.webp

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - dman

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
  - how-it-works
#   - discussions
#   - experiments
#   - how-tos
#   - releases
#   - transcripts
#   - tutorials
#   - use-cases
#   - featured
  
# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations

---


## Automate management of your Upsun projects

> Anything you can do, API can do better!

An interesting fact about the Upsun hosting and deployment system, is that all the important actions are done via an API (Abstract Programming Interface) that you also have access to.
The changes you make and the actions that you invoke through the web console can also be triggered programmatically by authenticated HTTP requests.

This means that anything you can do in the Web UI console, you can also automate or trigger remotely!

{{< callout >}}

**Note:**

Some documentation links may still refer to "Platform.sh", the `platform` CLI tool, and `PLATFORM_*` named environment variables. 
In most cases, you can imagine that the `upsun` CLI tool acts identically to the `platform` CLI tool, so you may read the docs as if they are interchangeable.

{{< /callout >}}

## The CLI is mostly an API wrapper

We provide the [`upsun` CLI](https://docs.upsun.com/administration/cli.html) to make this easier ( not least because the authentication stuff is annoying to do by hand ) but all that usually does is make an API request on your behalf.

You can see that in action by using `UPSUN_CLI_DEBUG` (a flag that makes the `upsun` CLI tool more verbose). That will log the actual request being made to the API.

```bash
export UPSUN_CLI_DEBUG=1
upsun project:info
```

```
Selected project: Client test Upsun (y3fni4nqxhyfa)
> Making HTTP request #1: GET /api/projects/y3fni4nqxhyfa HTTP/1.1
> Host: api.upsun.com
```


Actions and edits are triggered in the same way - via POST.

```bash
upsun environment:pause --environment=feature-ZD12345
```

```
...
Making HTTP request #1: POST /api/projects/i4nqxhyy3fnfa/environments/feature-ZD12345/pause HTTP/1.1
> Host: api.upsun.com
...
< Received response for #1 after 1378 ms: HTTP/1.1 200 OK
```

The full API is open and documented for inspection and experimentation at [api.upsun.com](https://api.upsun.com/docs/).
This makes it possible for you to do anything to your project - even create, branch, or change resource allocations - from your own pipelines.


## API requests are authenticated

The [authentication that is used for API access](https://api.upsun.com/docs/#section/Authentication) controls what you can do based on the projects and permissions that are assigned to your user account.

> Note that it is recommended to [create a "machine user" with its own token](https://docs.upsun.com/administration/cli/api-tokens.html#1-create-a-machine-user) if you are intending to delegate tasks to an environment where the token or keys may be shared or visible to others.

* When you use **the web console**, a temporary certificate has been given to your browser when you authenticated -
  usually when you went through `auth.upsun.com` to do your login. This allows the web console in your browser to talk directly to `api.upsun.com` for you.
* When you use **the CLI**, it may require you to "Log in via a browser" window in the same way.
  and a temporary certificate becomes available to your shell environment once you are "Successfully logged in".
* You can also avoid logging in each time you use the CLI by [authenticating using an API token](https://docs.upsun.com/administration/cli/api-tokens.html)
  This is more convenient if you use the CLI a lot.
  * To create an API token, go to the "API Tokens" section of the "Account Settings" tab [on the Console](https://console.upsun.com/), and make that available as a variable named `UPSUN_API_TOKEN` in your shell environment.
* For making requests directly via **the API**, or **for automation and delegation of tasks**, you would also use an API token in this same way.
  * To use the token, the `UPSUN_API_TOKEN`  variable must be set in the environment for the CLI, or passed explicitly in an API request header.
  * You can experiment with semi-raw API requests but still use the CLI to manage authentication via the `upsun api:curl` command. 
    For inline documentation on `api:curl` enter `upsun help api:curl` in your terminal.


## Ways of interacting with the API

It's possible to make raw http requests directly to the API endpoint, but it's usually better to use a wrapper of some sort.

### Use `upsun project:curl`

The CLI has an embedded utility that provides direct access to the http requests, and handles the project selection and authentication for you.
See `upsun help project:curl`

```bash
upsun project:curl /environments
```

^ Lists the available environments ([API ref](https://api.upsun.com/docs/#tag/Environment/operation/list-projects-environments)) . Equivalent to `platform environment:list`, but the JSON response may be more useful for automation.

{{< callout >}}
`project:curl` is a shortcut for `api:curl` that pre-selects the project for you, and is easier to use for normal operations.
They both really are just very thin wrappers around [the documented endpoints](https://api.upsun.com/docs/#section/Introduction/Using-the-REST-API) that format the `curl` command options for you.
{{< /callout >}}


### Use `curl` directly

````bash
export UPSUN_API_URL=https://api.upsun.com
export UPSUN_PROJECT=ywxgbkce4rmdp
export UPSUN_BRANCH=master
export UPSUN_TOKEN=$(upsun auth:token)

curl -s -H "Authorization: Bearer ${UPSUN_TOKEN}" "${UPSUN_API_URL}/projects/${UPSUN_PROJECT}/environments/${UPSUN_ENVIRONMENT}" \
  | jq "del(.[]._links)"
````

````json
[
  {
    "id": "master",
    "_embedded": {
      "deployments": [
        {
          "id": "local",
          "type": "local",
          "name": "local",
          "hosts": null,
          "use_dedicated_grid": false,
          "storage_type": null
        }
      ]
    },
    "created_at": "2024-08-20T10:16:27.324395+00:00",
    "updated_at": "2024-08-20T10:20:49.806440+00:00",
    "name": "master",
    "machine_name": "master-7rqtwti",
    "title": "Master",
    "attributes": {},
    "type": "production",
    "parent": null,
    "status": "active",
    "http_access": {
      "is_enabled": true,
      "addresses": [],
      "basic_auth": {}
    },
    "enable_smtp": true,
    "restrict_robots": true,
    "edge_hostname": "master-7rqtwti-ywxgbkce4rmdp.au.platformsh.site",
    "deployment_state": {
      "last_deployment_successful": true,
      "last_deployment_at": "2024-08-20T10:20:49.805910+00:00",
      "crons": {
        "enabled": true,
        "status": "running"
      }
    },
    "resources_overrides": {},
    "last_active_at": "2024-09-20T03:42:58.347107+00:00",
    "last_backup_at": "2024-09-19T04:11:29.560749+00:00",
    "project": "ywxgbkce4rmdp",
    "is_main": true,
    "is_dirty": false,
    "has_code": true,
    "head_commit": "b1620160b763d1d2314af935d3c0cd23b8a141dc",
    "merge_info": {
      "commits_ahead": 0,
      "commits_behind": 0,
      "parent_ref": null
    },
    "has_deployment": true
  }
]
````

### Use `postman`

The [API support documentation](https://api.upsun.com/docs/#section/Introduction/Using-the-REST-API) also provides an OpenAPI specification which can be imported into tools like Postman for inspection and testing.

* [Install the Postman API explorer](https://www.postman.com/downloads/)
* "Import" the API schema from `https://api.upsun.com/docs/openapispec-platformsh.json`
* Update the "Variables" to set the `baseUrl` to `{{schemes}}://api.upsun.com`
* Update the "Authorization" section to set "Auth Type" type "Bearer Token"
* Generate a token with `upsun auth:token` and paste that into the "Token" field
* Test a request by running the simple "GET" "me" operation

## Use automation to manage your project

With access to this toolset now, you may be able to see some possibilities for management.

* As Upsun resources are charged for pro-rata (usage based), you could cut the RAM and CPU costs for all your preview environments in half by automating a `cron` task them to "pause" every night and weekend.
* You can upscale and downscale the resources in realtime to match demand and traffic on the website.

As an example, you can use [scalsun](https://github.com/upsun/scalsun) to [automatically upscale Upsun resources]( ./configuring-an-autoscaler.md).


