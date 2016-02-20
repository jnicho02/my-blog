---
title: Certainty
date: 2006/05/15
tags: [ideas]
author: Jez Nicholson
---
Certainty is key when running a business. When your customers give you money to do something then they expect you to do it, within a timeframe they feel is reasonable, and with a certain level of hassle. These are the parameters that make up the offering, and the business needs to be certain that they can achieve these targets.

##does IT deliver?
I don't believe that IT system developers provide business with enough ability to be certain. I'm not even sure that we know that it's a problem. It's one of those 'managers are from Mars, developers are from Venus' moments. Traditional project management has concentrated heavily on the achievement of milestones, but when the system goes into production the approach is one of service quality measurements (e.g. IT = a system can perform a process, Production: time taken to perform a process). We're asked to develop systems by a certain time, so that's what we do. It's all well and good finishing a system on time, but how certain are you that it works? How much of next year's salary would you be willing to bet on that?

##defining 'works'
Ah, what a nightmare, we can't even define how we measure whether a system 'works' or not! Most of the time we get bogged down in arguments over 'bugs'.

I have a perennial argument about what is a bug and what is a new feature. In the end it all comes down to nomenclature, one man's bug is another man's feature. It doesn't matter...a computer system is bought-as-seen, assuming that the developers have done enough to prove to the customer that it does what it is supposed to do, they've coughed up the cash and it's been used in a live situation for a reasonable bedding-in/warranty period, then anything that it doesn't do in the way required is a new 'issue'. In business it is a case of 'is it good enough to perform the required service'.

It's a bit like buying a car. You expect the core functionality (engine, steering, brakes) to be 100% correct, but are prepared to expect different levels of finish depending on the price (walnut dash, nice radio). The one true measure is 'did you part with money for the car, or not'.

So one measure of 'works' for a system sold to an external customer is whether they are prepared to give you the cash. Not sure how this would translate to an internal customer though?

SLA's made a difference, as they are an attempt to define 'works' in service terms, e.g. "a payment must be processed within 3 days of receipt". But SLA's are not always defined and when they are it is sometimes done without full consideration, e.g. "there will be 99.9% uptime".

##definition changes over time
Over time, as the system is used in a live situation the definition of 'works' will change. Businesses need to maintain competitive advantage and as soon as a competitor releases a feature or performs an equivalent service better then the parameters change. Previously minor features may suddenly become more important if they are what differentiate your product, and the system may suddenly not 'work'.

##how sure are you?
How can you prove to a business person that the system you've built will perform the core functionality accurately and in a timely manner? Business people like metrics. If you don't measure something then you can't change it.

* Test coverage report: prove that you've tested everything
* Reports from Automated test scripts
* Volume testing results
* javadoc comment coverage. Not sure how you can test the 'correctness of comments' though

We've learnt from the documentation debacle that writing long documents is a waste of time. Documention must be an artifact of the system.

##"Trust me, i'm a pro!"
Another angle for creating confidence is to prove that we are professionals.

* Test-driven development leads to higher quality code
* Use of a sturdy framework means that more effort is spent on the system that on the framework
* Fewer lines of code, fewer things to go wrong?
* Track record of the developers. Have they got a history of delivering accurate solutions?