---
title: "Maintainance and reduction of technical debt"
date: 2022-11-20T09:03:20-08:00
start: 2019-08-01
end: 2020-08-01
draft: false
tags: [projekt]
---

Range of tasks aimed at improvement of configuration and security of a suite of microservices. Configurations of 30 + microservices were file based and needed to be relocated to the database and then integrated in the Spring Boot lifecycle from a config server.  Security-wise, client began migrating to CyberArk and the sensitive data, used by the microservices from their configuration files, first needed to be enrolled in CyberArk. Task fulfilled by meeting security requirements set by liaising with appropriate teams. Then the microservices needed enablement to the configuration flow by retrieval of sensitive data from CyberArk instead of config server.
Responsibilities:
- Preparing initial implementation of integration of microservices with Cyber Ark security management.
- Liaising with client's organizational units to enrol sensitive data to Cyber Ark.
- Migrating microservices configuration from files to spring cloud configuration server. Code changes required.
- Handling development lifecycle of microservices on client's infrastructure from coding, reviews, deployments in testing environments to release.
- Assuring client's requirements are understood across team members and coordinating daily standups and meetings with client.
