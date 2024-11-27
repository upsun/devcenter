---
#################################
# Don't touch these settings.
date: '2024-11-26T15:34:22-05:00'
sidebar:
    exclude: true
type: post
#################################
# Update the title
title: "PHP 8.4 is here!"
subtitle: "Now available on Upsun & Platform.sh projects"

# Replace if you have a good image. 
# Images are not used (yet) on individual pages, only on lists of articles.
image: /images/elephant-84.png

# Define this value if listing an external blog post not written within this site.
#link: "https://upsun.com/blog/blackfire-infrastructure-processes/"

# Update author with one or more
#   -> content/community/engage/people/AUTHOR.md
#   -> https://github.com/AUTHOR
#   -> AUTHORFirst AUTHORLast
author:
  - chadwcarlson

# Choose ONE of the options below:
categories:
#   - compare
#   - core-concepts
#   - how-it-works
#   - discussions
#   - experiments
  # - how-tos
  - featured
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

PHP 8.4 was [officially released](https://www.php.net/archive/2024.php#2024-11-21-4) on November 21st, and with it comes a number of improvements and new features that you can - as of today - begin working with on your Upsun and Platform.sh projects. 

## How to upgrade

You can explore all that PHP 8.4 has to offer on your projects today.

{{% steps %}}

### Install the new version

First, follow the official instructions for installing PHP 8.4 on your computer:

- [Unix systems instructions](https://www.php.net/manual/install.unix.php)
- [macOS instructions](https://www.php.net/manual/install.macosx.php)
- [Windows binaries](https://windows.php.net/download/)

Then you can check it's installed and accessible with:

```bash
php -r 'echo PHP_VERSION;'
```

### Create a new environment

Create a branch dedicated to the latest version:

```bash
upsun branch php-84-testing
```

### Upgrade your dependencies

Run the command:

```bash
composer upgrade
```

### Upgrade your configuration

{{< tabs items="Single runtime image,Composable image" >}}

{{< tab >}}

On Upsun,

```yaml {filename=".upsun/config.yaml"}
applications:
  your_application:
    type: "php:8.4"
```

and on Platform.sh:

```yaml {filename=".platform.app.yaml"}
name: "your_application"
type: "php:8.4"
```
{{< /tab >}}

{{< tab >}}
At the time of this post, PHP 8.4 is still a part of the 24.11 Nix packages **Beta** channel.
Beta channels are not yet supported for the Upsun and Platform.sh Composable image.
As soon as it becomes available on the stable channel, you will be able to upgrade to PHP 8.4 as shown below.

On Upsun,

```yaml {filename=".upsun/config.yaml"}
applications:
  your_application:
    stack:
      - "php@8.4"
```

and on Platform.sh:

```yaml {filename=".platform.app.yaml"}
name: "your_application"
stack:
  - "php@8.4"
```

{{< /tab >}}

{{< /tabs >}}

{{% /steps %}}

And test the changes on the new environment with an `upsun push`. 
Once the environment is live, you can merge the upgrades now (`upsun merge`), then come back to visit many of the performance improvements and new features packaged in the release below.

You can as always find more information about available extensions and PHP configuration in the [Upsun](https://docs.upsun.com) and [Platform.sh](https://docs.platform.sh) documentation.

{{< callout type="blue" >}}
**A note on production upgrades:**

There are some noted [incompatibilities](https://www.php.net/manual/en/migration84.incompatible.php) that come with this new minor version release that you should keep in mind when upgrading production environments. 
Consult those warnings and the links below for more details.
{{< /callout >}}

## What's changed in PHP 8.4?

With this release comes a number of resources to better understand what's changed, and how those changes impact your applications:

- A comprehensive list of all changes can be found in [the ChangeLog](https://www.php.net/ChangeLog-8.php#8.4.1)
- A side-by-side comparison on the [release homepage](https://www.php.net/releases/8.4/en.php)
- [Migrating from PHP 8.3.x to PHP 8.4.x instructions](https://www.php.net/manual/en/migration84.php), which further breaks down the changes into:
  - [New features](https://www.php.net/manual/en/migration84.new-features.php)
  - [New classes, Enums, and interfaces](https://www.php.net/manual/en/migration84.new-classes.php)
  - [New functions](https://www.php.net/manual/en/migration84.new-functions.php)
  - [New global constants](https://www.php.net/manual/en/migration84.constants.php)
  - [Backward incompatible changes](https://www.php.net/manual/en/migration84.incompatible.php)
  - [Deprecated features](https://www.php.net/manual/en/migration84.deprecated.php)
  - [Removed extensions](https://www.php.net/manual/en/migration84.removed-extensions.php)

### New features

While there are a great number of improvements, updates, and added functions and subclasses in this release, much of the discussion up to this point has seemed to focus primarily on three enhancements in particular.

1. **Property hooks**

    With much inspiration from Kotlin, Property hooks in PHP 8.4 allow for defining additional logic (such as validation) associated with an objects `get`/`set` operations. 

    [From php.net](https://www.php.net/manual/en/migration84.new-features.php#migration84.new-features.core.property-hooks):

    > Object properties may now have additional logic associated with their get and set operations. Depending on the usage, that may or may not make the property virtual, that is, it has no backing value at all.
    > 
    > ```php
    > <?php
    > class Person
    > {
    >     // A "virtual" property.  It may not be set explicitly.
    >     public string $fullName {
    >         get => $this->firstName . ' ' . $this->lastName;
    >     }
    > 
    >     // All write operations go through this hook, and the result is what is written.
    >     // Read access happens normally.
    >     public string $firstName {
    >         set => ucfirst(strtolower($value));
    >     }
    > 
    >     // All write operations go through this hook, which has to write to the backing value itself.
    >     // Read access happens normally.
    >     public string $lastName {
    >         set {
    >             if (strlen($value) < 2) {
    >                 throw new \InvalidArgumentException('Too short');
    >             }
    >             $this->lastName = $value;
    >         }
    >     }
    > }
    > 
    > $p = new Person();
    > 
    > $p->firstName = 'peter';
    > print $p->firstName; // Prints "Peter"
    > $p->lastName = 'Peterson';
    > print $p->fullName; // Prints "Peter Peterson"
    > ```

    **Resources:**

    - [Original RFC](https://wiki.php.net/rfc/property-hooks)
    - [Release notes](https://www.php.net/manual/en/migration84.new-features.php#migration84.new-features.core.property-hooks)

    {{< callout type="blue" >}}
    **Consider the following:**

    If you're looking for even more background into not just the impact of property hooks, but also the history behind the RFC process in conjunction with [Asymmetrics Visibility](https://wiki.php.net/rfc/asymmetric-visibility) to replace the older [Property Accessors](https://wiki.php.net/rfc/property_accessors) RFC, be sure to check out the great article by Larry Garfield on the topic on the PHP foundation website - [***How Property Hooks Happened***](https://thephp.foundation/blog/2024/11/01/how-hooks-happened/).
    {{< /callout >}}

1. **Asymmetric visibility**

    While the visibility of `get` and `set` object operations have historically been "symmetric" - that is, both must be `public`, `private`, or `protected` - PHP 8.4 allows for asymmetrics definitions in your objects.

    [From php.net](https://www.php.net/manual/en/migration84.new-features.php#migration84.new-features.core.asymmetric-property-visibility):

    > Object properties may now have their `set` visibility controlled separately from the `get` visibility.
    > 
    > ```php
    > <?php
    > class Example
    > {
    >     // The first visibility modifier controls the get-visibility, and the second modifier
    >     // controls the set-visibility. The get-visibility must not be narrower than set-visibility.
    >     public protected(set) string $name;
    > 
    >     public function __construct(string $name)
    >     {
    >         $this->name = $name;
    >     }
    > }
    > ```

    **Resources:**

    - [Original RFC](https://wiki.php.net/rfc/asymmetric-visibility-v2)
    - [Release notes](https://www.php.net/manual/en/migration84.new-features.php#migration84.new-features.core.asymmetric-property-visibility)

1. **Lazy objects**

    PHP 8.4 takes the responsibility of the lazy-initialization of object out of userland, bringing it into the PHP engine itself. 

    From [php.net](https://www.php.net/manual/en/migration84.new-features.php#migration84.new-features.core.lazy-objects):

    > It is now possible to create objects whose initialization is deferred until they are accessed. Libraries and frameworks can leverage these lazy objects to defer fetching data or dependencies required for initialization.
    > Object properties may now have their `set` visibility controlled separately from the `get` visibility.
    > 
    > ```php
    > <?php
    > class Example
    > {
    >     public function __construct(private int $data)
    >     {
    >     }
    > 
    >     // ...
    > }
    >
    > $initializer = static function (Example $ghost): void {
    >     // Fetch data or dependencies
    >     $data = ...;
    >     // Initialize
    >     $ghost->__construct($data);
    > };
    > 
    > $reflector = new ReflectionClass(Example::class);
    > $object = $reflector->newLazyGhost($initializer);
    > ```

    **Resources:**

    - [Original RFC](https://wiki.php.net/rfc/lazy-objects)
    - [Release notes](https://www.php.net/manual/en/migration84.new-features.php#migration84.new-features.core.lazy-objects)
    - [Feature documentation](https://www.php.net/manual/en/language.oop5.lazy-objects.php)

### Deprecations

You can find a list of all deprecations for PHP 8.4 on the [php.net wiki](https://windows.php.net/download/).

## What's next?

With 8.4 now released, the road to 8.5 begins with a new round of discussion and voting on [RFCs](https://wiki.php.net/rfc), so be sure to follow the debate there. 

Otherwise, you're all set!
Join us in the [Discord](https://discord.gg/platformsh) and let us know how it goes. 

Be seeing you!
