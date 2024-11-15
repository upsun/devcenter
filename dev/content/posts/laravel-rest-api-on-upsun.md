---
title: "Creating and deploying a Laravel REST API on Upsun in 10 minutes"
subtitle: "From bootstrapping the local project to adding a production domain."
date: 2024-11-15T10:00:00+00:00
image: /images/laravel-rest-api.png
icon: tutorial
featured: true
author:
  - gmoigneu

sidebar:
    exclude: true
type: post

description: |
    Follow this comprehensive guide to build and deploy a modern Laravel REST API on Upsun's cloud platform. We'll walk through setting up your local development environment, creating API endpoints, and deploying to production with a custom domain. This tutorial is perfect for developers looking to quickly ship production-ready Laravel applications without dealing with complex infrastructure management.
tags:
  - laravel
  - php
  - deployment
  - tutorial
categories:
  - tutorials
  - featured
math: false
# excludeSearch: true
--- 

{{< callout emoji="💡" type="blue">}}
This tutorial is part of an upcoming series exploring caching mechanisms in Next.js 15. Stay tuned for the next installment!
{{< /callout >}}


## Project Overview

In this tutorial, we'll build a REST API for managing a directory of coffee shops. This backend will later serve as the foundation for a Next.js 15 frontend application, which we'll cover in the next article of this series.

{{% steps %}}

### Setting Up Your Development Environment

We can start by installing our requirements: `php`, `composer`, `laravel` CLI and the `upsun` CLI. We are using `brew` for MacOS here but I'm sure you will be able to translate this to other systems!

```bash
brew install php8.3

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

composer global require laravel/installer

brew install platformsh/tap/upsun-cli
```

### Bootstrapping Laravel

First, we'll create a new Laravel project using the Laravel CLI. Then we'll add Laravel Sail, which provides a Docker-based development environment with PHP, PostgreSQL, Redis, and other services pre-configured. This gives us a consistent and isolated development environment that mimics production (without being exactly the same).

```bash
laravel new coffee-api
composer require laravel/sail
php artisan sail:install
```

<div style="position: relative; padding-bottom: 61.155152887882224%; height: 0;"><iframe src="https://www.loom.com/embed/c8297e1faed14f45804750d3d040009f?sid=1e418115-bf32-44ff-a981-48a7952fc8d5" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

> And yes I made a typo on the video. Spelling `coffee` wrong. Shame. We will be using the correct spelling everywhere else!

### Setting up local development

Update your `.env` file with your preferred settings and add the following hostnames to your `/etc/hosts` file for local development:

```bash
127.0.0.1 api.coffeeshops.test coffeeshops.test
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/d2ef8c7423bf47158165ee2b944254fd?sid=6ef5e863-e95f-442f-bef6-dc8fd2d46e25" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

### Let's start everything!

Let's start our Docker containers using Laravel Sail. This will spin up our development environment with PHP, PostgreSQL and other required services:

```bash
sail up
curl http://api.coffeeshops.test
```

When you make this request, you'll see Laravel's default welcome page returned as HTML. This is expected since we haven't set up our API routes yet - we'll configure those in the next steps to return JSON responses instead.

{{% /steps %}}

## Customizing our editor with rules

Before diving into the code, let's configure our editor to follow Laravel best practices and coding standards.

Create a new file called `.cursorrules` in your project root. This file will contain AI prompts that help Cursor understand Laravel conventions and provide better code suggestions.

You can find the recommended Laravel rules at [cursorrule.com/posts/laravel-php-cursor-rules](https://cursorrule.com/posts/laravel-php-cursor-rules). Copy the content from there and paste it into your `.cursorrules` file.

These rules will ensure consistent code style, proper Laravel patterns, and helpful autocompletions as we build our API.

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/f0061f3780994e74a3ceb52e87b8cc45?sid=a4ac36f0-c968-4944-8a3f-91ed43981af5" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

## Creating our application

{{% steps %}}

### The Laravel API configuration

Let's configure our application for API development. The following command will:
- Install Laravel Sanctum for API authentication
- Set up API routing under the `/api` prefix
- Configure the `routes/api.php` file for our API endpoints
- Add other API-related packages and configurations

```bash
sail artisan install:api
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/5c41dc8d4879492d972636ffaa44e10c?sid=246af9fe-8f39-468a-8651-ecfd4f0ac927" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

### Adding the model


```bash
sail artisan make:model Shop -m
sail artisan make:controller Api\\ShopController
sail artisan make:resource ShopResource
sail artisan migrate
```

Next, we'll define the database schema for our `Shop` model by adding fields to the migration file. We'll also specify which fields can be mass-assigned by adding them to the model's `$fillable` property.

```php {filename="2024_11_15_144702_create_shops_table"}
Schema::create('shops', function (Blueprint $table) {
  $table->id();
  $table->timestamps();

  $table->string('name');
  $table->string('address')->nullable();
  $table->string('city')->nullable();
  $table->string('state')->nullable();
  $table->string('zip')->nullable();
  $table->string('country')->nullable();
  $table->string('phone')->nullable();
  $table->string('website')->nullable();
  $table->float('rating')->default(0);
  $table->string('image')->nullable();
});
```

```php {filename="app/Models/Shop.php"}
class Shop extends Model
{
  protected $fillable = [
    'name',
    'address',
    'city',
    'state',
    'zip',
    'country',
    'phone',
    'website',
    'rating',
    'image',
  ];
}
```

Now let's refresh our database and run the migrations again to apply these changes:

```bash
sail artisan migrate:refresh
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/6f63941e31e04231ad0c21f62e61c848?sid=e5ff9bc0-fedc-4ed4-aafc-d84bec2e8d83" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

### Let's seed our database for testing

Let's update our `DatabaseSeeder.php` to generate some sample shop data using Laravel's factory system:

```php {filename="app/database/seeders/DatabaseSeeder.php"}
Shop::factory(10)->create();
```

First, we need to tell Laravel that our Shop model can use factories by adding the `HasFactory` trait. Add this line at the top of your `Shop` model file:

```php {filename="app/models/Shop.php"}
class Shop extends Model
{
  use HasFactory;
  [...]
}
```

Next, we need to create a factory class to generate test data for our `Shop` model. We'll create a new `ShopFactory` class by extending Laravel's base factory class and defining how to generate each field:

```php {filename="app/database/factories/ShopFactory.php"}
public function definition(): array
{
    return [
        'name' => fake()->company(),
        'address' => fake()->streetAddress(),
        'city' => fake()->city(),
        'state' => fake()->state(),
        'zip' => fake()->postcode(),
        'country' => fake()->country(),
        'phone' => fake()->phoneNumber(),
        'website' => fake()->url(),
        'rating' => fake()->numberBetween(1, 5),
        //'image' => fake()->imageUrl(),
    ];
}
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/05b212346ce84aad8bb00794e0162588?sid=50ef4ade-0a37-4906-94b1-ee1da90c6398" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

### Let's work on our controller

Now let's update our `ShopController` to add the index and show methods that will handle our API endpoints:

```php {filename="app/Http/Controllers/Api/ShopController.php"}
public function index()
{
    return ShopResource::collection(Shop::all());
}

public function show(Shop $shop)
{
    return new ShopResource($shop);
}
```

For simplicity, we're implementing basic read CRUD operations without pagination. However, as your dataset grows, you'll want to add pagination to improve performance and reduce response payload sizes. Laravel makes this easy with methods like `paginate()`.

### Creating the routes

Let's define our API routes by adding the following code to `routes/api.php`. These routes will handle GET requests for listing all shops and retrieving individual shop details:

```php
Route::get('shops', [\App\Http\Controllers\Api\ShopController::class, 'index']);
Route::get('shops/{shop}', [\App\Http\Controllers\Api\ShopController::class, 'show']);
```

For a full CRUD API, we could have used Laravel's `Route::apiResource()` helper instead, which would automatically define all RESTful routes (index, show, store, update, destroy) in a single line:

### Let's test

Let's test our newly created API endpoints by making requests to both the collection endpoint `/shops` and the individual shop endpoint `/shops/{id}`. This will verify that our routes, controller methods, and resource transformations are working correctly:

```bash
curl api.coffeeshops.test/api/shops | jq
{
  "data": [
    {
      "id": 1,
      "name": "Wisozk, Sanford and Rice",
      "address": "318 Caleigh Causeway Apt. 403",
      "city": "Forestburgh",
      "state": "Iowa",
      "zip": "33765-9124",
      "country": "Brunei Darussalam",
      "phone": "+1-231-859-2227",
      "website": "https://www.barton.com/quia-ut-error-voluptatem-qui-eos-similique-expedita",
      "rating": "5",
      "created_at": "2024-11-15T14:56:20.000000Z",
      "updated_at": "2024-11-15T14:56:20.000000Z"
    },
    [...]
  ]
}
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/4056056462134fd6a5494d5e055b3d29?sid=9efa5bc2-72cd-4c01-9477-7fd1e55fd408" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

{{% /steps %}}

### Let's deploy it!

Now that our REST API is fully functional with working endpoints, it's time to deploy it to production on **Upsun**. Upsun will provide us with a scalable, managed hosting environment with built-in PostgreSQL and Redis support.

{{% steps %}}

### First let's create our Upsun project.

```
upsun project:create
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/be7b61359e064994b1f0032b723b731a?sid=d58974d6-d3f0-44cd-a63a-f0bc34bac2a7" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

Let's initialize a new git repository at the root of our project. Since the Laravel CLI already created one in the `coffee-api` folder, we'll remove that first to avoid nested repositories.

```bash
rm -rf coffee-api/.git
git init .
git add .
git commit -m "Bootstrap our REST API"
```

Next, we'll configure our local git repository to use Upsun as its remote origin. Replace `[project id]` with the ID from the previous step (`project:create`):

```bash
upsun project:set-remote [project id]
```

### Creating the configuration

Before pushing our code to Upsun, we need to create a configuration file that defines our application's infrastructure and deployment settings. This configuration will specify our PHP version, database requirements, and build/deploy processes. Create a new file called `.upsun/config.yaml` with the following configuration (explained below).

{{< callout emoji="🤔">}}
Because we are using PostgreSQL in our project, it is important to add `pdo` and `pdo_pgsql` to our PHP `extensions`!
{{< /callout >}}

```yaml {filename=".upsun/config.yaml"}
applications:
  coffee-api:
    source:
      root: "/coffee-api"
    type: "php:8.3"
    relationships:
      db: "postgresql:postgresql"
      cache: "redis:redis"
    mounts:
      "/.config":
        source: "storage"
        source_path: "config"

      "bootstrap/cache":
        source: "storage"
        source_path: "cache"

      "storage":
        source: "storage"
        source_path: "storage"
    web:
      locations:
        "/":
          passthru: "/index.php"
          root: "public"
    build:
      flavor: none
    dependencies:
      php:
        composer/composer: "^2"
    hooks:
      build: |
        set -eux
        composer --no-ansi --no-interaction install --no-progress --prefer-dist \
          --optimize-autoloader --no-dev
      deploy: |
        set -eux
        mkdir -p storage/framework/sessions
        mkdir -p storage/framework/cache
        mkdir -p storage/framework/views
        php artisan migrate --force
        php artisan optimize:clear
    runtime:
      extensions:
        - redis
        - pdo
        - pdo_pgsql
services:
  postgresql:
    type: postgresql:16
  redis:
    type: redis:7.0
routes:
  "https://api.{default}/":
    type: upstream
    upstream: "coffee-api:http"
```

For Laravel to properly configure itself on Upsun, we need to map the platform's environment variables to ones that Laravel expects. Create a new `.environment` file in your project root with these essential configuration mappings:

```bash {filename=".environment"}
export APP_KEY="base64:$PLATFORM_PROJECT_ENTROPY" # CHANGE IT!

# Set database environment variables
export DB_SCHEME="pgsql"
export DATABASE_URL="${DB_SCHEME}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_PATH}"

# Set Laravel-specific environment variables
export DB_CONNECTION="$DB_SCHEME"
export DB_DATABASE="$DB_PATH"

# Set Cache environment variables
export CACHE_STORE="redis"
export CACHE_URL="${CACHE_SCHEME}://${CACHE_HOST}:${CACHE_PORT}"

# Set Redis environment variables
export REDIS_URL="$CACHE_URL"
export QUEUE_CONNECTION="redis"
export SESSION_DRIVER="redis"
```

### Let's push!

With our configuration files in place and environment variables set up, we can now deploy our Laravel application to Upsun. The platform will automatically build our application, install dependencies, and set up the required services:

```bash
git add .
git commit -m "Add Upsun configuration"
upsun push
```

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/4643057adadc4cdeb77264aae6584b08?sid=d999b6ec-fc84-46e9-9391-473fc05c448e" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

{{% /steps %}}

## Let's copy our data

If we test our API endpoint now, it will work but return empty results since database seeders don't automatically run in production environments. We'll need to populate our database with some initial data.

```bash
upsun url
Enter a number to open a URL
  [0] https://api.main-bvxea6i-fdhacb4dabmky.ch-1.platformsh.site/
  [1] http://api.main-bvxea6i-fdhacb4dabmky.ch-1.platformsh.site/

curl https://api.main-bvxea6i-fdhacb4dabmky.ch-1.platformsh.site/api/shops | jq
{
  "data": []
}
```

Let's fix that by copying our local database content to the production environment. We can either copy just the `shops` table data or do a full database dump - both approaches will work. Let's use our database GUI tool to export the data.

<div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/d071e67585924eebbc70fc620fdd4ced?sid=0e112e3d-66b0-487a-a085-bbe8aff2d503" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

To connect to our Upsun database, we have two options:

1. Run `upsun db:sql` for direct database access
2. Create local SSH tunnels to access both the database and cache services

```bash
upsun tunnel:open
Are you sure you want to open SSH tunnel(s) to the environment main (type: production)? [Y/n] 

SSH tunnel opened to db at: pgsql://main:main@127.0.0.1:30000/main
SSH tunnel opened to cache at: redis://127.0.0.1:30001
...
```

Now that we have our SSH tunnel open, we can connect to the remote database using our favorite database GUI tool. Simply use the connection details provided by the tunnel command (default values shown here):

- Host: `127.0.0.1`
- Port: `30000`
- Database: `main`
- Username: `main`
- Password: `main`

Once connected, we can run our `INSERT` queries to populate the remote database with our coffee shop data. After executing the queries, our remote API will have all the coffee shops available!

You can verify the data was copied successfully by checking the API response below:

```bash
curl https://api.main-bvxea6i-fdhacb4dabmky.ch-1.platformsh.site/api/shops | jq
{
  "data": [
    {
      "id": 1,
      "name": "Thompson LLC",
      "address": "39455 Austyn Passage",
      "city": "West Beverlyfurt",
      "state": "Wyoming",
      "zip": "61989-7988",
      "country": "Timor-Leste",
      "phone": "219-806-2419",
      "website": "http://www.hickle.net/",
      "rating": "2",
      "created_at": "2024-11-15T15:53:30.000000Z",
      "updated_at": "2024-11-15T15:53:30.000000Z"
    },
    [...]
  ]
}
```

Now that we've successfully deployed our API to Upsun and verified the data is accessible, we can shut down our local Laravel Sail development environment by running:

```bash
sail stop
#or
sail down # to remove volumes
```

## Adding a domain 

Now that our API is deployed and working, let's make it accessible via a custom domain. This will give us a branded URL instead of the default Upsun hostname.

<div style="position: relative; padding-bottom: 62.5%; height: 0;margin-top:20px;"><iframe src="https://www.loom.com/embed/0fc094063d5c4661a5aa88b5866b1b3e?sid=a8166ef2-166a-4385-9c86-3fba157c0ad6" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

```bash
upsun domain:add remotefriendly.coffee
```

Next, you'll need to configure your DNS settings with your domain provider. Add the following DNS records, replacing the hostname with your specific Upsun project hostname (which you can find quickly with the CLI command `upsun environment:info edge_hostname -p PROJECT_ID -e PRODUCTION_ENVIRONMENT`:

```bash
CNAME api.remotefriendly.coffee main-bvxea6i-[project id].[region].platformsh.site.
CNAME remotefriendly.coffee main-bvxea6i-[project id].[region].platformsh.site.
```

{{< callout emoji="💡" type="blue">}}
Note: While Cloudflare supports CNAME flattening which allows using a CNAME for the root domain (`@`), many DNS providers require using A records instead. Check your provider's documentation for their specific requirements regarding root domain configuration.
{{% /callout %}}

## Final test!

Once your DNS changes propagate (which can take anywhere from a few minutes to 48 hours depending on your provider), Upsun will automatically provision and configure TLS certificates for your domain. If you're using Cloudflare, you should be able to test the API endpoints immediately while waiting for DNS propagation:

<div style="position: relative; padding-bottom: 62.5%; height: 0;margin-top:20px;"><iframe src="https://www.loom.com/embed/aaa9a97acdff46e8bf8a501de14cd64e?sid=1f1897b9-028b-4a22-b454-ba87294b9037" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>

```bash
curl https://api.remotefriendly.coffee/api/shops | jq
curl https://api.remotefriendly.coffee/api/shops/1 | jq
```

Our backend is now fully deployed & operational 🚀.


## Summary

In this tutorial, we've accomplished several key objectives:

1. Set up a complete local development environment with PHP, Composer, and Laravel Sail
2. Created a new Laravel REST API project from scratch
3. Implemented API endpoints for managing coffee shop data
4. Configured and deployed the application to Upsun
5. Added a custom domain with SSL/TLS support

## What's Next?

This REST API serves as the foundation for our coffee shop directory application. In the next article of this series, we'll build a modern frontend using Next.js 15 that consumes this API. We'll explore:

- Setting up a Next.js 15 project
- Implementing API integration
- Leveraging Next.js's powerful caching mechanisms
- Deploying the frontend application

Stay tuned for the next part of this series where we'll create an engaging user interface for browsing our coffee shop directory!

If you have any questions or run into issues, feel free to reach out in the comments below or join our [community Discord server](https://discord.gg/platformsh).

Happy coding! ☕️

