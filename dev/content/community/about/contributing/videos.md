---
title: "Add videos"
type: docs
comments: false
---

{{% steps %}}

### Setting up

1. In a terminal window, [run this site locally via Docker](/community/about/contributing/local).
1. Go to the `dev` folder: ``cd dev``
1. In another window, navigate into the repository, and run the following command:

    ```bash
    hugo new content content/community/content/videos/YOUTUBE_VIDEO_ID.md --kind video 
    ```

    `YOUTUBE_ID` is the id as it appears on a YouTube video in a link (i.e. `https://www.youtube.com/watch?v=YOUTUBE_ID`). 
    This is necessary for the video to appear correctly on the site.
1. Navigate to the newly created file at `content/community/content/videos/YOUTUBE_VIDEO_ID.md` in your IDE.
1. Navigate to [http://localhost:1313/community/content/videos/YOUTUBE_VIDEO_ID](http://localhost:1313/community/videos/YOUTUBE_VIDEO_ID) in your browser to view your edits in real time.

### Create an author profile

{{< callout type="info" >}}
  This step is optional, even though you will be required to define an author in the next following step.
{{< /callout >}}

Articles are associated with authors, that are represented in your post by either:

- **Option 1:** an author page at `content/community/engage/people/your-name.md`

    If you are an employee of Blackfire.io, Platform.sh, or Upsun and an author of the post, run the command:

    ```bash
    hugo new content content/community/engage/people/your-name.md --kind author
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

```yaml {filename="content/community/content/videos/YOUTUBE_VIDEO_ID.md"}
---
author:
  - your-name # Author 1: a file at content/community/engage/people/your-name.md
  - collaboratorA # Author 2: links to a GitHub profile at https://github.com/collaboratorA
  - "Sayid Jarrah" # Author 3: does not have an author page or a GitHub profile.
---
```

{{< /callout >}}

### Update the front matter

Most of the changes you need to make at this point are to the [front matter](https://gohugo.io/content-management/front-matter/).
The front matter contains variables that help tell Hugo how to display the page you're adding.

```yaml {filename="content/community/content/videos/YOUTUBE_VIDEO_ID.md"}
---
#################################
# Don't touch these settings.
date: '{{ .Date }}'
sidebar:
    exclude: true
type: media
#################################
...

---
```

Follow the instructions below to update the required fields.
Do **not** change values presented above between the `#################################` lines as is indicated.

1. Update the `title` attribute in the front matter of this file.

    ```yaml {filename="content/community/content/posts/article-title-slug.md"}
    ---
    title: "Include a short, descriptive title"
    ---
    ```

1. (optional) Update the `image` attibute in the front matter of this file using the same `YOUTUBE_ID`:

    Below is the default behavior if no `image` value is defined.

    ```yaml {filename="content/community/content/videos/YOUTUBE_VIDEO_ID.md"}
    ---
    image: https://img.youtube.com/vi/YOUTUBE_ID/hqdefault.jpg
    ---
    ```

    Defining the `image` attribute overrides this behavior.

1. Update the `author` attribute array in the front matter of this file.
    Be sure to first follow the instructions above to define author profiles if needed.

    ```yaml {filename="content/community/content/videos/YOUTUBE_VIDEO_ID.md"}
    ---
    author:
      - your-name # Author 1: a file at content/community/engage/people/your-name.md
      - collaboratorA # Author 2: links to a GitHub profile at https://github.com/collaboratorA
      - "Sayid Jarrah" # Author 3: does not have an author page or a GitHub profile.
    ---
    ```

1. Update the `categories` attribute array in the front matter of this file.
Choose only one of the listed available categories, and comment out the rest.

    ```yaml {filename="content/community/content/videos/YOUTUBE_VIDEO_ID.md"}
    ---
    categories:
      - demos
    #   - livestreams
    #   - podcasts
    #   - talks
    #   - webinars
    ---
    ```

### Update your content

You will see that the video is embedded on the page automatically.

Replace the dummy content at the bottom of the page with your own.
Feel free to use the [Text formatting](/community/about/contributing/format) for styling tips and common components.

When you're finished, push to the repository and open a merge request.

Thanks for contributing!

{{% /steps %}}

