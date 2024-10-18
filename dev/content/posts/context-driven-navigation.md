---
#################################
# Don't touch these settings.
date: '2024-10-03T08:42:37-04:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "Context driven navigation"
subtitle: "So you can naturally flow through Upsun"

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/convert_typescript.webp

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - natalie-harper

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
  # - how-it-works
#   - discussions
#   - experiments
  # - how-tos
  - releases
#   - transcripts
#   - tutorials
#   - use-cases

# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations
math: true
---

You may have noticed some changes to navigation and user settings on your Platform.sh dashboard. 
That’s because we’ve been listening! 
Our product design team has taken stock of all the feedback you’ve shared about our navigation over the years. 
And together, we’re creating a better user experience as we scale. 

More recently, we’ve needed to introduce new organization settings pages for user management, teams, and security—but where could we fit them? 
Instead of crowding the existing user widget further, we thought it was time to implement your feedback and improve the overall navigation experience. 

## What we've heard

1. That it’s difficult to find and change the organization you’re working in. Why? We used to have an organization picker at the top left, beside our logo, and our organization settings pages in the user widget.
1. When we moved the organization settings pages to our user widget dropdown (along with a range of other profile settings pages), it became more difficult to find.

## Here's what we changed

### Organization picker

{{< figure src="/images/context-driven-navigation/blog-org_menu@2x.jpg" caption="Organization picker. Found in the upper left-hand corner to the Upsun Management Console." >}}

We’ve combined organization selection and organization settings into one dropdown menu, located at the top left of your header bar. 
Now you can create a new organization, toggle between organizations, and access organization settings from the same dropdown menu. 

We also wanted to provide users with one-click access to the following pages (depending on your permissions):

- Projects
- Settings
- Billing
- Security
- Teams
- Users
- Invite a new user

### Organization selection

After we shipped our new organization picker, we heard this from you:

> By listing organizations in the order they were added—rather than most frequently used or most recently used—users often had to scroll through every organization to get to the one they needed most.

But don’t worry; we listened. 
Now, by default, users are sent back to their most recently active organization. 
Just sign in and get straight back to work!

We also leave the org picker open after you select a new one, in case you want to access a settings page in that new organization. 
Once you’ve made a selection, the org picker closes, and you can also close it by clicking outside of the dropdown.

### User widget 

{{< figure src="/images/context-driven-navigation/blog-user_menu@2x.jpg" caption="Updated User widget options. Found in the upper right-hand corner to the Upsun Management Console." >}}

Along with the latest improvements to our organization picker, we’re taking the opportunity to make your user widget even better, too. 
Now, **My profile** page links are accessible directly from the user widget. 
Previously, you had to navigate to the **My profile** page to get these links; this change makes it much easier. 

Plus, due to high demand from our developers, it’s now easier than ever to change the console theme between light, dark, and WCAG accessibility mode ;) 
You can thank them for that! 

Your updated user widget now features all of the following links, so you can access them with one click:

- My profile
- Connected accounts
- Authentication
- API tokens
- SSH keys
- Theme selection

And that’s not all!

### New help dropdown

{{< figure src="/images/context-driven-navigation/blog-help_menu@2x.jpg" caption="Help dropdown. Found in the upper right-hand corner to the Upsun Management Console." >}}

With all of the changes to your navigation, we wanted to ensure you have easier access to the pages that matter most when you’re stuck and needing a hand. 
That’s why we’ve also created a new **Help** dropdown linking directly to:

- [Documentation](https://docs.upsun.com)
- Support
- Our [Discord](https://discord.com/invite/platformsh) community, where you can chat with members of our team and other Upsun users for support and ideas
- [Submit an idea](https://next.platform.sh/tabs/4-under-development/submit-idea), to share product ideas with us directly


## What do you think of these updates?

We hope these updates have improved your navigation experience with Upsun! 
Each update has been designed to provide you with more direct pathways to support, your profile pages, and to your organization settings pages. 
We’re always listening to our users, so please don’t hesitate to [share your feedback or submit an idea](https://next.platform.sh/tabs/4-under-development/submit-idea)! 
Our user experience team is here to continuously improve your product experience. 
