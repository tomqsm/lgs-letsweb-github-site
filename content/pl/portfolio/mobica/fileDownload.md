---
title: "File download"
date: 2023-07-20 09:29:10 +0200 CEST
start: 2013-11-01
draft: false
tags: [projekt]
layout: project-single
---

11/2013 (Maven, Jenkins, JAX-RS / Spring, Postgres, JavaScript / JQuery, Tomcat) Front and back-end allowing download of on the fly generated reports to the criteria passed from UI.
Spring based web service with HTML/JavaScript interface. User selects criteria such as date from, date to etc. JavaScript validates user input and performs AJAX post request to Spring controller. The controller consults back-end and responds with appropriate HTTP response with a stream of CSV MIME typed data. Browser reacts to the stream by allowing to save it to file.
