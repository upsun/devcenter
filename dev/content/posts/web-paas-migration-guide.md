---
#################################
# Don't touch these settings.
date: '2024-09-27T14:19:39+07:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "How to migrate from OVH Web PaaS"
subtitle: "Migrating OVH Web PaaS projects to Upsun or Platform.sh"

# Replace if you have a good image.
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/ovhpaas.png
# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - vrobert78

# Choose ONE of the options below:
categories:
#   - core-concepts
  # - how-it-works
#   - discussions
  # - experiments
  - how-tos
#   - releases
#   - tutorials
#   - featured

# Tags don't do anything yet, so ignore for now.
# tags:
#   - events
#   - integrations
---

{{< figure src="/images/ovhpaas.png" class="header-img" alt="Unsplash photo by Marc Wieland" attr="Photo by [Marc Wieland](https://unsplash.com/@marcwieland95?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash) on [Unsplash](https://unsplash.com/photos/cloud-photo-zrj-TPjcRLA?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash)">}}

This document aims to explain how to migrate your existing Web PaaS project to Platform.sh from OVHcloud infrastructure, and also how you can benefit from an Upsun voucher that will give you roughly two months for free.

If at any time you need assistance or want to discuss your project migration, [join us on Discord](https://discord.gg/platformsh) - specifically the `#ovhcloud-webpaas-migration` channel - or file a [support ticket](https://console.upsun.com/-/users/~/tickets/open).

## Choosing the right offer

Platform.sh, a member of the French Tech 120 since 2020, is the leading company in Platform as a Service solutions (PaaS).
OVHcloud Web PaaS was built and maintained by Platform.sh.
Therefore, moving from Web PaaS to Platform.sh is very straightforward.

Platform.sh currently has 3 different offers:

1. Upsun, our newest offering, a resource-based self-service application platform
1. Platform.sh Professional, our original self-service PaaS
1. Platform.sh Enterprise for guaranteed Support and Uptime SLAs

### Upsun

Upsun is our latest product iteration, built on the same technical stack and infrastructure as Platform.sh.
Upsun is as stable and as robust as Platform.sh, but with a differentiating set of features like usage-based billing, horizontal scaling, and more.

Upsun pricing is fully transparent, and you'll find all the details at [https://upsun.com/pricing/](https://upsun.com/pricing/).

To ease your migration, Platform.sh offers a voucher that roughly provides you two months for free.
Moving from Web PaaS to Upsun will require one additional step to migrate the PaaS configuration files to the new format.

Start on Upsun now by [using your 5-day free trial](https://auth.upsun.com/register?utm_source=migration-guide&utm_campaign=ovh-web-paas-migration).

### Platform.sh Professional

Platform.sh's self-service offering (Professional) is the simplest choice, as it'll not require any change in the configuration. The three configuration files already in your project will remain 100% identical. All the plans are described at [on our pricing page](https://platform.sh/pricing/).

By choosing this path, you can lead your migration yourself, as everything is done in self-service, from the project creation to the go-live.

[Start now with a free 30-day trial](https://auth.api.platform.sh/register?utm_source=migration-guide&utm_campaign=ovh-web-paas-migration)

### Platform.sh Enterprise

If your project has specific requirements such as:

-   Support and Uptime guaranteed SLAs (up to 99.99%)
-   Higher isolation level with dedicated VMs
-   CDN

The Enterprise offering from Platform.sh is there to fill out these needs.

Choosing Enterprise comes with a white-glove onboarding. Our specialists will train your team and accompany it in the migration process.

The Enterprise offer starts at 15k€/year.

If you're a Web Agency, ensure to review our [Agency Partner Program](https://platform.sh/solutions/digital-agencies/) which comes with huge benefits.

Please reach out [to the migration team](mailto:migration-webpaas@platform.sh) for more details...

## Migration Steps

The migration plan below applies to projects you'd like to migrate to Upsun or non-Enterprise Platform.sh (Platform.sh Professional).

{{< callout >}}
If you've chosen the Platform.sh Enterprise offer, our teams will guide you through the subscription and migration process.
{{< /callout >}}

To ease the migration process, we've only described the process based on the CLI. 
Please note that the use of the Web UI, also called Console, is also possible.

{{% steps %}}

### Prepare to migrate

Before moving any code or data from your Web PaaS project, you'll need to set up your account and download the CLI.

1.  **Lower the TTL of your DNS:**
    Lowering the Time To Live of the DNS entries you want to migrate is important for the fastest migration. Access your DNS management system and adjust the TTL of each entry you'll update.
    Depending on your registrar and the time to live (TTL) you set, it can take anywhere from 15 minutes to 72 hours for DNS changes to be taken into account, so it's best to reduce this value to incur the lowest possible transition time.

1.  **Register:**
    Registration will grant you access to the platform and the free trial.

      - Sign up for an [Upsun account](https://auth.upsun.com/register?utm_source=migration-guide&utm_campaign=ovh-web-paas-migration)
      - Sign up for a [Platform.sh account ](https://auth.api.platform.sh/register?utm_source=migration-guide&utm_campaign=ovh-web-paas-migration)

1.  **Install the CLI:**
    The migration steps will require the use of our Command Line Interface. 
    The installation process is described in our documentation.
    Follow the directions there to install _and_ to validate that your account has been authenticated locally.

      - [Download the Upsun CLI](https://docs.upsun.com/administration/cli.html#1-install)
      - [Download the Platform.sh CLI](https://docs.platform.sh/administration/cli.html#1-install)
      - [Download the WebPaaS CLI](https://eu.cli.webpaas.ovhcloud.com/)

1.  **Create an organization:**
    Before you can create your first project, you must configure an organization. 
    Organizations are mandatory to manage projects, billing, and more.

      ```bash
      upsun organization:create
      ```

      or

      ```bash
      platform organization:create
      ```

1.  **Create a new project:**
    Run one of the following commands with the region parameter set to FR-3, the OVH region hosted in Graveline like your previous Web PaaS project:

      ```bash
      upsun project:create --region=fr-3.platform.sh
      ```

      or

      ```bash
      platform project:create --region=fr-3.platform.sh
      ```

    Then answer the questions: choose the right organization, set a name to your project, and set the name of your production environment.

    The project creation process will return you two important pieces of information:

    -   **Project ID** named `$PROJECT_ID` in the next steps
    -   **Git URL** named `$GIT_URL` in the next steps

    Please, save them both, they will be required in the following steps.


1.  **Invite collaborators:**
    Invite your collaborators to the project by running the **user:add** command, and answering the interactive questions.

      ```bash
      upsun user:add
      ```

      or

      ```bash
      platform user:add
      ```

### Migrate code

Once your project has been set up, it's time to move your application code and (if relevant) source code integrations to the new destination.

1.  **(Option 1) Configure source integration:**
    If you use a source integration with GitHub, GitLab, or Bitbucket for your Web PaaS project, you'll need to add the same integration to your new project.
    If you don't use source integration, you can pass this step, and go directly to the next step.

    ```bash
    upsun integration:add
    ```

    or

    ```bash
    platform integration:add
    ```

    Run the command and answer the questions.
    Once the integration has been configured, your environments should now be visible on either Upsun or Platform.sh.
    The initial activities may fail since the configuration needs to be updated, but that will be updated in the next steps.

1.  **(Option 2) Clone project locally from OVH Web PaaS:**
    Now that your new project is ready, we can start the code migration.
    For that, we must have your Web PaaS project cloned locally.

    Run the **get** command with the Web PaaS CLI:

    ```bash
    webpass get $YOUR_WEBPAAS_PROJECT_ID
    ```

    If you don't know your Web PaaS project ID, it's displayed on your project Console at [https://eu.console.webpaas.ovhcloud.com/](https://eu.console.webpaas.ovhcloud.com/).

    Connect the local repository to the new project you created (`$PROJECT_ID`):

    ```bash
    upsun project:set-remote $PROJECT_ID
    ```

    or

    ```bash
    platform project:set-remote $PROJECT_ID
    ```

    Then push your code:

    ```bash
    git push platform $OLD_PRODUCTION_BRANCH:$NEW_PRODUCTION_BRANCH
    # or
    git push upsun $OLD_PRODUCTION_BRANCH:$NEW_PRODUCTION_BRANCH
    ```

    Where:

    - `$OLD_PRODUCTION_BRANCH` is the branch name of your production environment on Web PaaS, usually **Master** or **Main**, 
    - `$NEW_PRODUCTION_BRANCH` is the branch name of your production environment on your new project as defined during creation.

    Once the code is pushed, it triggers a build, and your app will be deployed on your new project. 

1.  **Update configuration files:**

    If you're migrating to Platform.sh, you can skip this step, as your configuration is already compatible.
    Continue below if you are migrating to Upsun.

    Create a new branch to update your configuration.

    ```bash
    git checkout -b upsunfiy
    ```

    Compared to Platform.sh where there are three configuration files (routes, application, services), on Upsun everything is regrouped in a single `config.yaml` file.
    To ease the migration our team has developed a conversion tool that you can download from [GitHub](https://github.com/upsun/convsun/releases).

    Copy the binary `convsun` on your local machine from the **Releases** page linked above, then run:

    ```bash
    convsun --src $WEBPAAS_PROJECTPATH
    ```

    Where `$WEBPAAS_PROJECTPATH` is the local path to your Web PaaS project.
    The converter will add a new file to the `.upsun` folder containing the new configuration.
    Add this new folder to your project Git repository and commit the change:

    ```bash
    git add .upsun/config.yaml
    git commit -m "Add Upsun configuration"
    upsun push
    ```

    If you are using a source integration, you will need to review these changes deployed as expected on a pull request.
    Through that integration, you may also need to activate (`upsun environment:activate pr-XX`) the environment manually to review.
    If you are not using a source integration, you may likewise need to activate the environment manually (`upsun environment:activate`).

    When you are satisfied that the project appears to have deployed as expected, merge it either from your Git hosting service or directly in the Web Console.

### Recreate variables

Let's now focus on the variables.
There are two types of variables: at the project level and the environment level.
You can list all the existing variables with the following command:

```bash
webpaas variable:list
```

You'll need to recreate all these existing variables with the same attributes.
To do so, run the following command for each of them:

```bash
upsun variable:create
```

or

```bash
platform variable:create
```

### Migrate data

With code and variables migrated, next is the data within our services and writable mounts.

1.  **Migrate databases:**

    To sync the database, the easiest way is to chain two CLI commands.
    Get into your Web PaaS project folder and run the following command:

    ```bash
    webpaas db:dump -o -e $OLD_PRODUCTION_BRANCH | upsun sql -p $PROJECT_ID -e $NEW_PRODUCTION_BRANCH
    ```

    or

    ```bash
    webpaas db:dump -o -e $OLD_PRODUCTION_BRANCH | platform sql -p $PROJECT_ID -e $NEW_PRODUCTION_BRANCH
    ```

1.  **Recreate mounts:**

    Get into your Web PaaS project folder and run the following command to list all the existing mount points:

    ```bash
    webpaas mounts
    ```

    For each of the mount point, run the following command to download the remote content to your local machine:

    ```bash
    webpaas mount:download -m $MOUNT_PATH --target=$LOCAL_MOUNT_FOLDER
    ```

    Then one of the following to upload them to the new project:

    ```bash
    upsun mount:upload -p $PROJECT_ID --source=$LOCAL_MOUNT_FOLDER --mount=$MOUNT_PATH
    ```

    or

    ```bash
    platform mount:upload -p $PROJECT_ID --source=$LOCAL_MOUNT_FOLDER --mount=$MOUNT_PATH
    ```

### Configure integrations

You may have configured other integrations on your Web PaaS project like:

-   `health.email`
-   `webhook`
-   `script`
-   `health.slack`
-   …

You can use the following command to list all the existing integrations:

```bash
webpaas integrations
```

You can configure them in your new project:

```bash
upsun integration:add
```

or

```bash
platform integration:add
```

### Going live

In these final steps, you will update the domain configuration of the new project to complete the migration.

1.  **Verify project running as expected:**
    Give the project a thorough look.
    Following the steps below will complete the migration, so be sure your project is functioning as expected at this point.

1. **Redeem your voucher:**
    Log into your account on the management console. Then:

    -   Select the organization where you have created your new project,
    -   Expand the menu in the top-left corner and click **Billing**,
    -   Select the **Vouchers** tab, and then select **Redeem Voucher**,
    -   Enter the voucher code you have received already for the migration. 

1.  **Upgrade to production resources:**
    Once your voucher has been saved, you can configure your project for production.

    - ***Case 1: Upsun:***
        Upsun does not have the concept of "plan" as there is on Platform.sh.
        Your project was initialized with some default set of resources (disk, CPU, RAM), and does not _require_ changes to these setting in order to add a domain and go live.
        However, those default resources will likely not match what you have on Web PaaS, so they will need updating to keep everything working properly.

        Review the currently allocated resources:

        ```bash
        upsun resources:get -p $PROJECT_ID
        ```

        Then adjust those resources interactively if necessary:

        ```bash
        upsun resources:set -p $PROJECT_ID
        ```

    - ***Case 2: Platform.sh:***
        At creation, your project was set on a **Development** plan, but that must be upgraded to a production plan.
        Navigate to your project, click the three dots menu in the upper right hand corner and select **Edit plan**.
        From there, choose the appropriate plan and associated resources and save your choice.

1.  **Configure your domains:**
    First, list all the existing domains of your Web PaaS project:

    ```bash
    webpaas domain:list
    ```

    With this list in hand, follow the instructions below to set up your production domain on the project:

      - [Upsun: set up a custom domain](https://docs.upsun.com/domains/steps.html)
      - [Platform.sh: set up a custom domain](https://docs.platform.sh/domains/steps.html)

1.  **Reset your DNS TTL:**
    Once the TTL has expired, the web traffic should be directed to your new project.
    Ensure that there is no longer any traffic on your Web PaaS project by checking the logs:

    ```bash
    webpaas logs access
    ```

    If everything is fine, then adjust the TTL of your DNS entries to their previous value.

{{% /steps %}}

That's it!
By following these steps, you should have everything you need to migrate an OVH WebPaaS project to Upsun or Platform.sh.

If at any time you ran into issues, or if things still aren't working out as you'd expect, we're here to help!
[Join us on Discord](https://discord.gg/platformsh) - specifically the `#ovhcloud-webpaas-migration` channel.
Someone from our team will be able to help you through the migration.

See you there!
