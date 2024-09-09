---
title: "Text formatting"
type: docs
comments: false

excludeSearch: true
sidebar:
  exclude: true
---

The original [Hextra theme](https://imfing.github.io/hextra/), and custom shortcodes added for this site are listed below for your quick reference when contributing.

## Markdown

All files on this site are written in Markdown. 
See [the Markdown Guide](https://www.markdownguide.org/cheat-sheet/) for basic rules and syntax.

## Code

See the [Hugo documentation](https://gohugo.io/functions/transform/highlight/#options) for all code highlight options.

Below is the configuration file for the Developer Center. 
Notice that line number highlighting has been included to indicate that the application name (`devcenter`) is defined both under `applications` and for the primary `upstream` route.

```yaml {filename=".upsun/config.yaml" lineNos="true" lineNoStart="1" hl_Lines="2 26"}
applications:
  devcenter:
    source:
      root: dev
    stack:
      - nodejs@22
      - nodePackages.npm
      - python312
      - hugo
    hooks:
      build: |
        npm install
        npm run build 
    web:
      locations:
        /:
          root: "public"
          passthru: true
          index:
            - index.html

routes:
  "https://{default}/":
    type: upstream
    primary: true
    upstream: "devcenter:http"
  "https://www.{default}":
    type: redirect
    to: "https://{default}/"
```

````txt
```yaml {filename=".upsun/config.yaml" lineNos="true" lineNoStart="1" hl_Lines="2 26"}
applications:
  devcenter:
    source:
      root: dev
    stack:
      - nodejs@22
      - nodePackages.npm
      - python312
      - hugo
    hooks:
      build: |
        npm install
        npm run build 
    web:
      locations:
        /:
          root: "public"
          passthru: true
          index:
            - index.html

routes:
  "https://{default}/":
    type: upstream
    primary: true
    upstream: "devcenter:http"
  "https://www.{default}":
    type: redirect
    to: "https://{default}/"
```
````

## Callouts 

{{< callout emoji="👾">}}
  A **callout** is a short piece of text intended to attract attention.
{{< /callout >}}

{{< callout type="info" >}}
  A **callout** is a short piece of text intended to attract attention.
{{< /callout >}}

{{< callout type="warning" >}}
  A **callout** is a short piece of text intended to attract attention.
{{< /callout >}}

{{< callout type="error" >}}
  A **callout** is a short piece of text intended to attract attention.
{{< /callout >}}

```markdown
{{</* callout emoji="👾" */>}}
  A **callout** is a short piece of text intended to attract attention.
{{</* /callout */>}}

{{</* callout type="info" */>}}
  A **callout** is a short piece of text intended to attract attention.
{{</* /callout */>}}

{{</* callout type="warning" */>}}
  A **callout** is a short piece of text intended to attract attention.
{{</* /callout */>}}

{{</* callout type="error" */>}}
  A **callout** is a short piece of text intended to attract attention.
{{</* /callout */>}}
```

## Details

{{% details title="Details" %}}

This is the content of the details.

Markdown is **supported**.

{{% /details %}}

{{% details title="Click me to reveal" closed="true" %}}

This will be hidden by default.

{{% /details %}}

````markdown
{{%/* details title="Details" */%}}

This is the content of the details.

Markdown is **supported**.

{{%/* /details */%}}
````

````markdown
{{%/* details title="Click me to reveal" closed="true" */%}}

This will be hidden by default.

{{%/* /details */%}}
````

## Filetree

{{< filetree/container >}}
  {{< filetree/folder name="content" >}}
    {{< filetree/file name="_index.md" >}}
    {{< filetree/folder name="docs" state="closed" >}}
      {{< filetree/file name="_index.md" >}}
      {{< filetree/file name="introduction.md" >}}
      {{< filetree/file name="introduction.fr.md" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
  {{< filetree/file name="hugo.toml" >}}
{{< /filetree/container >}}

```text {filename="Markdown"}
{{</* filetree/container */>}}
  {{</* filetree/folder name="content" */>}}
    {{</* filetree/file name="_index.md" */>}}
    {{</* filetree/folder name="docs" state="closed" */>}}
      {{</* filetree/file name="_index.md" */>}}
      {{</* filetree/file name="introduction.md" */>}}
      {{</* filetree/file name="introduction.fr.md" */>}}
    {{</* /filetree/folder */>}}
  {{</* /filetree/folder */>}}
  {{</* filetree/file name="hugo.toml" */>}}
{{</* /filetree/container */>}}
```

## Icons

{{< icon "academic-cap" >}} {{< icon "cake" >}} {{< icon "gift" >}} {{< icon "sparkles" >}}

```
{{</* icon "github" */>}}
```

### Adding icons

You need to add the SVG icon data to a `data/icons.yaml` file in this repository.

```yaml {filename="data/icons.yaml"}
your-icon: <svg>your icon svg content</svg>
```

It then can be used in the shortcode like this:

```
{{</* icon "your-icon" */>}}
```

The icon now can also be used in other shortcodes where an `icon` parameter is an option.

## Steps

Note that steps using the h3 Markdown header appear in the table of contents in the upper right hand corner of this page.

{{% steps %}}

### Step 1

This is the first step.

### Step 2

This is the second step.

### Step 3

This is the third step.

{{% /steps %}}

```
{{%/* steps */%}}

### Step 1

This is the first step.

### Step 2

This is the second step.

### Step 3

This is the third step.

{{%/* /steps */%}}
```

## Tabs

{{< tabs items="JSON,YAML,TOML" >}}

{{< tab >}}**JSON**: JavaScript Object Notation (JSON) is a standard text-based format for representing structured data based on JavaScript object syntax.{{< /tab >}}
{{< tab >}}**YAML**: YAML is a human-readable data serialization language.{{< /tab >}}
{{< tab >}}**TOML**: TOML aims to be a minimal configuration file format that's easy to read due to obvious semantics.{{< /tab >}}

{{< /tabs >}}

```
{{</* tabs items="JSON,YAML,TOML" */>}}

  {{</* tab */>}}**JSON**: JavaScript Object Notation (JSON) is a standard text-based format for representing structured data based on JavaScript object syntax.{{</* /tab */>}}
  {{</* tab */>}}**YAML**: YAML is a human-readable data serialization language.{{</* /tab */>}}
  {{</* tab */>}}**TOML**: TOML aims to be a minimal configuration file format that's easy to read due to obvious semantics.{{</* /tab */>}}

{{</* /tabs */>}}
```
