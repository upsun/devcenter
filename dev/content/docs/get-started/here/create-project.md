---
title: Create a project
description: All you need to know about creating a new project with Upsun.
pagination: true
prev: /docs/get-started/here/setup.md
next: /docs/get-started/here/configure/_index.md
weight: 2
---

{{% details title="Using the Console (recommended)" closed="true" %}}

Open the [Upsun management console](https://console.upsun.com/-/create-project) to create your project.

{{% callout %}}
If you haven't done so already, you are prompted to create your first organization where your project will reside.
{{% /callout %}}

![Create project options](/images/console/create-project.png "0.35")

From the Console, what you do next entirely depends on where the "source of truth" of your codebase is located.
In this guide, you will push your local repository to Upsun.
That is, the only copy of your codebase you'd like to deploy is on your local computer.

Click **Start from scratch** from the **Deploy with Git** option.

{{< callout theme="info" title="Git integrations">}}
This guide does not specifically address integrating an Upsun project with a third party repository such as one on GitHub, even though the **Connect repository** option is available at this stage.

For now, continue to work locally.
Third party integrations will be addressed at the end of this guide.
{{< /callout >}}

Add details about your project, such as:

- The name of your project.
- The default branch of your local repository.
- Select the region where you want your project to be hosted.

As suggested in the Console, connect the local copy of your repository to your project:

```bash {filename="Terminal"}
upsun project:set-remote [PROJECT_ID]
```

Your local source code is automatically linked to your newly created Upsun project through the creation of a `.upsun/local/project.yaml` file.  This file contains the corresponding `<projectId>` and sets a Git remote to `upsun`.

{{% /details %}}

{{% details title="Using the CLI" closed="true" %}}

To create a new project with the {{% vendor/name %}} CLI, use the following command and follow the prompts:

```bash {filename="Terminal"}
{{% vendor/cli %}} project:create
```

{{< callout type="blue" title="Default branches" >}}
**Default branches**

When creating a new project using the {{% vendor/name %}} CLI command `project:create`, the default production branch is set to `main`. Change it if your default branch is different (_e.g._: `master`).
{{< /callout >}}

Then, you are asked if you want to set the local remote to your new project. Enter **Yes (y)**.

Your local source code is automatically linked to your newly created {{% vendor/name %}} project through the creation of a `.{{% vendor/cli %}}/local/project.yaml` file.  This file contains the corresponding `<projectId>` and sets a Git remote to `{{% vendor/cli %}}`.

In this guide, you will push your local repository to {{% vendor/name %}}.
That is, the only copy of your codebase you'd like to deploy is on your local computer.

{{< callout type="blue" title="Git integrations">}}
**Git integrations**

This guide does not specifically address integrating an {{% vendor/name %}} project with a third party repository such as one on GitHub, even though you will notice the **Connect repository** option available at this stage.

For now, continue to work locally.
Third party integrations will be addressed at the end of this guide.
{{< /callout >}}

So long as you chose `y` (yes) to the question `Set the new project <projectName> as the remote for this repository?` during the `project:create` command, your local project is already integrated to the {{% vendor/name %}} project.

{{% /details %}}
