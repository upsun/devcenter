---
title: Upsun Developer Center
layout: hextra-home
---

<!-- <div class="hx-mt-6"></div> -->

{{< hextra/hero-container
  image="images/upsun-hello-world.svg"
  imageTitle="Console"
  imageWidth="100%"
  imageClass="max-md:hx-hidden"
  class="hx-pt-6 hx-pb-6"
>}}
<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline style="line-height: 1.25 !important;">}}
  Welcome to the&nbsp;<br class="sm:hx-block hx-mt-6 hx-hidden" /><span style="color: #6046FF;">Upsun Developer Center</span>
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
  Your hub for all resources related to the Upsun product offerings. All the latest demos, examples, documentation, and
  articles for each of your frameworks and languages. Join the community. And build something great on the Upsun cloud
  application platform.<br class="sm:hx-block hx-hidden" />
{{< /hextra/hero-subtitle >}}
</div>

{{< hextra/hero-button text="Get Started" link="https://docs.upsun.com/get-started/here.html" class="upsun-button button-primary"
  style="margin-right: 10px;"
>}}
{{< hextra/hero-button text="What is Upsun?" link="https://docs.upsun.com/learn/overview.html" class="upsun-button button-secondary max-md:hx-hidden"
>}}

{{< /hextra/hero-container >}}

<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline style="font-size: 2rem !important;" >}}
  New to Upsun?
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
Get to know Upsun's core concepts.
Container-based deployments built on Git. Managed services and custom applications. Integrations, tools, and more.
{{< /hextra/hero-subtitle >}}
</div>

{{< hextra/feature-grid >}}
  {{< hextra/feature-card
    title="Manage resources"
    imageStyle="padding-right: 1.5rem !important;"
    icon="configure"
    subtitle="Upsun allows you to configure resources (CPU, RAM, and disk) per environment for each of your apps and services. You can add instances of your apps depending on your needs."
    link="https://docs.upsun.com/manage-resources.html"
  >}}
  {{< hextra/feature-card
    title="Access control"
    icon="user"
    subtitle="Access to code, production data, and secrets can be finely tuned, managed, and audited with Organizations and Teams from the Console, CLI, or API."
    link="https://docs.upsun.com/administration/organizations.html"
  >}}
  {{< hextra/feature-card
    title="Projects & Git"
    icon="branch"
    subtitle="With a source integration, Upsun projects are a mirror of external Git repositories. Pull requests inherit production data by default -- true staging environments for every revision."
    link="https://docs.upsun.com/integrations/source.html"
  >}}
  {{< hextra/feature-card
    title="Runtime languages"
    icon="tree"
    subtitle="We support 10 popular runtimes out of the box and much more with a bit of tinkering. Whether you do 100% JS or use PHP, Java, Python, Ruby or Rust, we have you covered."
    link="https://docs.upsun.com/languages.html"
  >}}
  {{< hextra/feature-card
    title="Managed services"
    icon="backup"
    subtitle="Augment your application capabilities with our included services: Databases, caches, queues, indexes. Managed and ready to deploy."
    link="https://docs.upsun.com/add-services.html"
  >}}
  {{< hextra/feature-card
    title="Networking"
    icon="router"
    subtitle="Every project needs some hostnames and certificates. Dive into how HTTP routes are defined for your projects."
    link="https://docs.upsun.com/define-routes.html"
  >}}
  {{< hextra/feature-card
    title="Observability"
    icon="search"
    subtitle="Power is nothing without control. Keep an eye on how your applications behave on our platform. Dive into code bottlenecks with ease."
    link="https://docs.upsun.com/increase-observability.html"
  >}}
  {{< hextra/feature-card
    title="API"
    icon="webhook"
    subtitle="Did you know our platform can be fully automated by our API? Integrate other tools or create your own management layer."
    link="https://api.upsun.com/docs"
  >}}
  {{< hextra/feature-card
    title="CLI"
    icon="code"
    subtitle="As a developer first product, our CLI should be your main Upsun interface. Get it setup and start deploying your projects through the terminal."
    link="https://docs.upsun.com/administration/cli.html"
  >}}
{{< /hextra/feature-grid >}}

<div class="hx-mt-6"></div>


<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline style="margin-top: 4rem; font-size: 2rem !important;">}}
  What's new
{{< /hextra/hero-headline >}}
</div>

{{< custom/whats-new >}}

<div style="margin: 5rem auto 1rem auto;">

{{< hextra/hero-button text="View all articles" link="/posts/"
  class="upsun-button button-primary" style="margin-right: 10px;"
>}}

</div>

<div class="hx-mt-6"></div>

<div class="hx-mt-6"></div>

<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline style="margin-top: 4rem; font-size: 2rem !important;" >}}
  Ready to deploy?
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
  No matter which framework use, the basic rules of the Upsun Cloud Application platform remain the same. See the resources below to get started today.
{{< /hextra/hero-subtitle >}}
</div>

{{< hextra/feature-grid >}}
  {{< hextra/feature-card
    title="Express"
    icon="nodejs"
    subtitle="Express is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications."
    link="https://docs.upsun.com/get-started/stacks/express.html"
  >}}
  {{< hextra/feature-card
    title="Django"
    icon="django"
    subtitle="Build with the \"high-level\" Python web framework to develop your APIs, backends, and microservices rapidly and securely."
    link="https://docs.upsun.com/get-started/stacks/django.html"
  >}}
  {{< hextra/feature-card
    title="Laravel"
    icon="laravel"
    subtitle="Start building your next application with Laravel. The PHP framework for web artisans."
    link="https://docs.upsun.com/get-started/stacks/laravel.html"
  >}}
  {{< hextra/feature-card
    title="Symfony"
    icon="symfony"
    subtitle="Symfony is a set of reusable PHP components and a high performance PHP framework for web projects."
    link="https://docs.upsun.com/get-started/stacks/symfony.html"
  >}}
  {{< hextra/feature-card
    title="Next.js"
    icon="nodejs"
    subtitle="Used by some of the world's largest companies, Next.js enables you to create high-quality web applications with the power of React components."
    link="https://docs.upsun.com/get-started/stacks/nextjs.html"
  >}}
  {{< hextra/feature-card
    title="Flask"
    icon="flask"
    subtitle="Flask is a lightweight WSGI web application framework. It is designed to make getting started quick and easy, with the ability to scale up to complex applications."
    link="https://docs.upsun.com/get-started/stacks/flask.html"
  >}}
    {{< hextra/feature-card
    title="WordPress"
    icon="wordpress"
    subtitle="The open source publishing platform of choice for millions of websites worldwide—from creators and small businesses to enterprises."
    link="https://docs.upsun.com/get-started/stacks/wordpress.html"
  >}}
  {{< hextra/feature-card
    title="Strapi"
    icon="strapi"
    subtitle="The leading open-source headless CMS. 100% JavaScript / TypeScript and fully customizable."
    link="https://docs.upsun.com/get-started/stacks/strapi.html"
  >}}
  {{< hextra/feature-card
    title="More frameworks"
    icon="arrow-right"
    subtitle="With support for even more runtimes like Go, Lisp, Elixir, Ruby and Rust, start deploying your application on Upsun."
    link="https://docs.upsun.com/get-started/stacks.html"
  >}}
{{< /hextra/feature-grid >}}

<div class="hx-mt-6" style="margin-top: 4rem;"></div>

{{< custom/hero-container
  class="hx-pt-6 hx-pb-6"
>}}
<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline >}}
  Infrastructure-as-code,
  <br class="sm:hx-block hx-hidden" /><span style="color: #6046FF;"> resources on demand.</span>
{{< /hextra/hero-headline >}}
</div>

{{< hextra/hero-subtitle >}}
<p class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl">
Upsun provides flexibility when defining your environments. 
<!-- You can deploy several runtimes across multiple applicaitons containers -->
<!-- The Upsun composable image &mdash; built on Nix &mdash; provides flexibility when defining your app. You can install several runtimes into your application containers, in a “one image to rule them all” approach: -->
</p><br class="sm:hx-block hx-hidden" />
<ul class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl" style="margin-left: 20px; list-style: disc;">
  <li>You can deploy several runtimes across multiple application containers.</li>
  <li>Provision one or many managed services with a few lines of YAML.</li>
  <li>Completely customize your build and deploy process, locking configuration to reusable, environment-independent build images.</li>
</ul>
<br class="sm:hx-block hx-hidden" />
<p class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl">
What can you build?
</p><br class="sm:hx-block hx-hidden" /><br class="sm:hx-block hx-hidden" />
{{< /hextra/hero-subtitle >}}

<!-- {{< hextra/hero-button text="See how it works" link="https://docs.upsun.com/create-apps/app-reference/composable-image.html" 
  class="upsun-button button-primary" style="margin-right: 10px;"
>}}{{< hextra/hero-button text="Why we chose Nix" link="https://www.youtube.com/watch?v=LhVjKes2Wsc"
  class="upsun-button button-secondary max-md:hx-hidden" style="margin-right: 0px;"
>}} -->

{{< hextra/hero-button text="View the specification" link="https://docs.upsun.com/create-apps.html" 
  class="upsun-button button-primary" style="margin-right: 10px;"
>}}{{< hextra/hero-button text="Understand resources" link="https://docs.upsun.com/manage-resources.html" 
  class="upsun-button button-secondary max-md:hx-hidden" style="margin-right: 0px;"
>}}

<----->

<div class="landing-code">

```yaml {filename="Configure infrastructure with a commit and a push"}
applications:
  backend: 
    source:
      root: api
    type: "python:3.12"
    relationships:
      db: 
    hooks:
      build: pip install -r requirements.txt
      deploy: python manage.py migrate
    web:
      commands:
        start: |
          "gunicorn -b unix:$SOCKET myapp.wsgi:application"
services:
  db:
    type: postgresql:16 
```

```yaml {filename="Set your resources"}
upsun resources:set --count backend:2 \
  --disk backend:512 --size db:0.5
```

</div>

{{< /custom/hero-container >}}

<!-- <div class="hx-mt-6" style="margin-top: 4rem; margin-left: auto; margin-right: auto;">

{{< hextra/hero-headline >}}
  Welcome to the <span style="color: #6046FF;"> Upsun Developer Center</span>
{{< /hextra/hero-headline >}}

{{< custom/search2 >}}

</div> -->

<!--  -->

<!-- <div class="hx-mt-6" style="margin-top: 4rem; margin-left: auto; margin-right: auto;">

{{< hextra/hero-headline >}}
  Composable images, <span style="color: #6046FF;"> powered by Nix.</span>
{{< /hextra/hero-headline >}}

{{< tabs items="Installation script,Homebrew,Scoop" >}}

{{< tab >}}
```
curl -fsSL https://raw.githubusercontent.com/platformsh/cli/main/installer.sh | VENDOR=upsun bash
```
{{< /tab >}}
{{< tab >}}
```
brew install platformsh/tap/upsun-cli
```
{{< /tab >}}
{{< tab >}}
```
scoop bucket add platformsh https://github.com/platformsh/homebrew-tap.git
scoop install upsun
```
{{< /tab >}}
{{< /tabs >}}

{{< hextra/hero-button text="Join the community" link="https://discord.gg/platformsh"
  class="upsun-button button-primary" style="margin-right: 10px;"
>}}{{< hextra/hero-button text="Get support" link="https://docs.upsun.com/learn/overview/get-support.html"
  class="upsun-button button-secondary max-md:hx-hidden" style="margin-right: 0px;"
>}}

</div> -->

<!-- <div class="hx-mt-6" style="margin-top: 4rem;"></div>

{{< custom/hero-container
  class="hx-pt-6 hx-pb-6"
>}}
<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline >}}
  Composable images,
  <br class="sm:hx-block hx-hidden" /><span style="color: #6046FF;"> powered by Nix.</span>
{{< /hextra/hero-headline >}}
</div>

{{< hextra/hero-subtitle >}}
<p class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl">
The Upsun composable image &mdash; built on Nix &mdash; provides flexibility when defining your app. You can install several runtimes into your application containers, in a “one image to rule them all” approach:
</p><br class="sm:hx-block hx-hidden" />
<ul class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl" style="margin-left: 20px; list-style: disc;">
  <li>Choose from over 80,000 packages from the Nixpkgs collection.</li>
  <li>Build in isolation, even different versions of the same package.</li>
  <li>No undeclared dependencies in your source code. What works on your local machine is guaranteed to work on any other.</li>
</ul>
<br class="sm:hx-block hx-hidden" />
<p class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl">
What can you build?
</p><br class="sm:hx-block hx-hidden" /><br class="sm:hx-block hx-hidden" />
{{< /hextra/hero-subtitle >}} -->

<!-- {{< hextra/hero-button text="See how it works" link="https://docs.upsun.com/create-apps/app-reference/composable-image.html"
  class="upsun-button button-primary" style="margin-right: 10px;"
>}}{{< hextra/hero-button text="Why we chose Nix" link="https://www.youtube.com/watch?v=LhVjKes2Wsc"
  class="upsun-button button-secondary max-md:hx-hidden" style="margin-right: 0px;"
>}} -->

<!-- <-----> -->


<!-- {{< tabs items="Installation script,Homebrew,Scoop" >}}

{{< tab >}}
```
curl -fsSL https://raw.githubusercontent.com/platformsh/cli/main/installer.sh | \
  VENDOR=upsun bash
```
{{< /tab >}}
{{< tab >}}
```
brew install platformsh/tap/upsun-cli
```
{{< /tab >}}
{{< tab >}}
```
scoop bucket add platformsh https://github.com/platformsh/homebrew-tap.git
scoop install upsun
```
{{< /tab >}}
{{< /tabs >}} -->

<!-- {{< /custom/hero-container >}} -->

<!--  -->

<div class="hx-mt-6"></div>

<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline style="margin-top: 4rem; font-size: 2rem !important;">}}
  Many products, one community.
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
No matter if you are a single developer, an agency, a university or part of a team in a large corporation, we have the right offering for you. Reach out to us if you have any questions on how we can partner together on your projects.
{{< /hextra/hero-subtitle >}}
</div>

{{< hextra/feature-grid >}}
    {{< hextra/feature-card
    title="Upsun"
    icon="upsun"
    class="upsun-feature-card community-card"
    style="min-height: 400px; background-color: #D5F800;"
    subtitle="Self-service. Usage-based pricing. Customize your resources, runtimes, users, frontends, backends, APIs. All the choices are yours. Welcome to the Upsun PaaS."
    link="https://docs.upsun.com"
  >}}
  {{< hextra/feature-card
    title="Platform.sh"
    icon="platformsh"
    class="platformsh-feature-card"
    style="min-height: 400px; background-color: #0E1113; color: white;"
    subtitle="Perfect for monolithic CMS and ecommerce applications. Predictable pricing. Your code, data, Git workflows, and tech stack + our fully managed cloud infrastructure, including security."
    link="https://docs.platform.sh"
  >}}
  {{< hextra/feature-card
    title="Blackfire.io"
    icon="blackfire-black"
    class="blackfire-feature-card"
    style="min-height: 400px; background-color: #6046FF; color: white;"
    subtitle="Blackfire empowers you to take back control over your application's performance. Stop firefighting by smoothly integrating Blackfire into your workflows. Build out a Continuous Observability Strategy with Blackfire."
    link="https://docs.blackfire.io/index"
  >}}
{{< /hextra/feature-grid >}}

<div class="hx-mt-6"></div>

<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline style="margin-top: 4rem; font-size: 2rem !important;">}}
  Community programs and resources
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
At Upsun, we believe in the power of community to drive innovation and foster growth. Our community programs and resources are designed to support developers, startups, and open-source projects, creating a vibrant ecosystem of collaboration and learning. From sponsorships and partnerships to educational content and interactive platforms, we offer a diverse range of opportunities for engagement and advancement. Whether you're looking to contribute, learn, or connect with like-minded individuals, our community initiatives provide the perfect launchpad for your journey in the world of cloud application development.
{{< /hextra/hero-subtitle >}}
</div>

{{< hextra/feature-grid >}}
    {{< hextra/feature-card
    title="Open source sponsorships"
    icon="lock-open"
    subtitle="Upsun is committed to being champions of open source by sponsoring incredible projects around the world that can benefit us all as a global development community."
    link="https://platform.sh/community/open-source/"
  >}}
  {{< hextra/feature-card
    title="Partners"
    icon="user-group"
    subtitle="Build a long-term, trusted partnership that empowers you to sell more of your agency's time and expertise."
    link="https://platform.sh/solutions/digital-agencies/"
  >}}
  {{< hextra/feature-card
    title="Startups"
    icon="library"
    subtitle="The tailored Upsun Startup Promotion is designed for technology startups eager to accelerate innovation while maintaining agility. "
    link="https://upsun.com/startup-promotion/"
  >}}
      {{< hextra/feature-card
    title="Examples & demos"
    icon="beaker"
    subtitle="Whether built in-house or contributed by the community, there are no shortage of examples to help you better share and understand how to work with Upsun."
    link="https://github.com/orgs/upsun/repositories?q=topic%3Aupsun-example"
  >}}
  {{< hextra/feature-card
    title="Discord"
    icon="discord"
    subtitle="Need help? Have a question or something interesting to share? Come join us in the Discord and tell us what's on your mind."
    link="https://discord.gg/platformsh"
  >}}
  {{< hextra/feature-card
    title="Podcast"
    icon="play"
    subtitle="From developers to enthusiasts, Change Mode is a podcast made by the community, for the community. #chmod."
    link="/videos/podcasts/"
  >}}
{{< /hextra/feature-grid >}}

<div class="hx-mt-6" style="margin-top: 4rem;"></div>

{{< custom/hero-container
  class="hx-pt-6 hx-pb-6"
>}}
<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline >}}
  Get help,
  <br class="sm:hx-block hx-hidden" /><span style="color: #6046FF;">share with the rest of us</span>
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">

<p class="not-prose hx-text-xl hx-text-gray-600 dark:hx-text-gray-400 sm:hx-text-xl">
  Upsun is as much about optimizing and experimenting with your solutions as it is about deploying them in the first place. Need help? We’re here to investigate. Found something interesting at the edge of the product? We want to know about it – even the wildest experiments you’ve come up with.<br class="sm:hx-block hx-hidden">
<br class="sm:hx-block hx-hidden">Share your knowledge and join the community today!
</p>

</div>

{{< hextra/hero-button text="Join the community" link="https://discord.gg/platformsh"
  class="upsun-button button-primary" style="margin-right: 10px;"
>}}{{< hextra/hero-button text="Get support" link="https://docs.upsun.com/learn/overview/get-support.html"
  class="upsun-button button-secondary max-md:hx-hidden" style="margin-right: 0px;"
>}}

<----->

<img class="max-md:hx-hidden" src="/images/dev-center-upsun-sun.svg">

{{< /custom/hero-container >}}