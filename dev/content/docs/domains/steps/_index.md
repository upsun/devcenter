---
title: Set up a custom domain
weight: 1
description: Add a custom domain to your project once it's ready to go live.
layout: single
---

Once your project is ready for production, replace the automatically generated domain with your own custom domain.
Note that adding a domain disables the automatically generated URL for your Production environment only.

You can also [customize the URLs for your preview environments](/docs/domains/steps/custom-domains-preview-environments).

## Before you begin

You need:

- A project that's ready to go live
- A domain with access to its settings with the registrar
- A registrar that allows `CNAME` records or [one of the alternatives](/docs/domains/steps/dns.md) on [apex domains](/docs/glossary.md#apex-domain)
- Optional: The [CLI](/docs/administration/cli/_index.md) installed locally

If you are planning to use several subdomains of the same domain on different projects,
see how to [manage multiple subdomains](/docs/domains/steps/subdomains.md) *before* you add your domain to {{% vendor/name %}}.

## Steps

### 1. Get the target for your project

You want to point your DNS record to the automatically generated URL.
Your domain needs to point to that target for your site to go live.

{{< tabs items="Using the CLI, In the Console" >}}

{{< tab >}}
```bash
{{% vendor/cli %}} environment:info edge_hostname
```
{{< /tab >}}

{{< tab >}}
1. Navigate to your production environment and click **{{< icon settings >}} Settings**.
2. Select the **Domains** tab.
3. In the **Configure your domain** section, copy the content of the **CNAME record** field.
{{< /tab >}}

{{< /tabs >}}

### 2. Configure your DNS provider

Your DNS provider (usually your registrar) is where you manage your domain.
Most registrars offer similar functionalities regarding DNS configuration but use different terminology or configuration.
For example, some registrars require you to use an `@` to create custom records on the apex domain, while others don't.
Check your registrar's documentation.

Note that depending on your registrar and the time to live (TTL) you set,
it can take anywhere from 15 minutes to 72 hours for DNS changes to be taken into account.

{{< tabs items="Not using a CDN,Using a CDN" >}}

{{< tab >}}
To configure your domain name to point to your project:

1. Consult your provider's documentation to find out how to add or edit DNS records.
2. Open your registrar's domain management system.
3. Set the TTL on your domain to the lowest possible value to minimize transition time.
4. Add a `CNAME` record pointing from your domain to the [target](#1-get-the-target-for-your-project).
   Not all registrars allow these kinds of records.
   If yours doesn't, see the [alternatives](/docs/domains/steps/dns.md#workarounds-for-apex-domains).
5. Optional: If you have multiple domains you want to be served by the same app, add a `CNAME` record for each of them.
   That includes the `www` subdomain if you are using it in your [routes configuration](/docs/define-routes/_index.md).
6. Set the TTL value back to its previous value.

If your domain is `example.com` and you are using the `www` subdomain, you have records like the following:

* `example.com` is a `CNAME`/`ANAME`/`ALIAS` record pointing to `main-abcd123.abcdefgh1234567.eu.{{< vendor/urlraw "hostname" >}}`.
* `www.example.com` is a `CNAME` record pointing to `main-abcd123.abcdefgh1234567.eu.{{< vendor/urlraw "hostname" >}}`.

Both `example.com` and `www.example.com` point to the same target.
Redirects are handled by the [router you configure](/docs/define-routes/_index.md).
{{< /tab >}}

{{< tab >}}
To configure your CDN and your domain name to point to your project:

1. Open your CDN's management system.
2. Point the CDN at your [target](#1-get-the-target-for-your-project).
3. Open your registrar’s domain management system.
4. Open your registrar's domain management system and configure your DNS zone settings to point at your CDN.
   The address or `CNAME` record to use varies by CDN provider.
   Refer to the official documentation of your DNS provider and CDN provider.
5. Check that redirects and subdomains are set correctly for the [TLS certificate ownership verification](/docs/domains/troubleshoot.md#ownership-verification).
6. [Disable the router cache](/docs/domains/cdn/_index.md#disable-the-router-cache).
7. Optional: For increased security and to prevent the CDN from being bypassed,
   you can force all traffic to [go through the CDN](/docs/domains/cdn/_index.md#prevent-direct-access-to-your-server).
8. Optional: If you have multiple domains you want to be served by the same app, add a `CNAME` record for each of them.
   That includes the `www` subdomain if you are using it in your [routes configuration](/docs/define-routes/_index.md).

Adding a custom domain sets your site as [visible to search engines](/docs/environments/search-engine-visibility.md#how-its-done).

See how you can further [configure your CDN](/docs/domains/cdn/_index.md).
{{< /tab >}}

{{< /tabs >}}

### 3. Set your domain

Add a single domain to your project:

{{< tabs items="Using the CLI, In the Console" >}}

{{< tab >}}
Run the following command:

```bash
{{% vendor/cli %}} domain:add [YOUR_DOMAIN]
```
{{< /tab >}}

{{< tab >}}
1. Select the project where you want to add a domain.
2. Click {{< icon settings >}} **Settings**.
3. Click **Domains**.
4. In the **Domain** field, enter your domain.
5. Click **Add domain**.
{{< /tab >}}

{{< /tabs >}}

## What's next

* [Use a content delivery network](/docs/domains/cdn/_index.md)
* [Use subdomains across multiple projects](/docs/domains/steps/subdomains.md)
* [Use a custom TLS certificate](/docs/domains/steps/tls.md)
