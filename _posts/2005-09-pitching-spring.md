title: answering Rick Hightower: How do you pitch the Spring framework to a development manager?
date: 2005/09/11 21:00:00 -0700
tags: [ideas]
author: Jez Nicholson
alias: /pitching-spring

I started adding a comment to Rick Hightower's blog entry How do you pitch the Spring framework to a development manager? but soon discovered that the comments box didn't leave me enough room to say what I wanted to say.

I've had to carry out a similar exercise. Things I would say are:

Managers care about the end result of development: a happy business

* low number of bug reports
* no crisis meetings
* no finger of blame pointed in their direction
* no need for massive overtime
* target release dates being met
* software doing what customers need but either didn't know they needed or were unable to verbalise
* no surprises
* some sort of metric that says how complete a system is

Answer these, and you've got a Development Manager's attention.
Aspects encourage clean partioning of models so that your core model is clean and logical [and with luck, reusable]...e.g. a hotel booking system involves hotels, guests and bookings in the core model. Users and roles within the web system are not part of that logical model, but are applied via an aspect. I know that if you design your objects properly that this will happen anyway, but from experience I find that over time lots of methods slip in to the core model that the objects aren't responsible for. This should ring a bell with Development Managers who are promoted from being a Developer.

To appeal to a business-oriented Development Manager you could start talking Agile/Test-driven Development as just-in-time manufacturing. Mary Poppendieck talks about 'Lean Software Development'. Long development cycles lead to sudden surprises: 6 months of programming..everything looks fine for the live release..then bang! loads of 'bugs' (errors or missing/different functionality) discovered..bigtime stress!. Explain it like a car assembly line. If you build 50 doors, then 50 body shells, etc., etc., you don't notice any mistakes for ages as the production heartbeat is long. Reduce the size of the batches and you increase the heartbeat and discover errors sooner. This is what we are doing with Test-Driven Development + autobuild and deploy (a la CruiseControl)

Test-Driven Development + Spring + UML could lead to management metrics that show how complete a system is. If you've done enough UML Use Cases and Sequence Diagrams to decide what the functions of the system will be, then you could create the skeleton manager classes and their corresponding tests. Something like CruiseControl you can publish your test results on a webpage so that the manager can see which bits are coded and which are not.

Spring encourages seperation of model and view. To the Development Manager this means that they can assign a seperate resource to do the front-end styling and not bother the core Developers. Development Managers like flexibility. If the project is starting to run late they want to be able to allocate extra resources, but just adding to the core development team can be detramental as it takes someone time to get up to speed.