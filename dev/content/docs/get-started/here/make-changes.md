---
title: Make changes to your project
description: How to work on a daily basis with an Upsun project.
linkTitle: Revisions
weight: 5
pagination: true
prev: /docs/get-started/here/set-resources.md
next: /docs/get-started/here/local/_index.md
---

{{% vendor/name %}} allows you to make changes to your project and test them on a preview environment before introducing them to Production.

In your project, the default branch (e.g. `main`, `master`, whichever chosen during project creation) always represents the production environment.
Other branches are for developing new features, fixing bugs, or updating the infrastructure.

To make changes to your project, follow these steps:

{{% steps %}}

### Create a new environment

Create a new environment (a Git branch) to make changes without impacting production:

Run the following command:

```bash {fileName="Terminal"}
{{% vendor/cli %}} branch feat-a
```

This creates a new local `feat-a` Git branch based on the `main` Git branch
and activates a related environment on {{< vendor/name >}}.
The new environment inherits the data (service data and assets) of its parent environment (the production environment here).

### Make changes to your project

Depending on the stack you're using, change something within your source code.

### Commit your changes

```bash {fileName="Terminal"}
git add index.js
git commit -m "Update source code"
```

### Deploy your changes

Deploy your changes to the `feat-a` environment:

```bash {fileName="Terminal"}
{{% vendor/cli %}} push
```

Note that each environment has its own domain name.
To open the URL of your new environment, run the following command:

```bash {fileName="Terminal"}
{{% vendor/cli %}} environment:url --primary
```

{{< callout type="blue">}}
If your environment is inactive, you need to [activate it](/docs/environments/deactivate-environment.md#reactivate-an-environment) first, using the following command:
```bash {fileName="Terminal"}
{{% vendor/cli %}} environment:activate
```
{{< /callout >}}

### Iterate

Iterate by changing the code, committing, and deploying.
When satisfied with your changes, merge them to the main branch,
and remove the feature branch:

```bash {fileName="Terminal"}
$ {{% vendor/cli %}} merge
 Are you sure you want to merge feat-a into its parent, main? [Y/n] y
$ {{% vendor/cli %}} checkout main
git pull {{% vendor/cli %}} main
$ {{% vendor/cli %}} environment:delete feat-a
git fetch --prune
```

{{< callout >}}
Deploying after a merge is fast because the image built for the feature environment is reused for the targeted environment.
{{< /callout >}}

### Keep your branch up to date

For a long running development branch, to keep the code up-to-date with the `main` branch, use `git merge main` or `git rebase main`.
You can also keep the data in sync with the parent environment by using [`{{% vendor/cli %}} env:sync data`](/docs/administration/cli/reference.md#environmentsynchronize).

{{% /steps %}}