---
title: "Pagefind docker issue"
date: 2023-08-16
draft: false
tags: [gcp]
---
https://beebom.com/how-fix-exec-user-process-caused-exec-format-error-linux/?unapproved=619668&moderation-hash=e0d360735c8d6a4ade5927455d441f52#comment-619668
very helpful article to align architecture issue between Mac Chip M1 and --platform=linux/amd64


Pagefind is a wonderful idea.

When I run it outside of the Docker, be it locally or in GithubActions I get the following log.

```azure
Start building sites … 
hugo v0.117.0-b2f0696cad918fb61420a6aff173eb36662b406e+extended darwin/arm64 BuildDate=2023-08-07T12:49:48Z VendorInfo=brew


                   | PL | EN  
-------------------+----+-----
  Pages            | 67 | 69  
  Paginator pages  |  0 |  0  
  Non-page files   |  9 |  9  
  Static files     | 12 | 12  
  Processed images |  0 |  0  
  Aliases          |  1 |  0  
  Sitemaps         |  2 |  1  
  Cleaned          |  0 |  0  
    
    Total in 168 ms

```
For Polish version
```
<!DOCTYPE html>
<html lang="pl"><head>
	<meta name="generator" content="Hugo 0.117.0">
```
For English version
```
<!DOCTYPE html>
<html lang="en"><head>
	<meta name="generator" content="Hugo 0.117.0">
```

and the Pagefind

For Polish version
```azure
<html lang="pl"><head>
	<meta name="generator" content="Hugo 0.111.3">
```

For English version
```azure
<!DOCTYPE html>
<html lang="pl"><head>
	<meta name="generator" content="Hugo 0.111.3">
```

as it can be seen the lang value hasn't changed.

```
[Reading languages]
Discovered 2 languages: en, pl

[Building search indexes]
Total:
Indexed 2 languages
Indexed 10 pages
Indexed 468 words
Indexed 0 filters
Indexed 0 sorts
Finished in 0.34 seconds

```

When it is run inside a Docker 

```azure
#9 [hugo-builder 3/5] RUN hugo
#9 sha256:352e907537fd20377e68a485d21082a8c25efbd782973f4cafe2418e85be3aa2
#9 0.984 Start building sites … 
#9 0.985 hugo v0.111.3+extended linux/amd64 BuildDate=unknown
#9 1.910 
#9 1.912                    | PL | EN  
#9 1.913 -------------------+----+-----
#9 1.913   Pages            | 67 | 69  
#9 1.915   Paginator pages  |  0 |  0  
#9 1.915   Non-page files   |  9 |  9  
#9 1.915   Static files     | 12 | 12  
#9 1.915   Processed images |  0 |  0  
#9 1.915   Aliases          |  1 |  0  
#9 1.915   Sitemaps         |  2 |  1  
#9 1.915   Cleaned          |  0 |  0  
#9 1.915 
#9 1.916 Total in 1053 ms

```

and Pagefind

```azure
#11 131.9 [Reading languages]
#11 131.9 Discovered 1 language: pl
#11 131.9   * pl: 10 pages
#11 131.9 
#11 131.9 [Building search indexes]
#11 131.9 Language pl: 
#11 131.9   Indexed 10 pages
#11 131.9   Indexed 246 words
#11 131.9   Indexed 0 filters
#11 131.9   Indexed 0 sorts

```

and this happens irrespective of running `RUN npx pagefind --source public --verbose` or `RUN ./pagefind-linux --source public --verbose`
which is a downloaded precompiled binary copied by Dockerfile during `% docker build --no-cache --progress=plain --platform linux/arm64 --build-arg HUGO_BASEURL=http://localhost:3000 -t user/my-site:37 .
`

The difference is in Hugo version: local v0.117.0 versus Docker's v0.111.3 I am not sure this is the reason for this issue.