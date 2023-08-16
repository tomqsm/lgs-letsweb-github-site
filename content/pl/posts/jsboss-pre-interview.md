---
title: "My Clean Architecture Go Application"
date: 2023-07-19
draft: true
tags: [jboss,interview]
---

16/08/2023 12:00 I have a scheduled meeting with ... by Magdalena Skraburska from Luxoft. It is going to be about "Senior Jboss Developer at Remote Poland"
that's the title of this meeting.

- Standalone Server, single instance (development and testing) 
- Highly Available / Managed Domain / from a single control point (Domain Controller)
  - Domain Controller e.g. deploy app to domain controller and it will propagate the deployment across cluster hosts (server nodes). It is like an 'Admin Server'
  - Host Controller 
  - Server Node