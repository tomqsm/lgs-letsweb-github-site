---
title: "Integration Test framework"
date: 2013-05-01
draft: false
tags: [project]
layout: project-single
---

05/2013 (Java SE, JAX-RS, Maven Surefire and Failsafe plugins, Embedded Tomcat, Jenkins) Development of Integration Test framework to test interoperability of web services.
A wrapper for Embedded Tomcat server plus an HTTP client. Application downloads snapshots or releases from Nexus and deploys them to Embedded Tomcat. Then it performs integration tests of their interoperability by cross firing requests. This application is installed in the Continuous Integration pipeline and is triggered by the Maven lifecycle test goal.
