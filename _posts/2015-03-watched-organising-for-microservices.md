title: read "How to be Alone" by Sara Maitland (6 hrs)
date: 2015/03/31 21:00:00 -0700
tags: [presentations]
author: Jez Nicholson
alias: /watched-organising-for-microservices

500px talk about microservices http://www.infoq.com/presentations/500px-services jump to 5m

Microservices can be referred to as 'Hipster SOA'

Single responsibility principle

If there is a single, large, codebase then it gets unwieldy. You may be using cloud services, but you are still scaling the whole app rather than the bit that actually needs to scale.

One codebase leads to having only one language/tool/hammer to use. Sometimes a problem can be cured by using a different language but you don't want to mix this in with the big codebase.

If a part of the system fails, you don't want it to affect the others.​ Eliminate Single Points Of Failure. Set up fallback options. A search function can use a cache if the database fails. Semi-live is acceptable.

DevOps practices are essential, otherwise there is an impedence between developers wanting action and sysadmins wanting stability

12 Factor Apps. Thes are good tips for making microservices work

Monitor all the things (they use DataDog)

On call rotation (Pagerduty)

Measure incident response: How it was fixed, how fast, and how it was reported. Mean Time To Detect and Mean Time To Resolve. Acknowledge that failures *will* happen. Optimise for coping with failures rather than avoiding them.

Gameday Exercises: document failure and what you expect to happen. Do a runthrough. Stop if it starts going wonky and try again later!

Automation: take the complications and distractions away. Enables experimentation.

Use Circuit Breakers. see 'Release It! Design and Deploy Production-Ready Software'

Design for Business Capabilities not technology layers

API Facades: allow a team (like the web team) to manage their own facade which then talks to the back-end service facade. Things can move on without jamming up the process.