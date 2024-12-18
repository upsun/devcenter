---
title: Setup
weight: 1
pagination: true
prev: /docs/get-started/here/_index.md
next: /docs/get-started/here/create-project.md
---

{{< callout >}}
**Got code?**

In order to follow along with this guide, you need a local project.
While the guide has been written to accommodate the following stacks, it is not limited to just those listed and are here only as examples.

{{% details title="JavaScript/Node.js" closed="true" %}}

- [Express installation guide](https://expressjs.com/en/starter/installing.html)
- [Next.js installation guide](https://nextjs.org/docs/getting-started/installation)
- [Strapi installation guide](https://docs.strapi.io/dev-docs/installation)

{{% /details %}}

{{% details title="PHP" closed="true" %}}

- [Laravel installation guide](https://laravel.com/docs/10.x#creating-a-laravel-project)
- [Symfony installation guide](/docs/get-started/stacks/symfony/_index.md)

{{% /details %}}

{{% details title="Python" closed="true" %}}

- [Flask installation guide](https://flask.palletsprojects.com/en/2.3.x/installation)
- [Django installation guide](https://docs.djangoproject.com/en/5.0/intro/tutorial01/)

{{% /details %}}

{{< /callout >}}

## Before you begin

You need:

- [Git](https://git-scm.com/downloads).
  Git is the primary tool to manage everything your app needs to run.
  Push commits to deploy changes and control configuration through YAML files.
  These files describe your infrastructure, making it transparent and version-controlled.
- An Upsun account.
  If you don't already have one, [register for a trial account](https://auth.upsun.com/register).
  You can sign up with an email address or an existing GitHub, Bitbucket, or Google account.
  If you choose one of these accounts, you can set a password for your Upsun account later.
- The [Upsun CLI](/docs/administration/cli/_index.md).
  This lets you interact with your project from the command line.
  You can also do most things through the [Web Console](docs/administration/web/_index.md).

{{< callout type="blue" >}}
When you create your first organization on Upsun, you are also activating your trial for that organization.
Get [more information on trials](/docs/glossary.md#trial).
{{< /callout >}}

## Initialize your Git repository

A Git repository is required for Upsun projects.
If you haven't already done so, initialize a Git repository for your codebase, and commit your files:

```bash {fileName="Terminal"}
git init
git add .
git commit -m "Initial commit."
```

This guide assumes that your repository's default branch is `main`.
Your Git configuration may result in different default branches (like `master`), so please run `git branch -M main` before proceeding.

{{< callout type="blue" >}}

**Don't commit dependencies**

Whether you're migrating your own project, or testing {{% vendor/name %}} with a starter project, **never commit your app's dependencies**.
Make sure you ignore directories containing dependencies by updating your `.gitignore` file.

{{< tabs items="JavaScript/Node.js,PHP,Python" >}}

{{< tab >}}
```bash
echo "node_modules" >> .gitignore
guut add .gitignore && git commit -m "Update .gitignore to ignore deps."
```
{{< /tab >}}

{{< tab >}}
```bash
echo "vendor" >> .gitignore
guut add .gitignore && git commit -m "Update .gitignore to ignore deps."
```
{{< /tab >}}

{{< tab >}}
```bash
echo "venv" >> .gitignore
guut add .gitignore && git commit -m "Update .gitignore to ignore deps."
```
{{< /tab >}}

{{< /tabs >}}

{{< /callout >}}