---
title: "Map updates"
date: 2013-08-01
draft: false
tags: [project]
layout: project-single
---

08/2013 (Maven, Jenkins, Java SE, JAXB, Postgres, XML, DBF, Shapefile, Observer, MVC, Generics, Multithreaded).
Application to handle changes to maps. These changes were described in XML. The XML had tags identifying a road or maneuver attribute changed and its location on the map. The tool was to take these changes in and carry them over onto another format called Shape ref: http://en.wikipedia.org/wiki/Shapefile. The application engine run reactively on events from a JAXB API listener. The observers under a common interface (Observer pattern) generically parameterized reacted on the product of unmarshalling, an object matching the type of one of an expected parameter, the observer would create a ‘change model’ and spawn a thread (Callable) to perform subsequent operation on a Shape file. Application picks up appropriate Shape file via matching the observer parameter type to the file name, then downloads it from the network, unpacks and seeks appropriate location to create, update or delete a record depending on the data in ‘change model’. Controller does the updates and produces statistics presented by ‘views’ such as console output or DBF file (MVC). The output could be used in Shapefile visualization software such as ArcGis to illustrate updates in a broader context. Annotation and reflection is used to register observers. This solution prefers polymorphism to ifs / switch statements to consume specific types from a disparate input.