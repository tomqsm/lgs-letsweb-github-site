---
title: "Ways to include another content in Hugo."
date: 2023-07-11T15:57:20-08:00
draft: false
tags: [hugo]

---
#### Website is as a single content or a list of contents

Hugo consideres a website consists of a **list of contents** and a particular **single content** itself. Content is just a text, there is no layout instruction in it. For **list of contents** the default layout comes from `layouts/_default/list.html` and for the **single content** the default layout is from `layouts/_default/single.html`. Landing page is an exception and lives its own life.

#### Single content file text and the list of contents text 

Let's call a **single content a leaf** and a **listing of single contents a branch**. So in Figure 1. `a.md` and `b.md` are leaves and `portfolio` and `project1` branches. Leaf content describes itself because it has content about itself but the branch has leafs but what about the branch's info about itself?

Most preferable look of a branch web page would preferably look like the following example:

- branch -> This is a portfolio of projects I made over the last 10 year. (text) (where this is from?)
  - leaf -> (link or summary from this leaf content) a.md (leaf)
  - leaf -> (link or summary from this leaf content) b.md (leaf)


    
Figure 1. Fragment of a Hugo site directory outline.
```
├── (...)
├── content
│   ├── portfolio
│   │   ├── project1
│   │   │   └── a.md
│   │   │   └── b.md
│   │   │   └── _index.md
│   │   └── project2
│   │   │   └── c.md
│   │   │   └── d.md
│   │   └── _index.md
│   └── blog
│       └── post1.md
├── layouts
│   ├── portfolio
│   │   ├── list.html
│   │   └── single.html
│   └── _default
│   │   ├── list.html
│   │   └── single.html
│   └── (...)
└── (...)
```

For branches, Hugo looks at the first level folders in `content` and calls it a `section`. So `{{ range .Site.Section }}` yields `[portfolio, blog]`.  Theoretically the content about the branch itself can come from the template. But it is hard to set a dedicated content for each branch from a single template file without multi story conditionals and it feels an antipattern to mixup layout with content.

The answer is in `_index.md`. It has the default content for that section / branch and has the front matter metadata specific to the section / branch (directory) as a whole. So on a listing page this content from the subfolders `_index.md` will be displayed.

The default layout in `layouts/_default/list.html` applies to all branches similarly `layouts/_default/single.html` for all leaf content. Oftentimes `portfolio` layout would differ for `blog`. To specialize the template for branch create `layouts/portfolio/list.html` you can customize the template for displaying the listing of another listing (subfolders) info which is a listing of a group of pages. Without this `layouts/_default/list` would have been used which assumes a listing of a single contents rather than listing of another listing of content. Similarly for a leaf content, create `layouts/portfolio/single.html` and this will work for just this branch.
#### Dedicated leyout for a subdirectory
You can also set the layout dedicated to branch subdirectories in the subdirectory _index.md front matter `layout: gft-list`, create a template html inside `layouts/portfolio/gft-list.html` and it will be used for the subdirectory and you overcome Hugo feature of using layout per section only.

Then inside this template {{- .Content -}} will be md files in this directory and you can add extra content by parameter type. When you set parameter type in a file front matter this file will be ignored from default listing and you have to include it manually by type:
 
```go
{{- range where .Site.Pages "Params.type" "intro" -}}
{{- .Content -}}
{{- end -}}
```
#### Add another content with a shortocode 

Create a shortcode `import.html`

```go
{{- $path := .Get "path" -}}
{{- with .Page.Site.GetPage $path -}}
{{- .Content -}}
{{- end -}}
```
and use it the following way:

```plaintext
{{</* import path="posts/js/dom-ready.md" */>}}
```


