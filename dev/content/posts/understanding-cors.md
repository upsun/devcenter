---
title: "Understanding Cross-Origin Resource Sharing (CORS)"
subtitle: "What you should know to leverage CORS and unlock Web Resources Safely"
date: 2024-09-30T15:20:15+09:00
image: /images/CORS.png
icon: release-notes
featured: true
author:
  - gmoigneu

sidebar:
    exclude: true
type: post

description: |
    Learn about Cross-Origin Resource Sharing (CORS), a crucial web security mechanism. Understand its importance, key concepts, and implementation in Symfony, Next.js, and Laravel. Includes practical examples and tips for testing with curl and Postman, plus Platform.sh configuration guidance.
tags:
  - cors
categories:
  - discussions
math: false
# excludeSearch: true
---

Today, it is becoming more common to decouple your frontend (usually a JS framework) and your backend (Node.js, PHP, Python, etc.) or even leverage micro-services. 
However, web browsers implement security measures that restrict such cross-origin requests by default. This is where `Cross-Origin Resource Sharing` (`CORS`) comes into play. 

Understanding `CORS` is crucial for developers building modern web applications, as it allows you to access resources from different origins while maintaining security safely. Let's dive into the world of `CORS` and explore its key concepts.

## Fundamentals

### The `Same-Origin Policy`

Before we delve into `CORS`, it's essential to understand the `Same-Origin Policy`, which is the foundation of web security.

The `Same-Origin Policy` is a critical security mechanism implemented by web browsers. It restricts web pages from making requests to a domain different from the one serving the web page. An origin is considered the same if the protocol, domain, and port all match.

For example:
- `https://example.com/page1` and `https://example.com/page2` have the same origin
- `https://example.com` and `http://example.com` have different origins (different protocol)
- `https://example.com` and `https://example.com:3000` have different origins (different port)
- `https://example.com` and `https://api.example.com` have different origins (different subdomain)

The `Same-Origin Policy` is important because it prevents malicious scripts on one page from obtaining access to sensitive data on another page through the `Document Object Model` (`DOM`). 
However, this policy can be too restrictive for legitimate cross-origin requests, which is where `CORS` comes in.

### What is `CORS`?

Cross-Origin Resource Sharing (`CORS`) is a mechanism that allows many resources (e.g., fonts, JavaScript, etc.) on a web page to be requested from another domain outside the domain from which the resource originated.

`CORS` works by adding new HTTP headers that allow servers to describe which origins are permitted to read that information from a web browser. It's a way to relax the `Same-Origin Policy` in a controlled manner.

For example, if a user visits `https://example.com` and that page wants to make an AJAX request to https://api.example.com, it will be blocked by default due to the `Same-Origin Policy`. `CORS` provides a way for the server at https://api.example.com to say, "I will accept requests from https://example.com."

### `CORS` Headers

`CORS` is implemented through a series of HTTP headers. The most important ones are:

- `Access-Control-Allow-Origin`: Specifies which origins can access the resource. It can be a specific origin, `"*"` for any origin, or null.
- `Access-Control-Allow-Methods`: Specifies the HTTP methods (`GET`, `POST`, etc.) allowed when accessing the resource.
- `Access-Control-Allow-Headers`: Indicates which HTTP headers can be used during the actual request.
- `Access-Control-Allow-Credentials`: Indicates whether the response to the request can be exposed when the credentials flag is true.

For example, a server might send these headers:

```
Access-Control-Allow-Origin: https://example.com
Access-Control-Allow-Methods: GET, POST, PUT
Access-Control-Allow-Headers: Content-Type
```

These headers tell the browser that `https://example.com` is allowed to make `GET`, `POST`, and `PUT` requests to this resource and can include the `Content-Type` header in its requests.

Understanding these headers is important because they form the core of how `CORS` works. As a developer, you must configure your application to send the appropriate headers based on your security requirements.

### Simple vs. Preflight Requests

`CORS` requests can be divided into two categories: simple requests and preflight requests.

Simple requests don't trigger a `CORS` preflight. They are typically `GET`, `HEAD`, or `POST` requests with only simple headers. The browser sends these directly, and the server can respond with `CORS` headers.

Preflight requests are used for more complex HTTP requests. Before sending the actual request, the browser first sends an HTTP `OPTIONS` request to the server, asking for permission.

For example, a `PUT` request with a custom header would trigger a preflight request:

```
OPTIONS /resource HTTP/1.1
Origin: https://example.com
Access-Control-Request-Method: PUT
Access-Control-Request-Headers: X-Custom-Header
```

The server would then respond with the appropriate `CORS` headers, telling the browser whether the actual request is allowed.

Understanding the difference between simple and preflight requests is important because it affects how your server needs to handle `CORS` requests and can impact the performance of your application.

### `CORS` and Security

While `CORS` allows for more flexible web applications, it's important to understand that it's not a security feature in itself. `CORS` doesn't protect your server from unauthorized access; it simply tells the browser to allow certain `cross-origin` requests.

Proper security measures, such as authentication and authorization, should always be implemented on the server side. **`CORS` should be configured to allow only the necessary origins, methods, and headers.**

For example, instead of using `Access-Control-Allow-Origin: *`, which allows any origin, you should specify the exact origins:

```
Access-Control-Allow-Origin: https://trusted-site.com
```

## Configuration Examples

### Symfony (PHP)

In [Symfony](https://symfony.com/), you can use the [NelmioCorsBundle](https://symfony.com/bundles/NelmioCorsBundle/current/index.html) to handle `CORS`. 
Here's an example configuration:

1. Install the bundle:
   ```
   composer require nelmio/cors-bundle
   ```

2. Configure `CORS` in your `config/packages/nelmio_cors.yaml`:

   ```yaml {filename="config/packages/nelmio_cors.yaml"}
   nelmio_cors:
     defaults:
       origin_regex: true
       allow_origin: ['%env(CORS_ALLOW_ORIGIN)%']
       allow_methods: ['GET', 'OPTIONS', 'POST', 'PUT', 'PATCH', 'DELETE']
       allow_headers: ['Content-Type', 'Authorization']
       expose_headers: ['Link']
       max_age: 3600
     paths:
       '^/api/':
         allow_origin: ['%env(CORS_ALLOW_ORIGIN)%']
         allow_headers: ['X-Custom-Auth']
         allow_methods: ['POST', 'PUT', 'GET', 'DELETE']
         max_age: 3600
   ```

3. Set the `CORS_ALLOW_ORIGIN` environment variable in your `.env` file:

   ``` {filename=".env"}
   CORS_ALLOW_ORIGIN=^https?://(localhost|example\.com)(:[0-9]+)?$
   ```

### Next.js (JavaScript)

In [Next.js](https://nextjs.org/), you can configure `CORS` by creating a custom API route. 
Here's an example:

1. Create a file `pages/api/cors.js`:

   ```javascript {filename="pages/api/cors.js"}
   import Cors from 'cors'
   import initMiddleware from '../../lib/init-middleware'

   // Initialize the cors middleware
   const cors = initMiddleware(
     Cors({
       methods: ['GET', 'POST', 'OPTIONS'],
     })
   )

   export default async function handler(req, res) {
     // Run cors
     await cors(req, res)

     // Rest of the API logic
     res.json({ message: 'Hello World' })
   }
   ```

2. Create the `lib/init-middleware.js` file:

   ```javascript {filename="lib/init-middleware.js"}
   export default function initMiddleware(middleware) {
     return (req, res) =>
       new Promise((resolve, reject) => {
         middleware(req, res, (result) => {
           if (result instanceof Error) {
             return reject(result)
           }
           return resolve(result)
         })
       })
   }
   ```

3. Install the `cors` package:

   ```
   npm install cors
   ```

This configuration will apply `CORS` to the specific API route. You can adjust the options in the `Cors()` function call to fit your needs.

Certainly! I'll add an example for [Laravel](https://laravel.com/) to the `CORS` Configuration Examples section. Here's the updated section with Laravel included:

### Laravel (PHP)

[Laravel](https://laravel.com/) provides built-in support for `CORS` through its middleware. Here's how you can configure `CORS` in a Laravel application:

1. Laravel 7 and above come with `CORS` support out of the box. For earlier versions, you may need to install the `fruitcake/laravel-cors` package:

   ```
   composer require fruitcake/laravel-cors
   ```

2. Publish the `CORS` configuration file:

   ```
   php artisan vendor:publish --tag="cors"
   ```

   This will create a `config/cors.php` file.

3. Configure `CORS` in `config/cors.php`:

   ```php {filename="config/cors.php"}
   <?php

   return [
     'paths' => ['api/*'],
     'allowed_methods' => ['*'],
     'allowed_origins' => ['http://localhost:3000', 'https://example.com'],
     'allowed_origins_patterns' => [],
     'allowed_headers' => ['*'],
     'exposed_headers' => [],
     'max_age' => 0,
     'supports_credentials' => false,
   ];
   ```

   This configuration:
   - Applies `CORS` to all routes under `/api`
   - Allows all HTTP methods
   - Allows requests from `http://localhost:3000` and `https://example.com`
   - Allows all headers
   - Doesn't expose any headers
   - Doesn't set a max age for preflight requests
   - Doesn't allow credentials (cookies, HTTP authentication) in `CORS` requests

5. If you need more fine-grained control, you can create a `CORS` middleware for specific routes. Create a file `app/Http/Middleware/Cors.php`:

   ```php {filename="app/Http/Middleware/Cors.php"}
   <?php

   namespace App\Http\Middleware;

   use Closure;

   class Cors
   {
     public function handle($request, Closure $next)
     {
       return $next($request)
         ->header('Access-Control-Allow-Origin', 'https://example.com')
         ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
         ->header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, X-Token-Auth, Authorization');
     }
   }
   ```

   Then, register this middleware in `app/Http/Kernel.php`:

   ```php {filename="app/Http/Kernel.php"}
   protected $routeMiddleware = [
     // ...
     'cors' => \App\Http\Middleware\Cors::class,
   ];
   ```

   You can now apply this middleware to specific routes or route groups:

   ```php
   Route::middleware(['cors'])->group(function () {
     Route::get('/api/data', 'DataController@index');
   });
   ```

This Laravel configuration gives you flexibility in handling `CORS` for your entire application or for specific routes. Remember to adjust the allowed `origins`, `methods`, and `headers` according to your application's needs and security requirements.

Certainly! I'll add a new section to the article about querying an API protected with `CORS` using curl and Postman. Here's the new section:

## Querying `CORS-Protected` APIs

While `CORS` is primarily a browser security feature, it's often useful to test APIs directly using tools like [curl](https://curl.se/) or [Postman](https://www.postman.com/). Here's how you can work with `CORS-protected` APIs using these tools:

### Using curl

curl doesn't enforce `CORS` restrictions, as it's not a web browser. However, to simulate a `CORS` request or to test your server's `CORS` configuration, you can send the appropriate headers with your request.

1. Simple GET request:
   ```bash
   curl -H "Origin: http://example.com" \
        -H "Access-Control-Request-Method: GET" \
        -H "Access-Control-Request-Headers: X-Requested-With" \
        -X OPTIONS --verbose \
        https://api.example.com/data
   ```

   This sends a preflight `OPTIONS` request. The server's response will include the `CORS` headers if it's configured correctly.

2. POST request with custom headers:
   ```bash
   curl -H "Origin: http://example.com" \
        -H "Content-Type: application/json" \
        -H "X-Requested-With: XMLHttpRequest" \
        -X POST -d '{"key":"value"}' \
        https://api.example.com/data
   ```

   This sends a `POST` request with a custom header, which would typically trigger a preflight request in a browser.

### Using Postman

[Postman](https://www.postman.com/) is more user-friendly for testing APIs and provides a GUI for constructing requests.

1. Setting up a `CORS` request in Postman:
   - Open a new request in Postman
   - Set the HTTP method (`GET`, `POST`, etc.)
   - Enter the API URL
   - Go to the "Headers" tab
   - Add the following headers:
     - Key: `Origin`, Value: `http://example.com`
     - Key: `Access-Control-Request-Method`, Value: `POST` (or whatever method you're using)
     - Key: `Access-Control-Request-Headers`, Value: `Content-Type, X-Requested-With` (or whatever headers you're using)

2. Sending a preflight request:
   - Set the method to `OPTIONS`
   - Send the request
   - Check the response headers for `CORS-related` headers

3. Sending the actual request:
   - Set the method back to your intended method (`GET`, `POST`, etc.)
   - If it's a `POST` request, go to the "Body" tab and add your payload
   - Send the request

### Interpreting the Results

When testing with curl or Postman, pay attention to the response headers. Look for:

- `Access-Control-Allow-Origin`: Should match your `Origin` or be `'*'`
- `Access-Control-Allow-Methods`: Should include the method you're using
- `Access-Control-Allow-Headers`: Should include any custom headers you're sending

If these headers are present and correct, it means the server is configured to allow `CORS` requests from your specified origin.

### Important Notes

1. Remember that curl and Postman don't enforce `CORS` policies. They'll send the request regardless of the server's `CORS` configuration. This is useful for testing but doesn't reflect how a web browser would behave.

2. If you're testing an API that requires authentication, make sure to include the necessary authentication headers or tokens in your requests.

3. Some APIs might have additional security measures beyond `CORS`, such as [CSRF](https://fr.wikipedia.org/wiki/Cross-site_request_forgery) tokens. You may need to account for these in your tests.

4. When testing in production environments, be cautious about sending too many requests, as this might trigger rate limiting or security alerts.

By using these tools, you can effectively test and debug `CORS` configurations on your APIs, ensuring they're set up correctly before integrating them into your web applications. This approach can save a lot of time and frustration when dealing with `CORS` issues in development.

## Platform.sh & Upsun Configuration

When working with **[Platform.sh](https://platform.sh/)** or **[Upsun](https://www.upsun.com/)**, you can dynamically set the allowed origins for `CORS` based on the `$PLATFORM_ROUTES` environment variable. This is particularly useful for handling multiple environments (development, staging, production) with different URLs.

Here's an example of how you might parse the `$PLATFORM_ROUTES` variable and use it to set the allowed origins:

```php
<?php

// Parse the PLATFORM_ROUTES variable
$routes = json_decode(base64_decode(getenv('PLATFORM_ROUTES')), true);

// Extract the domains from the routes
$domains = array_map(function($route) {
  return parse_url($route['original_url'], PHP_URL_HOST);
}, $routes);

// Remove duplicates and null values
$allowed_origins = array_filter(array_unique($domains));

// Add any additional origins you always want to allow
$allowed_origins[] = 'localhost';

// Now use $allowed_origins in your CORS configuration
```

This approach allows you to dynamically set the allowed origins based on your Platform.sh or Upsun routes, ensuring that your `CORS` configuration remains correct across all your environments without manual intervention.
