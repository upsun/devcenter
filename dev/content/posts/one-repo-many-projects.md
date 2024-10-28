---
#################################
# Don't touch these settings.
date: '2024-10-28T13:01:10-05:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "One repository, multiple projects"
subtitle: "Managing the codebase of multiple projects at scale"

description: |
  Trying to manage multiple projects at scale can be difficult. One strategy to do so is to utilize a single code base
  for all projects.

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
  - paul-gilzow

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
#   - how-it-works
#   - discussions
  - experiments
#   - featured
#   - releases
#   - transcripts
  - tutorials
#   - use-cases

# Tags don't do anything yet, so ignore for now.
tags:
#  - observability
#  - "continuous profiling"
#  - blackfire
#  - ruby
#  - rust
math: true
---

# One Repository, multiple projects
One of the questions I hear asked routinely is "How can I manage multiple projects from a single codebase?" Typically,
this is from large organizations (e.g. a University) or agencies who are handling a large collection of projects that
are "mostly" the same in terms of code. "Mostly" is in quotes because it is usually uncovered later that while the
majority of the code base for each project is the same, they're not _100%_ identical. What they really want is to be able
to manage multiple projects from a single _flexible_ codebase.

One of the amazing things about Upsun (Platform.sh?) is that it is an _extremely_ flexible Platform-as-a-Service,
allowing you to accomplish almost any workflow/set-up you need. However, one of the disadvantages of Upsun is that it is
an _extremely_ flexible Platform-as-a-Service allowing you an almost **infinite** number of ways to accomplish almost
any workflow/set-up. What this means is that while Upsun can absolutely accomplish a flexible single repository to
manage multiple projects, there are a _bunch_ of different ways you can accomplish that task, with zero "right"
ways to do so.

This post and the subsequent related posts will be part journal, part mad-scientist experiment to walk you through
several different strategies for accomplishing a "single repo, multiple projects" management goal. None of them will
be the recommended way; instead, these are possible ways we can accomplish this task. The right way for you will
depend entirely on your codebase, and the specific goals/requirements you need to achieve. Take all of them as
inspiration and a starting point for you to explore your own custom strategy tailor-fit for your organization.

## Assumptions
Before we dive in, we need to make sure we're clear on some terms and concepts and operating from the same starting
place.

### Terms
* **Upstream repository** (referred to as "Upstream") - this is how I'll refer to the "single" codebase we want to use to
manage all our projects.
* **Downstream repository** (referred to as "Downstream") - a single "child" copy of the Upstream repository. This may be a
fork of the Upstream repository or possibly a clone of the Upstream repository. The important piece here is that it is
separate from the Upstream
repository, but has a shared git history with the Upstream repository.
* **Project** - a deployed instance of your codebase (be it an instance of the Upstream or Downstream repository) on Upsun
* **Source control management system** (SCMS) - GitHub, GitLab, Bitbucket
* **Fork** - A new repository that shares code, git history, and a connection in the source control management system back
to the Upstream repository. Usually in a different namespace than the Upstream repository.
* **Clone** - A copy of a repository but is not recognized as a fork in the SCMS
* **CI/CD system (CICD)** - a service that allows you to automate tasks connected to your repository/codebase. e.g.
[GitHub Actions](https://docs.github.com/en/actions), [GitLab Pipelines](https://docs.gitlab.com/ee/ci/pipelines/),
[Bitbucket Pipelines](https://www.atlassian.com/software/bitbucket/features/pipelines), etc.


### Requirements
* You are using a source control management system (GitHub, GitLab, Bitbucket) for at least your upstream repository
* You have an account with Upsun and at least one project deployed/working
* You have at least some understanding of your projects, how they relate, and how they may differ

## Before we build
Before we can start building out any system, we need to understand the goals we're trying to accomplish. Usually when an
organization is exploring this type of strategy it's to minimize the amount of work needed to 1. create a new
site/project, and 2. maintain updates to that project later on. We often know pretty well where the projects are similar
but where are they different? Are there situations where an individual project is going to need to deviate from what
your organization has set up as a "standard" project?

From a [project configuration](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html) standpoint,
the areas I usually see as needing to deviate slightly from project to project (coming from a situation of
most projects needing to be the same) are:
* [crons](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#crons)
* [build and deploy hooks](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#hooks)
* [variables](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#variables)
* [dependencies](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#dependencies)
* [runtime extensions](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#extensions)
* [web locations](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#locations)
* [mounts](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#mounts)
* [disk](https://docs.platform.sh/create-apps/app-reference/single-runtime-image.html#available-disk-space) (only
applicable for Platform.sh projects)
* [size](https://docs.platform.sh/create-apps/app-reference/single-runtime-image.html#sizes) (only applicable for
Platform.sh projects)
* [resources](https://docs.platform.sh/create-apps/flexible-resources.html#performance-profiles) (only applicable for
Platform.sh projects)
* [service disk](https://docs.platform.sh/add-services.html#disk) (only applicable for Platform.sh projects)

Please note, the list above is in no particular order. You may not need all the ones listed above; you may need to
adjust other
[available properties](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html#primary-application-properties)
not listed on a project-to-project basis. Again, a thorough analysis of your own projects will be crucial to planning
this type of strategy.

Additionally, we need to apply the same type of thought process to other areas of our application. Are there elements
