---
title: "How to contribute an article to the Dev Center"
linkTitle: "Add articles"
type: docs
comments: false

excludeSearch: true
sidebar:
  exclude: true
---

{{% steps %}}

### Setting up

1. In a terminal window, [run this site locally via Docker](/community/about/contributing/local).
1. In another window, navigate into the repository, and run the following command from the `dev` folder:

    ```bash
    hugo new content content/posts/article-title-slug.md --kind post
    #OR
    sh create-content.sh post article-title-slug
    ```

    Where `article-title-slug` should be a lowercase, slugified (i.e. recognizable, but unique) version of your article's title.
1. Navigate to the newly created file at `content/posts/article-title-slug.md` in your IDE.
1. Navigate to [http://localhost:1313/community/content/posts/article-title-slug](http://localhost:1313/community/content/posts/article-title-slug) in your browser to view your edits in real time.

### Create an author profile

{{< callout type="info" >}}
  This step is optional, even though you will be required to define an author in the next following step.
{{< /callout >}}

Articles are associated with authors, that are represented in your post by either:

- **Option 1:** an author page at `content/community/engage/people/your-name.md`

    If you are an employee of Blackfire.io, Platform.sh, or Upsun and an author of the post, from the `dev` folder, run the command:

    ```bash
    hugo new content content/community/engage/people/your-name.md --kind author
    #OR
    sh create-content.sh author your-name
    ```

    1. Navigate to the newly created file at `content/community/engage/people/your-name.md` in your IDE.
    1. Navigate to [http://localhost:1313/community/engage/people/your-name](http://localhost:1313/community/engage/people/your-name) in your browser to view your edits in real time.
    1. Follow the instructions in the resulting file to update your personal information on that author page.

- **Option 2:** a GitHub profile at `https://github.com/your-name`

    If an author page does not exist, Hugo will look for an author page on GitHub that matches a username `your-name`.

- **Option 3:** a hardcoded string of the author's name

    If neither an author page, nor a GitHub username exists for the post, a raw string like "FirstName LastName" will be accepted.

{{< callout type="info" >}}
  Posts can be attributed to **up to three** authors, each of whom can be defined by any of the options described above.
  This configuration comes in the next step, but will look like this:

```yaml {filename="content/posts/article-title-slug.md"}
---
author:
  - your-name # Author 1: a file at content/community/engage/people/your-name.md
  - collaboratorA # Author 2: links to a GitHub profile at https://github.com/collaboratorA
  - "Kate Austen" # Author 3: does not have an author page or a GitHub profile.
---
```

{{< /callout >}}

### Update the front matter

Most of the changes you need to make at this point are to the [front matter](https://gohugo.io/content-management/front-matter/).
The front matter contains variables that help tell Hugo how to display the page you're adding.

```yaml {filename="content/posts/article-title-slug.md"}
---
#################################
# Don't touch these settings.
date: '{{ .Date }}'
sidebar:
    exclude: true
type: post
#################################
...

---
```

Follow the instructions below to update the required fields.
Do **not** change values presented above between the `#################################` lines as is indicated.

1. Update the `title` attribute in the front matter of this file.

    ```yaml {filename="content/posts/article-title-slug.md"}
    ---
    title: "Include a short, descriptive title"
    ---
    ```

1. Update the `image` attibute in the front matter of this file, if you have one you'd like to use.
Otherwise, feel free to leave the default value.

    ```yaml {filename="content/posts/article-title-slug.md"}
    ---
    image: /images/red-background.webp
    ---
    ```

    The path `/images/...` above references the absolute path `/static/images` in the project repository.
    Place new images relative to that same path if using new ones.

1. Update the `author` attribute array in the front matter of this file.
    Be sure to first follow the instructions above to define author profiles if needed.

    ```yaml {filename="content/posts/article-title-slug.md"}
    ---
    author:
      - your-name # Author 1: a file at content/community/engage/people/your-name.md
      - collaboratorA # Author 2: links to a GitHub profile at https://github.com/collaboratorA
      - "Kate Austen" # Author 3: does not have an author page or a GitHub profile.
    ---
    ```

1. Update the `categories` attribute array in the front matter of this file.
Choose only one of the listed available categories, and comment out the rest.

    ```yaml {filename="content/posts/article-title-slug.md"}
    ---
    categories:
    #   - core-concepts
    #   - discussions
    #   - experiments
      - how-tos
    #   - releases
    #   - tutorials
    ---
    ```

    The categories are summarized at [`/posts/#article-categories`](/posts/#article-categories)

    Tagging a post with the category `featured` will promote it to show on the `/posts/` page.

    * You may need to restart the Hugo process after changing the categories.
     

1. (Optional) Update the `link` attribute in the front matter of this file. 
**Only update** this value if you want to list an article that is hosted externally somewhere, such as on the Upsun blog or the Upsun Dev.to acccount.

    ```yaml {filename="content/posts/article-title-slug.md"}
    ---
    link: "https://upsun.com/blog/blackfire-infrastructure-processes/"
    ---
    ```

### Update your content

Replace content within the article with your own. 
Feel free to use the [Text formatting](/community/about/contributing/format) for styling tips and common components.

When you're finished, push to the repository and open a merge request.

Thanks for contributing!

{{% /steps %}}
