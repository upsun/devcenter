---
title: "Monolith, headless, microservices?"
description: Choose the best app topology depending on your needs.
---

With Upsun, you can run multiple application containers in a single environment.
This gives you access to a large variety of setups and allows you to seamlessly upgrade your app
from a monolith with a single application server to a more elaborate and effective topology.

You can set up multiple apps to achieve the following:
- Keep your backend and frontend systems separate
- Run workers alongside your main app
- Or even go for a full microservices architecture

Upsun makes implementing such setups and switching from one to the other pain-free.

The same flexibility applies to any supported services, from relational databases to search engines and message queues.
Depending on your specific use case, you can run a single database,
multiple databases inside a single instance, or multiple databases in multiple versions...
It's up to you!

Whether you embrace a mono-repo approach with a single Git repository describing your entire setup,
or divide your project into multiple repositories, Upsun allows you to build the best architecture for your needs.

But while the possibilities are endless, making the right choice between creating one big project with multiple apps
or keeping each app in its own project can be a tough formula to crack.
So read on for guidance!

## Separate projects

If you have multiple apps sharing the same code but each of them has its own data,
keep your apps in separate projects.
Upsun provides the automation to deploy multiple projects from the same code base,
which makes their maintenance effortless.

{{< callout >}}
  By design, Upsun doesn't allow your app to access services in another project through HTTP.
{{< /callout >}}

So separate projects are appropriate in the following cases:

- Your apps are for different customers/clients
- Your apps don't need to directly connect to the same database
- Different teams are working on different apps
- You want to develop true microservices, where each microservice is a fully standalone process with its own data

When in doubt over your own needs,
it's better to keep separate projects than build an architecture that may prove difficult for you to maintain.

## Clustered applications

A clustered application is one where your project requires multiple _app services_ that are all part of the same conceptual project.

Clustered applications can range from a straightforward headless architecture, where frontend and backend systems are separated,
to micro-services with dozens of apps in multiple runtimes and frameworks forming a consistent whole.
Meaning, removing one of the app services would break the others.

Upsun allows you to configure access from one service to another
without having to worry about service discovery or complex _ingress controllers_.
[Configuring incoming routes](/docs/define-routes/_index.md) is straightforward.
You can have services that are only exposed to another service as well as services that are exposed to the internet.

In a clustered application, you can have one of the following configurations:

- Multiple [applications](/docs/create-apps/multi-app/_index.md), often in different directories or with separate code bases that deploy separately
- A single app that spawns one or more [worker instances](/docs/create-apps/app-reference/single-runtime-image.md#workers) that run background processes

With a clustered application, you often don't need multiple service instances.
The [MySQL, MariaDB](/docs/add-services/mysql/_index.md),
and [Solr](/docs/add-services/solr.md) services support defining multiple databases on a single service,
which is significantly more efficient than defining multiple services.
[Redis](/docs/add-services/redis.md), [Memcached](/docs/add-services/memcached.md),
[Elasticsearch](/docs/add-services/elasticsearch.md), and [RabbitMQ](/docs/add-services/rabbitmq.md)
natively support multiple bins (also called _queues_ or _indexes_) defined by the client application as part of the request.
Therefore, they don't need additional configuration on Upsun.

Clustered applications are appropriate in the following cases:

- You want one user-facing app and an entirely separate admin-facing app that are both operating on the same data
- You want to have a user-facing app and a separate worker process (either the same code or separate) that handles background tasks
- You want a single conceptual app written in multiple programming languages

## A note on "multi-site" applications

Some Content Management Systems or other applications support running multiple logical "sites" off of a single code base.
This approach isn't recommended on Upsun.

This multi-site logic is often dependent on the domain name of the incoming request, which on Upsun varies by branch.
Running multiple databases, as is often recommended with this approach,
is supported on Upsun but makes the setup process for each site more difficult.

Leveraging the multi-site capabilities of an app are appropriate only in the following cases:

- There is only a single team working on all of the "sites" involved
- All "sites" should be updated simultaneously as a single unit
- Each individual site is relatively low traffic, such that the aggregate traffic is appropriate for your plan size
- All sites really do use the same codebase with no variation, just different data

Otherwise, [separate projects](#separate-projects) are a better long-term plan.