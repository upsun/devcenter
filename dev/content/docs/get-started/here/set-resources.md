---
title: Set resources
# linkTitle: Comments
description: Flexible resources on Upsun are easy to use. Find all you need to know about resources allocation there.
weight: 4
pagination: true
prev: /docs/get-started/here/configure/_index.md
next: /docs/get-started/here/make-changes.md
---

You can define how much CPU, memory, and disk you want to assign to each of your service and app containers.

If you don't explicitly set resources, {{% vendor/name %}} uses [default resources](/docs/manage-resources/resource-init.md) instead.
{{% vendor/name %}} also offers several [resource initialization strategies](/docs/manage-resources/resource-init.md) to help you allocate resources depending on your needs and use cases.
However, for the sake of this guide, let's set resources manually.
To do so, follow these steps:

1. Run the following command:

   ```bash {fileName="Terminal"}
   {{% vendor/cli %}} resources:set
   ```

   This launches an interactive prompt to walk you through setting up your application's resources:

   ```bash {fileName="Terminal"}
   {{% vendor/cli %}} resources:set
   Resource configuration for the project app (123456azerty), environment main (type: production):
   +-----------------------+---------+---------+-------------+-----------+-----------+
   | App or service        | Size    | CPU     | Memory (MB) | Disk (MB) | Instances |
   +-----------------------+---------+---------+-------------+-----------+-----------+
   | myapp                   | 1       | 1       | 384         | N/A       | 1         |
   | [<additional-service>]| 0.1     | 0.1     | 128         | N/A       | 1         |
   +-----------------------+---------+---------+-------------+-----------+-----------+
   ```

2. Select the profile size you want applied to your application image. For instance, `0.1`:

   ```bash {fileName="Terminal"}
   App: myapp
   Choose a profile size:
      [0.1 ] CPU 0.1, memory 64 MB
      [0.25] CPU 0.25, memory 128 MB
      [0.5 ] CPU 0.5, memory 224 MB
      [1   ] CPU 1, memory 384 MB
      [2   ] CPU 2, memory 704 MB
      [4   ] CPU 4, memory 1216 MB
      [6   ] CPU 6, memory 1728 MB
      [8   ] CPU 8, memory 2240 MB
      [10  ] CPU 10, memory 2688 MB
     > 0.1
   ```
3. Define how many [instances](/docs/manage-resources/adjust-resources.md#horizontal-scaling) of your application container you want to deploy. For instance, `1`:

   ```bash {fileName="Terminal"}
   Enter the number of instances (default: 1): 1
   ```
4. To confirm your choices, select `Y`.

   {{% vendor/name %}} grabs the previous built images from earlier, applies your resource selections to them, and deploys your full application!

   {{% callout %}}
   If the deployment fails, you may need to set the resources again.
   {{% /callout %}}
