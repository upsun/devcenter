---
#################################
# Don't touch these settings.
date: '2024-10-19T17:30:12+07:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "Adding an autoscaler to Upsun projects"
subtitle: "Upscaling Upsun projects automatically"

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/configuring-an-autoscaler/configuring-an-autoscaler-CPU-propogation.png

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - dman

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
#   - how-it-works
#   - discussions
#   - experiments
  - how-tos
#   - releases
#   - transcripts
#   - tutorials
#   - use-cases

# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations

---

In this post we will describe a small configuration that will 
monitor your project resource usage, 
and upscale or downscale the allocated resources for it 
based on demand and some thresholds you can define.

> This post follows on from the [introduction to the Upsun API]({{< ref "using-the-upsun-api.md" >}})

{{< callout type="info" >}}
This is an example intended to illustrate how it's possible to leverage the API to manage your projects and horizontaly scale your application on demand.
If you have any feedback to make or require assistance feel free to open an issue on the related [github repositories](https://github.com/upsun/scalsun/issue) or to contact the Activation team at the following adress: activation@platform.sh.
{{< /callout >}}
 
## Requirements:
 
* A working, running Upsun project, and access to its code.
* An API key you can publish to the project. This token provides permissions to change your project properties. 
* A script or utility that checks the project status and reacts to high or low stress conditions by upscaling or down-scaling as appropriate.

We can use [a tool from Mickael Gaillard called scalsun](https://github.com/upsun/scalsun) to do the last step, and use cron inside the project itself to do the monitoring.

Instructions for installation are in [the `scalsun` README](https://github.com/upsun/scalsun/blob/master/README.md) and should be easy to follow. To summarize:

1. Install the utility at build time.
2. Add a cron job to periodically run the tool.
3. Add your token to the project environment.

With this in place, your project will periodically poll the resource usage, and automatically adjust the project sizing when thresholds are passed.
When this happens can be observed in the Activity logs. You may also want to add your own notifications to alert you when this is going on.

### About upscaling

Since it is _horizontal_ scaling, there is no rebuild triggered. See [Horizontal scaling on Upsun](https://docs.upsun.com/manage-resources/adjust-resources.html#horizontal-scaling).
Additional instances of the app container are added, and inserted into the routing rules.
This means that capacity can be increased or decreased in real time without interruption.

This only applies to the _application_ behind the web server - not the data services. 
Database, cache or search services are not suitable for horizontal scaling like this, as data replication is a much deeper challenge, and needs to be engineered for.

### Behaviour under load

Here is a graph of a load test simulating a surge of activity over time. 
The load test was done using the `k6` tool, 
and a scenario of roughly bell-shaped traffic,
building to a peak of 200 requests per second.

**HTTP traffic during an artificial load test**

![HTTP traffic during a load test](/images/configuring-an-autoscaler/configuring-an-autoscaler-http_surge.png)

* The vertical lines indicate events where infrastructure changes were made (more info can be seen on mouseover on the real thing).
  In this case, each of the lines at the beginning of the surge denote the upscaler being triggered and adding an application instance.
* The same is seen at the end, and it depicts how the cool down in traffic takes some extra lag time before the additional instances are scaled down. 
* The valley and the roughness in the graph is just an anomaly, possibly because the URL requests were being randomized and producing uneven load results.

**Upsun CPU instances being added to the pool in response to increased load**

![Upsun CPU instances being added to the pool in response to increased load](/images/configuring-an-autoscaler/configuring-an-autoscaler-CPU-propogation.png)

* Here we see the CPU load increasing as the HTTP requests went up.
* This is followed by additional instances of the application - indicated here as new lines - being brought online one after the other.
* Each spike is followed by a dip as a new instance succeeds in bringing the load average down.
* The reverse is seen as the traffic eases off - each time the average CPU load goes down enough for an instance to be removed from the pool, the average spikes again for a bit as the remaining instances take up the load.

In this case, the load was not memory-intensive, but the memory graph looks similar to the CPU one, as each new application container instance also adds allocations of memory.

The database graph shows an increase in activity, but was *not* scaled or duplicated in response to demand. In this example, database scaling was not necessary.

## About the parameters

The parameters are [documented in the README](https://github.com/upsun/scalsun/blob/master/README.md), so start there for the most up-to-date options.

- `name`

    If no `name` is defined, then all apps and services are polled. 
    This might not be what you want, as some apps or services (like Redis cache) are designed to operate at capacity and self-regulate,
    and may trigger upsizes inappropriately.
    It's best to explicitly name the app that you wish to monitor.

- `max_host_count`

    This is the maximum number of **instances** of the application that will be deployed when needed.
    There is a regional hard upper limit as well, as the horizontal scaling will be distributed over different locations where possible.

- `min_cpu_usage_upscale`, `max_cpu_usage_downscale`, `min_mem_usage_upscale`, `max_mem_usage_downscale` 

    The upscale/downscale usage parameters are compared against an average of the last 5 minutes (or duration as defined). 

    As described, these are *thresholds* that determine when the upscale or downscale action is triggered.
    The buffer between the two thresholds is to prevent too much 'flapping' - it will add an extra application instance when CPU usage is averaging above 75% for 5 minutes, 
    but only remove that instance when the total usage of the active instances is averaging below 60% for 5 minutes.

    Both CPU and memory usage are polled and either going over the `max_` value may trigger an upscale.
    A downscale should only happen when both metrics are below the safe threshold.

## Under the hood

As discussed in `using the upsun-api`, the `scalsun` utility makes these changes by leveraging the tools that you already have access to.
Looking at the activity logs that record a successful upscale event, 
you may see what is actually happening.

```
upsun metrics:all -p yd00gnuspu --environment=staging --interval=1m --format=csv --columns=service,cpu_percent,mem_percent --no-header --no-interaction --yes
upsun resources:get -p yd00gnuspu --environment=staging --format=csv --columns=service,instance_count --no-header --no-interaction --yes
upsun resources:set -p yd00gnuspu --environment=staging --no-interaction --yes --no-wait --count app:2
```

You can observe that it is just using the `upsun metrics:all` command to check the current status, but it will not take into account (at the moment there is a boolean set to false by default to exclude service) the services metrics
and the `upsun resources:` commands to request infrastructure changes in response to your own rules or heuristics.

Hopefully you can imagine how you may extend this to enhance it with your own logic if you have more interesting use-cases!

## Looking forward

This demonstration is not a fully featured enterprise level autoscaling solution,
it is a demonstration of what abilities and features you could use to automate your own resource management in response to demand.

Following are a few suggestions of ways this could be extended... 

### This demonstration uses `cron`

For convenience, this demonstration of the `scalsun` tool works by running as a `cron` job every 5 minutes.
This is just easier to set up, and doesn't invoke any extra new concepts or services.

Running cron so frequently could be sub-optimal for a number of reasons.
* The `cron` activity may fill up the logs really fast and make it harder to spot real issues.
* `cron` intervals are limited by default to 5 minutes for normal accounts on the Upsun servers.
* On the other hand, for some business cases, every 5 minutes may not be enough. Standard Upsun accounts cannot run a cron more frequently than that (though this can be arranged for Enterprise plans if needed).

### This utility could run as a worker

If you wanted continuous control and continuous monitoring, then maybe this would be better suited to being an always-on [worker process](https://docs.upsun.com/create-apps/workers.html#workers-vs-cron-jobs) within your project.

This could be slightly more sensible than a cron job, and could be better at spotting or predicting trends to react to - depending on the tasks you expect to perform.

Adding a worker requires to set dedicated resources on your main project, so it's not always the best solution to run a separate application container just for it.

Using a worker also means that the monitoring and management of your infrastructure resides on the infrastructure itself. 
In extreme cases, this could mean that it is unable to bootstrap its own responses.

### You could run your monitoring from outside the infrastructure

For resilience, it could make sense for your monitoring, alerts and responses to be in an altogether different location.
If you want to have monitoring that still works even if the site is down, or actions that trigger hard redeploys or provisioning, or the ability to wake from sleep, then your monitoring tool should probably live elsewhere - not inside the infrastructure that it is actually managing.

### Vertical scaling is also possible

As mentioned above, this example only does horizontal scaling by adding extra instances of the application container to meet demand, and this can't be applied to databases (easily).
If your needs required it, then you could consider automated [vertical scaling on Upsun](https://docs.upsun.com/manage-resources/adjust-resources.html#vertical-scaling). 
The logic would apply in much the same way, though vertical scaling is likely to require a small downtime for the redeployment of the modified container. 

