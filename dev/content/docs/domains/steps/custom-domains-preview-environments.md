---
title: Set up a custom domain on a preview environment
linkTitle: Preview environments
# weight: 3
description: Learn how to set up custom domains on your preview environments
---

[Preview environments](/docs/glossary.md#preview-environment) in your project can't use the custom domain [set up on your production environment](/docs/domains/steps/_index.md).<br/>
By default and for each preview environment,
{{< vendor/name >}} automatically replaces the custom production domain
with an automatically generated URL.

If you don't want to use these default URLs,
you can add a custom domain to each of your preview environments
(`staging` or `development` [environment types](/docs/glossary.md#environment-type)).

To do so, no need to modify your [routes configuration](/docs/define-routes/_index.md).
When you add a new custom domain for a preview environment,
just attach it to the custom production domain it replaces.
If you have multiple custom production domains,
you need to select which one you're replacing.

{{% callout %}}
**Example:**

You have two environments, a production environment and a staging environment.
You've added the `example.com` custom domain to your production environment.

You want to add the `staging.example.com` custom domain to your staging environment.
To do so, you need to attach the new `staging.example.com` custom domain
to its corresponding custom production domain `example.com`. 

You can then access your staging environment through `staging.example.com`,
and still access your production environment through `example.com`.
{{% /callout %}}

If you have multiple custom domains on your production environment,
when you set up a custom domain on a preview environment,
you don't need to update your [routes configuration](/docs/define-routes/_index.md) either.
{{< vendor/name >}} automatically figures out the routing of your preview environment
based on the following elements:

- The custom production domains in your existing [routes configuration](/docs/define-routes/_index.md)
- The custom domains for preview environments attached to each of those custom production domains

## Before you start

You need:

- A production environment with at least one custom domain already set up
- At least one preview (staging or development) environment
- Optional: The [{{< vendor/name >}} CLI](/docs/administration/cli/_index.md) (v4.8.0+)

To prevent abuse, by default you can add custom domains to up to 5 preview environments per project only.
This limit doesn't include the production environment,
and you can increase it without charge.
To do so, [contact Support](/docs/learn/overview/get-support.md).

{{% callout %}}
If you delete a custom production domain,
all of the attached custom domains for preview environments are deleted too.
You need to rebuild the affected preview environments for the deletion to be complete.
{{% /callout %}}

## Add a custom domain to a preview environment

To add a custom domain to a preview environment, follow these steps:

{{< tabs items="Using the CLI, In the Console" >}}

{{< tab >}}

1. To get the target for your preview environment,
   run the following command:

   ```bash
   {{% vendor/cli %}} environment:info edge_hostname --environment [ENVIRONMENT_NAME]
   ```

2. [Configure your DNS provider](/docs/domains/steps/_index.md#2-configure-your-dns-provider).
   In particular, make sure your DNS record points to the target of your preview environment.

   {{< callout >}}

   Using the target of your production environment to configure your DNS provider is technically possible,
   but {{< vendor/name >}} recommends using the target of your preview environment as a best practice.

   {{< /callout >}}

3. Run a command similar to the following:

   ```bash
   {{% vendor/cli %}} domain:add staging.example.com --environment [STAGING_ENVIRONMENT_ID] --attach [PRODUCTION_CUSTOM_DOMAIN_TO_ATTACH]
   ```

{{< /tab >}}

{{< tab >}}

1.  Get the target for your preview environment.</br>
    To do so, navigate to your preview environment and click **{{< icon settings >}} Settings**.</br>
    Select the **Domains** tab.</br>
    In the **Configure your domain** section, copy the content of the **CNAME record** field.</br>
    Save it for later use at step 7.

2.  Click **Add domain**.

3.  Name the custom domain for your preview environment.

4.  Attach the custom domain for your preview environment to the desired production custom domain.

5.  Click **Add**.

6.  Click **Okay**.

7.  [Configure your DNS provider](/docs/domains/steps/_index.md#2-configure-your-dns-provider).</br>
    In particular, make sure your DNS record points to the target of your preview environment.

{{< /tab >}}

{{< /tabs >}}