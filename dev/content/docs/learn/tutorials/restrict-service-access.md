---
title: Restrict access to a service
linkTitle: Restrict service access
description: Learn how to restrict access to a service using a worker and additional endpoints to the service.
---

When a Git repository contains a high number of references and files, the performance of Git can decrease.
This is why most Git providers have repository size limits in place (for more information, see the [GitHub](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github), [GitLab](https://docs.gitlab.com/ee/user/gitlab_com/index.html#account-and-limit-settings)
and [Bitbucket](https://support.atlassian.com/bitbucket-cloud/docs/reduce-repository-size/) documentation).

The Upsun API and [Console](/docs/administration/web/_index.md) are closely tied to Git.
When the performance of Git decreases, Upsun API servers also become slower.
As a user, you can then experience significant latencies.
If your repository becomes too large, your Console may even become unresponsive,
leaving you unable to access your project.

To avoid such issues, make sure you keep your Git repository clean by following the instructions on this page.

If you're already facing performance issues and suspect they might be related to the size of your Git repository,
see how you can [troubleshoot a sizeable Git repository](#troubleshoot-a-sizeable-git-repository).
