---
title: Oracle Hibernate byte array data switched round problem
date: 2006/01/11
tags: [java]
author: Jez Nicholson
---
The Oracle/Hibernate live installation has been going crazy on me: A Picture object contains two byte arrays containing a full size image and a reduced size thumbnail. Hibernate successfully inserts the data, but on retrieving the data it is in the wrong fields ??!^%$"£!

I'm at a bit of a loss to say what is going on, but the frustrating thing is that it works fine on all other setups. It's driving me completely up the wall. I've searched through the web and haven't found anything similar yet, although there are various negative experiences of the Oracle thin jdbc driver. I can't locate a problem in the source code and have narrowed it down to the Hibernate retrieve itself.

The system uses Hibernate in particular in order to be database agnostic and cope with hosting choices that might be made as i've no control over the process of going live...in fact I don't believe that anyone was responsible really! These choices eventually included changing the app server (from Tomcat to JRun), the database server (from mySql to Oracle) and the version of Java (from 1.5 to 1.4 as JRun had problems running on 1.5..now fixed by updater 6).