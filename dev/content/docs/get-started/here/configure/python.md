---
title: Python
# linkTitle: Comments
# description: Flexible resources on Upsun are easy to use. Find all you need to know about resources allocation there.
weight: 3
---

When dealing with Python stacks, the information below may help customize your configuration.
These sections provide Python-specific configuration details, but you can also refer to the common {{% vendor/name %}} documentation:

- [Configuring applications](/docs/create-apps/_index.md)
- [Setting up managed services](/docs/add-services/_index.md)
- [Handling requests](/docs/define-routes/_index.md)

## Managing dependencies

Pip comes pre-installed in all `python` runtime containers. 
With it, you can add `pip install` to your build hook and be well on your way to building your apps. 

Alternatively, you can [use a different package manager](/docs/languages/python/dependencies.md), such as Poetry or Pipvenv.

## Configuring web servers

{{% vendor/name %}} doesn't enforce an assumption of what Python web server package you are using to serve your applications.
You can use any server on {{% vendor/name %}} by modifying the `web.commands.start` property of your application configuration.
For more information, see how to [configure web servers](/docs/languages/python/server.md).

## Frameworks

The {{% vendor/name %}} documentation includes a wide array of community resources to help with framework-specific configuration:

- [Django](/docs/get-started/stacks/django.md)
- [Flask](/docs/get-started/stacks/flask.md)

## Get support

While there are virtually no restrictions to you deploying any kind of application on {{% vendor/name %}}, configuration may still be unclear at this point.

Not to worry! The {{% vendor/name %}} community is here to help. 
Come and say hello, share your work, ask for help, and peek in on what others are working on.

Welcome to the {{% vendor/name %}} community!

{{% community-buttons %}}
