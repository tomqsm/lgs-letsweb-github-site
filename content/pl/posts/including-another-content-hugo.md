---
title: "Ways to include another content in Hugo."
date: 2023-07-11 15:08:42 +0200 CEST
draft: false
tags: [hugo]

---
#### Website as a list of single contents

Hugo consideres a website to be a **list of single contents**. It resembles a directory structure where a directory has files (content) or another directory. Let's call a **single content a leaf** and a **listing of single contents a branch**. So in Figure 1. `a.md` and `b.md` are leaves and `portfolio` and `project1` branches. Leaf's content describes itself because it has content about itself but what describes the branch itself? The answer is `_index.md` placed in the directory. This is where branch description comes from.

Content is just a text, there is no layout instruction in it. For **list of contents** (branch) the default layout comes from `layouts/_default/list.html` and for the **single content** (leaf) the default layout is from `layouts/_default/single.html`. Landing page is an exception and lives its own life.

Theoretically the content about the branch itself can come from the template instead of `_index.md`. But it is hard to set a dedicated content for each branch from a single template file without multi story conditionals and it feels an antipattern to mixup layout with content.

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
#### First directories inside `content` are `sections`
For branches, Hugo looks at the first level folders in `content` and calls it a `section`. So `{{ range .Site.Section }}` yields `[portfolio, blog]`.  

The default layout in `layouts/_default/list.html` applies to all branches similarly `layouts/_default/single.html` for all leaf content. Oftentimes `portfolio` layout would differ for `blog`. To specialize the template for a given branch e.g. `portfolio` create `layouts/portfolio/list.html` and inside dedicate a customized layout otherwise `layouts/_default/list.html` The list template assumes it would list single contents rather than another listing. Similarly for a leaf content, create `layouts/portfolio/single.html` and this will work for just this branch.

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


