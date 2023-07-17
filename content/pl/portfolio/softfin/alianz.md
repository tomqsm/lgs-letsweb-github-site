---
title: "Alianz"
date: 2022-11-20T09:03:20-08:00
draft: false
tags: [klient]
---
- Development of Jenkins scripted pipelines to harness CI and deployment across Java components.
- Design and implementation of a synchronization mechanism to maintain data integrity between the legacy and a new system being gradually phased in. Every N minutes, the component polls 11 views fed with data by Oracle 11g CDC (Change Data Capture) mechanism and one table reporting changes taking place in the new system. Camel integration pattern components give structure to the application backbone. The rest is coded in Java 8 in Spring Boot framework. Component dedicates a thread of execution to each resource being queried, aggregates results (multicast, aggregator), does calculation on data gathered and dispatches asynchronously (splitter, streaming, seda) results to the target tables. Camel’s test framework supports asynchronous integration testing.
- Maintenance of web services and development of new operations from requirement gathering to release instruction for devops.

Responsibilities:
- Requirements capture, analysis and design in cooperation with a business analyst
- Selection of frameworks and design patterns, implementation and testing
- Induction, daily scrum and tech-leading once the development team grew up by a next developer
- Setting project up on continuous integration, testing, and deployment pipeline for testing environment
- Liaising with application administration team with regard to manual configuration and deployment
- Code review

