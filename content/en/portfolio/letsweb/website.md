---
title: "Letsweb website"
date: 2022-11-20T09:03:20-08:00
start: 2023-07-01
draft: false
tags: [project]
---

Building this website, through which I aim to share accumulated experience and have a place to jot down useful tips, while also using it to conduct feasibility analysis for the following objectives.

1) Avoid using a database for presentation layer needs.
2) Rely on static serving and HTML files generated quickly and efficiently in response to changes. To achieve this, analyze the performance and operation of the Hugo static site generator.
3) Evaluate Hugo as a support for managing the site's content to what extent it serves as a CMS (Content Management System).
4) Analyze the Cloudcannon service as a CMS.
5) Examine deployment methods directly from GitHub repositories using Git Actions.
6) Implement full-text search in selected areas of the site without involving the server-side and prepare multi-language support.

The technical ambition while creating this site is to make it cost-effective and modern. Cost-effective means no charges for infrastructure overhead: database or full-text search engine. Modern means having a content search, multi-language support, and fast performance on mobile devices.

Of course, at some stage of development complexity, a database will be needed, but I anticipate that for many clients, there is no need to go that far.
