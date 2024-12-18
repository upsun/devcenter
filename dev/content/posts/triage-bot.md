---
#################################
# Don't touch these settings.
date: '2024-12-18T10:56:29-05:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "How did we migrate issues from GitLab to Linear?"
# subtitle: "How Misimplementation of `PublicKeyCallback` leads to authorization bypass in Go's `x/crypto/ssh`."

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/kier-in-sight-archives-0fL5XCrt_nU-unsplash.jpg

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - "Roland Molnar"

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
#   - how-it-works
  - featured
  - discussions
#   - experiments
  # - how-tos
#   - releases
#   - transcripts
#   - tutorials
#   - use-cases

# Tags don't do anything yet, so ignore for now.
tags:
  - integrations
#   - open-source
#   - events
#   - integrations
math: true
# toc: false
# sidebar:
#     hide: true
---

We migrated our issues from GitLab to Linear due to GitLab's limited issue-tracking features. To handle thousands of issues and tight timelines, we developed a migration tool using GitLab Triage Bot and Linear's GraphQL API. The tool mapped issue states, assignees, labels, and comments, and transformed GitLab epics into Linear issues with sub-issues. It was successful overall and enabled team-by-team migration for flexibility. Now, we’re open-sourcing the migrator to help others facing similar challenges.

## The background

More than a year ago we decided to find a better solution to manage our issues and initiatives. We found GitLab’s issue tracking features to be limited and not flexible enough to support our needs, so we started a research project to find a better issue management tool. In order to find the best match, we collected our use cases and requirements and ranked all potential solutions based on what is important to us vs. what the tools were capable of. This is how we came to the decision to migrate to [Linear](https://linear.app/), a cool and flexible solution to track issues and projects.

The problem is, Linear doesn’t have an official importer from GitLab. We had thousands of issues, so we had to come up with something—and the time was tight. 

## Using GitLab Triage Bot

The first idea was a full, stand-alone migrator with a database (to track migration tasks, progress, errors and to map IDs between the two systems), but for various reasons we only had a few weeks to spin up an MVP to show teams how their issues would look in Linear. At that time, we used [GitLab Triage Bot]([https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage/](https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage/)) to help maintain healthy projects and issues across different teams. 

We already had a few extensions that helped us to run Triage Bot on different projects and groups. It had a set of handy CI-related scripts and functions that allowed us to create multiple YAML files for the Triage Bot, and then set target projects/groups in that file. So, instead of running the bot with the target project as parameter, a script reads the folder that contains these policies and creates CI pipeline jobs for each file and target project combination.   
You can read more in this article…

## How does it work?

As Triage Bot can list issues and execute actions on them easily, the next part was just to call [Linear’s GraphQL API](https://developers.linear.app/docs/graphql/working-with-the-graphql-api) to import a given issue and set some basic properties. To create a Linear issue, we simply need two things: target team and issue title. We have the title, that’s easy, but how do we set the target team?

### Set the Linear team

As we currently have guilds in our engineering department and we already used scoped labels on issues to set which guild an issue belongs to, we decided to use this label. In GitLab, we use the following format: `Guild::Guild Name`. In Linear we decided to use `Guild: Guild Name` naming scheme for teams, so we just needed to do a lookup in Linear to find the team ID based on its name.

### Issue states

As we currently have guilds in our engineering department and we already used scoped labels on issues to set which guild an issue belongs to, we decided to use this label. In GitLab, we use the following format: `Guild::Guild Name`. In Linear we decided to use `Guild: Guild Name` naming scheme for teams, so we just needed to do a lookup in Linear to find the team ID based on its name.

### Closed issues

Some teams decided to leave closed issues in GitLab, some teams wanted to migrate them. As we use Triage Bot conditions to list issues, and we could have triage YAML files per team, it was just an extra condition in the Triage Bot rule.

### Assignee(s)

The migrator also sets issue assignee. As GitLab supports multiple assignees, but Linear doesn’t, it only takes the first assignee.

### Labels

Migrating labels was a bit tricky. Both GitLab and Linear support some sort of label grouping, but in Linear the group name is not included in the label name as in GitLab (where we have scoped labels, `::` acting as separator between the group and the label. Labels must be unique in Linear, not just within a group, so you can’t have a `colors/green` and `eco/green` label at the same time.

To solve this problem, we simply ignore the group name in GitLab, so `colors::green` and `eco/green` will be `green` in Linear (whether or not `green` is in a label group).

The migrator doesn't create any labels. If the label in Linear doesn't exist, it will simply ignore it. Labels should be created in Linear upfront, which gives flexibility to create them in the workspace or team level and within a group or stand-alone.

### Comments

After the migrator creates the issue, it imports all the comments from GitLab. It maintains the creation data and processes both threaded comments and normal comments.

### Epics

Linear doesn't have the concept of epics, so we decided to migrate epics as issues and issues under epics as sub-issues. But this is optional, if a team doesn't want to migrate their epics, only issues will be migrated. The hardest part was to keep track of the new IDs that the imported issues get in Linear to maintain parent-child relationships. As the migrator doesn't have a database, we decided to maintain a migration map in memory. But because the script can be run multiple times, it acts only as a cache, and if the linear issue ID is not in there, we use the comment that the migrator adds to the Linear issue to search for the issue (as comments are easily searchable in Linear).

### Author

Linear has a [`createAsUser`](https://developers.linear.app/docs/oauth/oauth-actor-authorization) attribute when creating issues and comments via the API (only available when using OAuth Actor Authorization) which allows us to set who created the issue or comment originally - even if that user doesn’t exist in Linear.

### Links to merge requests

Both in GitLab and Linear, issues can be linked to merge requests. The migrator migrates these links too.

### Status

How it tracks the status, use labels in Linear and GitLab.  
As there is no database behind the migrator, but we wanted to track progress, it sets the `Linear::Migrated` label when an issue was migrated, and `Linear::Migration Failed` when it failed for some reason.   

In Linear, all new issues are created with the label `Migrating from GitLab - in progress`. If all the comments and links are migrated, it then removes this and adds `Migrated from GitLab`. This is useful if the migration fails in the middle - e.g. a comment cannot be migrated, so the issue is missing some data - better to delete and re-import again. 

### Tests

As with software in general, it is hard to test all scenarios, we have a good test coverage in unit tests, where we test certain portions of the code. But because it relies on two external APIs, it’s very difficult to test everything, especially how it will behave with the real APIs. In the unit tests, we mock API responses, but the best test is if you can run it against the real APIs. Thankfully, GitLab Triage Bot has a dry-run mode, where it processes all the epics/issues, but instead of making any change, it simply prints what it would do. 

The Linear part is more tricky, as we can’t have a real dry-run. We decided to use Linear’s API in read-only mode, when the script is in dry-run. This means it prints out the mutations instead of actually running them. But this is quite limited, as comments and links can only be migrated once the issue is created. So we have an extra option (in an environment variable) to run real Linear mutations even in dry-run. This allows us to test the migration in Linear but not change anything in GitLab. 

Mass-deleting issues in Linear is easy, and it is also possible to use a test workspace. Once we were happy with the results, we could run the migration for real.

### Run in CI

We wanted the migration to be as self-service for teams as possible, we have set up CI jobs to run it every hour automatically. If a team wanted their issues being migrated, they could create a merge request, containing a new policy file that is for their projects. Once that merge request was merged, the bot picked it up and migrated the issues.  
Additionally, a dry-run was running for all merge requests commits, so it was easier to spot issues beforehand.

## Conclusion

Migration is always challenging, both technically and organisationally. Looking back, it was a good decision to do it team-by-team, and not in one go. Although we had many more ideas on how to improve the migration (e.g. it does not migrate attached images), we were quite happy with it in the end.  

{{< figure src="/images/triage-migration.png" width="60%" >}}

While we might not need it again (although we have set it up to be there and watch for any new issues, and move them across), we decided to open-source it, so others in the same situation don’t have to write it again.  
We hope you find it useful!
