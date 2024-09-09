---
#################################
# Don't touch these settings.
date: '2024-05-27T09:43:10+02:00'
sidebar:
    exclude: true
type: media
#################################
# Update the title
title: "Build your first GitHub Action: Step-by-step guide"

# (optional) Override the image produced for the video page.
# When undefined, the following will be used.
# image: https://img.youtube.com/vi/YOUTUBE_ID/hqdefault.jpg

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - gilzow
  
# Choose ONE of the options below:
categories:
#  - demos
#   - livestreams
#   - podcasts
   - talks
#   - webinars

# Tags don't do anything yet, so ignore for now.
tags:
  - events
#   - integrations
---
We all know we should be doing more automation of our software development lifecycle, but getting started can be challenging. Even if you have experience in continuous integration and continuous delivery (CI/CD) automation, learning a specific platform’s terminology and idiosyncrasies can be frustrating.

This presentation is designed to provide an overview of GitHub Actions, a CI/CD platform that allows you to automate your build, test and deployment pipelines, and writing one’s first action, a reusable component that can automate repeatable tasks. We’ll start by going over key terms and concepts in the GitHub Actions platform, such as actions, workflows, events and jobs, and explain how they can be pieced together to build robust and dynamic automations.

Then, we’ll dive into the process of building your first GitHub Action, walking through the steps of creating a new action, the types of actions you can create, defining inputs and outputs, and required properties. We’ll then work together to build an action that can be immediately used in your own workflows.

Whether you’re a seasoned developer looking to move to GitHub Actions or a newcomer to automation looking to get started with your first CI/CD automation, Paul Gilzow will help you jumpstart your journey.
______________________________________

Enterprise Symfony for the future: Platform.sh is the official Symfony Cloud Platform.
______________________________________

Learn more: https://platform.sh/blog/measuring-th...

Experiment easily. Iterate quickly. Deploy responsibly. Introducing the Upsun PaaS.

A bright, new offer powered by Platform.sh—adopted (and ❤️) by 16,000+ developers, 7,000 customers, and proven over the last 8 years—Upsun provides out-of-the-box capabilities that serve as the launchpad for creative development teams’ out-of-the-box thinking. A single, fully managed, self-service PaaS for development teams who just want to build their next, great application.

Links to check out:
👉 Get your free Upsun trial: https://brnw.ch/21wFxKr
👉 Learn more about Blackfire: https://brnw.ch/21wFxKp
👉 Get started with Platform.sh: https://brnw.ch/21wFxKj

Key moments:
0:00 - Intro / GitHub Actions 101
* Presenter introduces themselves as Paul from platform.sh.
* Paul highlights his experience with GitHub Actions and aims to help navigate through its complexities.

2:42 - What is GitHub Actions?
* GitHub Actions is a CI/CD platform for automating tasks related to codebases or project management.
* It allows automation beyond code-related tasks.

3:12 - Components of GitHub Actions
* Components include workflows, events, runners, jobs, steps, and actions.
* Distinction between "GitHub Actions" (the platform) and "actions" (individual modular automation pieces).

9:05 - Components of a workflow
* A workflow file, written in YAML, defines automation.
* Events trigger workflows, with a variety of available events.
* Runners execute workflows, which can be public or self-hosted.

9:40 - Build our first workflow
* Paul demonstrates building a simple workflow manually.
* Workflow files must include events, at least one job, and at least one step.
* Demonstrates running the workflow in the repository's actions tab.

23:47 - Components of a custom action
* Introduction to custom actions: Differentiates between different types of actions (Docker, JavaScript, Composite).
* Explanation of action types: Docker for strict environment control, JavaScript for modularity and speed, Composite for leveraging other actions.
* Requirements for actions: Must be stored in a repository, must have metadata file (yo file named action) with specific properties (name, description, runs).
* Sample action structure: Demonstrates a complete action file with required properties.

26:52 - Caveats and gotchas
* Warnings for different action types: Issues with Docker (versioning), JavaScript (dependency management), Composite (dependency updates).
* Specific considerations for each type: Node versions for JavaScript, dependency bundling for JavaScript, potential version mismatches for Composite.

28:13 - Build our first custom action
* Building the custom action: Guides through the creation of a basic custom action using a workflow file.
* Discussion on workflow structure: Identifies the need for events, jobs, and steps in a workflow file.
* Explanation of action utilization: Demonstrates how to use the custom action within a workflow, including handling inputs.

32:40 - Putting it all together
* Real-world example: Illustrates a complex use case of implementing a visual regression testing action within a GitHub workflow.
* Breakdown of action components: Explains the different steps involved in the visual regression testing action.
* Demonstration of action usage: Shows the action in action, including handling of failures and reporting.

38:24 - Ending
