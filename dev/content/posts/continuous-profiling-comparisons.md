---
#################################
# Don't touch these settings.
date: '2024-10-23T14:12:10-04:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "Continuous profiling comparisons"
subtitle: "Unlock profound insights into application performance"

description: |
    Upsun’s new continuous profiling comparisons feature provides deeper insights into application performance, enabling you to easily contrast performance metrics over time or between code versions. 

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/cp-comparisons.png

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - sabri-helal

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
#   - how-it-works
#   - discussions
#   - experiments
  - featured
  - releases
#   - transcripts
#   - tutorials
#   - use-cases

# Tags don't do anything yet, so ignore for now.
tags:
  - observability
  - "continuous profiling"
  - blackfire
  - ruby
  - rust
math: true
---

Introducing comparisons—a new feature in continuous profiling that helps you gain deeper insights into application performance by effortlessly contrasting performance metrics over time or between code versions. Quickly identify regressions, optimize application performance, and accelerate development cycles. Empower your team to make data-driven decisions. And with unparalleled visibility, deliver faster, more efficient software.

We’ve also added support for [Rust](https://docs.upsun.com/increase-observability/application-metrics/rust.html) and [Ruby](https://docs.upsun.com/increase-observability/application-metrics/ruby.html) applications to our continuous profiling toolkit.

## How it works

The comparisons feature enhances our continuous profiling capabilities by adding a *Compare* toggle to the dashboard. When activated, the dashboard switches to a comparison view mode that displays two time-frame windows (A and B) side by side. This dual view enables you to compare performance metrics between two different periods on the line graph directly.

{{< figure src="/images/cp-compare.png" alt="Continuous profiling comparisons" caption="Continuous profiling comparisons. Assume that, at some point (near 2:33 AM, for example), an event we’re interested in tracking the impact of occurs (e.g., a deployment, surge in traffic). Above, two windows of continuous profiling measurements on the **CPU time** metrics dimension for the 24 hours before (**A**) and after (**B**) that event are compared side by side." >}}

### Key benefits

- **Contrast performance across time periods.** Quickly identify performance changes by viewing two time frames simultaneously.
- **Gain enhanced insights through comparative analysis.** Dive deeper into your data to uncover trends, anomalies, or regressions.
- **Enable data-driven optimization.** Use comparative insights to make informed decisions to optimize your applications.

The comparisons feature enriches continuous profiling by providing tools that help you troubleshoot more effectively. 

Here are some possible use cases:

- **Version comparisons or feature-impact analysis.** With the *Deployment* toggle, overlay deployment activities on the line graph to contrast the before-and-after effects of code changes or new app versions. This enables you to identify performance improvements or regressions.
- **Time-based analysis.** Compare profiles from different periods to investigate performance fluctuations over time. For example, peak traffic periods versus lulls can be analyzed to optimize resource allocation.

## Rust and Ruby support

We’ve expanded language support by adding continuous profiling for Rust and Ruby applications to current support for Go, Node.js, PHP, and Python. This enables developers working in Rust and Ruby to leverage our profiling tools for enhanced performance monitoring.

## New capabilities, no new costs

The new comparisons feature and language support for Ruby and Rust are free of additional costs. These enhancements continue our commitment to providing valuable tools that improve your experience and make your life easier.

## Get started

Our team is excited for you to explore these new features to see how they can benefit your development and optimization processes. For more information, dive into these support resources:

- [Comparisons feature documentation](https://docs.upsun.com/increase-observability/application-metrics/cont-prof-comparison.html)
- Continuous profiling for [Rust](https://docs.upsun.com/increase-observability/application-metrics/rust.html) and [Ruby](https://docs.upsun.com/increase-observability/application-metrics/ruby.html)

