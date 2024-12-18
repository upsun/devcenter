---
linkTitle: "Docs"
title: Introduction
weight: 1
layout: single
home: true
---

<div class="home-hero" style="text-align: center; padding-top: 2rem;">

  <h3>Welcome to the</h3>
  <h1>Upsun documentation</h1>

  <p>Built for developers, by developers. The efficient, reliable, and secure Platform-as-a-Service (PaaS) that gives development teams control and peace of mind while accelerating the time it takes to build and deploy applications.</p>
  
  <p>Resources to help you customize, experiment, and optimize all from one platform.</p>

</div>

{{% homepage-buttons %}}

## How the docs are organized

There are different [kinds](https://documentation.divio.com/) of documentation.
Some docs are useful when you're just starting out,
while others go into detail that's relevant only after you've deployed many projects on {{% vendor/name %}}.

This site is roughly split into categories based on where you are in your journey working with {{% vendor/name %}}, described below.

### Get started

If you're still unfamiliar with {{% vendor/name %}} and how it works, _but_ you're also looking to quickly start working with the platform, the **Get started** section is the right place to begin.

Learn the basics of how {{% vendor/name %}} leverages Git to produce reusable build images, identical-to-production environments in staging and development (including production data), as well as the basics of monitoring and troubleshooting your environments.

Ready to get started? [Let's go!](/docs/get-started/here/_index.md)

### Learn

After going through the **Get started** section, you may want to know more about how {{% vendor/name %}} works and the logic behind it. The **Learn** section is a collection of tutorials and conceptual guides to help you understand the ins and outs of {{% vendor/name %}}.

- [**What is {{% vendor/name %}}?**](/docs/learn/overview/_index.md)

    With this guide, find out which problem {{% vendor/name %}} is trying to solve.
    Learn how {{% vendor/name %}}'s configuration, build and deploy pipelines, and the structure of environments play into the broader philosophy behind reliably deploying applications.

- [**Tutorials**](/docs/learn/tutorials/_index.md)

    Once you're familiar with {{% vendor/name %}}, its basic rules and philosophy, you may be curious about how you can replicate common workflows in other tools on our platform.
    From scheduling dependency updates and backups to exporting data, the [**Tutorials**](/docs/learn/tutorials/_index.md) provide all the information you need.

- [**Best practices**](/docs/learn/bestpractices/_index.md)

    {{% vendor/name %}} makes deploying and managing infrastructure no different than working with Git.
    As your work becomes more experimental, however, you may be interested in optimizing your workflows, and addressing common constraints of the platform.
    The [**Best practices**](/docs/learn/bestpractices/_index.md) documentation contains articles that address advanced use cases for caching, microservices, and more.

### Frameworks

Now that you understand the basic rules of {{% vendor/name %}}, you're likely ready to deploy your own custom code in a chosen framework.
The **Frameworks** section is a collection of framework-specific how-to guides - from best practices to configuration, local development, and more.

{{< frameworks-landing >}}

### Reference

The **Reference documentation** section is the largest and most comprehensive.
It includes details of configuration, environment variables, activities, and much more material you can use in your day-to-day work.

{{% details title="Managed services" closed="true" %}}

Services on our platform are managed. You can provision them with a few lines of YAML and quickly connect them to the rest of your environment. No infrastructure expertise is required.

**Popular documentation:**

- [Clickhouse](/docs/add-services/clickhouse.md)
- [Elasticsearch](/docs/add-services/elasticsearch.md)
- [Gotenberg](/docs/add-services/gotenberg.md)
- [Headless Chrome](/docs/add-services/headless-chrome.md)
- [InfluxDB](/docs/add-services/influxdb.md)
- [Kafka](/docs/add-services/kafka.md)
- [MariaDB/MySQL](/docs/add-services/mysql/_index.md)
- [Memcached](/docs/add-services/memcached.md)
- [MongoDB](/docs/add-services/mongodb.md)
- [Network Storage](/docs/add-services/network-storage.md)
- [OpenSearch](/docs/add-services/opensearch.md)
- [PostgreSQL](/docs/add-services/postgresql.md)
- [RabbitMQ](/docs/add-services/rabbitmq.md)
- [Redis](/docs/add-services/redis.md)
- [Solr](/docs/add-services/solr.md)
- [Varnish](/docs/add-services/varnish.md)
- [VaultKMS](/docs/add-services/vault.md)

{{% /details %}}

{{% details title="Runtime languages" closed="true" %}}

Like services, configure your application containers with one of many supported runtime `type`s.

**Popular documentation:**

- [C#/.NET Core](/docs/languages/dotnet.md)
- [Elixir](/docs/languages/elixir.md)
- [Go](/docs/languages/go.md)
- [Java](/docs/languages/java/_index.md)
- [JavaScript/Node.js](/docs/languages/nodejs/_index.md)
- [Lisp](/docs/languages/lisp.md)
- [PHP](/docs/languages/php/_index.md)
- [Python](/docs/languages/python/_index.md)
- [Ruby](/docs/languages/ruby.md)
- [Rust](/docs/languages/rust.md)

{{% /details %}}

{{% details title="Project & environment configuration" closed="true" %}}

Delve deeper into how to configure containers, environments, projects, and repositories.

**Popular documentation:**

- [Application containers](/docs/create-apps/_index.md)
- [Services & data](/docs/add-services/_index.md)
- [Routes & requests](/docs/define-routes/_index.md)
- [Environment variables](/docs/development/variables.md)
- [Integrations & activities](/docs/integrations/_index.md)
- [Regions](/docs/development/regions.md)

{{% /details %}}

{{% details title="Advanced topics" closed="true" %}}

Learn more about how you can customize and optimize your deployed projects, and further experiment on the platform.

**Popular documentation:**

- [Project administration](/docs/administration/_index.md)
- [Local development with DDEV](/docs/development/local/ddev.md)
- [Observability: Blackfire.io](/docs/increase-observability/application-metrics/blackfire.md)
- [Observability: Infrastructure metrics](/docs/increase-observability/metrics/_index.md)
- [Security & compliance](/docs/security/_index.md)
- [Workers](/docs/create-apps/workers.md)
- [Sanitizing data](/docs/development/sanitize-db.md)
- [Microservices and multi-app projects](/docs/create-apps/multi-app/_index.md)
- [Submodules](/docs/development/submodules.md)
- [Private repositories](/docs/development/private-repository.md)

{{% /details %}}

### API documentation

Find out more about {{% vendor/name %}}'s GIT implementation and REST API, and how you can leverage them to manage every aspect of your projects, through {{% vendor/name %}}'s [API documentation](https://api.platform.sh/docs/).

## Connect with us

### Join the community

The {{% vendor/name %}} community meets on both a [Community forum](https://support.platform.sh/hc/en-us/community/topics) and [Discord](https://discord.gg/platformsh) for questions and discussion.

Have an experiment you'd like to share?
Looking for a way to contribute?

{{% community-buttons %}}

### Contribute
Feel free to open an issue or pull request for any of the repositories below, or let us know on [Discord](https://discord.gg/PkMc2pVCDV) if you find a problem we can help with:

- [Developer Center](https://github.com/upsun/devcenter)
- [Documentation](https://github.com/upsun/devcenter)
- [Upsun CLI](https://github.com/platformsh/cli)
- [Upsun snippets](https://github.com/upsun/snippets)
- [Awesome Upsun](https://github.com/upsun/awesome-upsun)

### Get support

If you're experiencing issues with your projects, don't hesitate to open a [support ticket](/docs/learn/overview/get-support.md).