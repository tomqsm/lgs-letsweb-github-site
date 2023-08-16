---
title: "Synchronization of systems"
date: 2022-11-20T09:03:20-08:00
start: 2017-07-01
end: 2019-07-01
draft: false
tags: [project]
---

(Spring Boot, SOAP CXF, REST, Hystrix, Apache Camel, MyBatis, Oracle, DB2, H2, Mockito, JUnit, JIRA, Jenkins, Bamboo, Nexus, JBoss)
- Optimisation of document management SOAP in-house clients with an external provider of document management REST system.
- Development of Jenkins scripted pipelines to harness CI and deployment across Java components.
- Design and implementation of a synchronization mechanism to maintain data integrity between the legacy and a new system being gradually phased in. Every N minutes, the component polls 11 views fed with data by Oracle 11g CDC (Change Data Capture) mechanism and one table reporting changes taking place in the new system. Camel integration pattern components give structure to the application backbone. The rest is coded in Java 8 in Spring Boot framework. Component dedicates a thread of execution to each resource being queried, aggregates results (multicast, aggregator), does calculation on data gathered and dispatches asynchronously (splitter, streaming, seda) or synchronously results to the target tables. Camel’s test framework supports asynchronous integration testing.
- Maintenance of CXF (SOAP) web services and development of new operations, from requirement gathering to release instructions for devops.