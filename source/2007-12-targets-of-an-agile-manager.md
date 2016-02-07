---
title: Targets of an Agile Manager
date: 2007/12/20
tags: [ideas]
author: Jez Nicholson
alias: /targets-of-an-agile-manager
---
Joh and I held the fort for the Brighton Agile Forum last night by discussing a number of Agile issues over beers at The Eagle. One thing we discussed was what the ultimate targets of an Agile Manager are. Targets being the slightly abstract concepts that lead you to achieve the end goals.

##An Autonomous Process aka Make Yourself Redundant
Joh suggested that it was to create a process that will work without you, i.e. to make yourself redundant. Easy enough to test: when you go on holiday does everything crumble? or do you have to put in double hours the week before making sure that everything is all set up?

This reminded me of being a DBA or a Linux Admin. A test of whether you are doing it right is that people start to believe that you don't do anything, as you have set up the systems so smoothly that they either never go wrong, or if they do then it is easily corrected.

Our current process is simple but effective.

* A requirement is identified and agreed with the business
* Short sprints each have a defined high level user story which is meaningful to the end customer
* The sprint story is a collection of smaller user stories (preferably agreed with the business)
* Each story is listed in a bug tracker under the release indicated as the 'next iteration'
* Developers can choose any story from the 'next iteration' to work on
* A Developer may only have one story/issue assigned to them at any one time
* Every issue must have tests written to prove that it works
* Tests should be written before any code
* A continuous integration server, which is set up the same as the live server, integrates code and tests
* Every project contains (nearly) everything that you need to build and run (I say 'nearly' as we don't currently include Apache and PHP)
* Developers can set up their development environments however they like

##See The Big Picture
I started thinking about what it is that I do that isn't part of our current 
devlopment process. At the moment I believe that we have implemented a process that is quite efficient but doesn't see 'The Big Picture'. I think that the role that I provide is that of an Analyst. I sit between the development process and the business and decide what we should develop in order to enhance their work. This is a creative activity that involves experience and imagination. Once it has been decided 'what' we want to achieve, then the development process kicks in and actually produces it. However, the isn't all decided up front (as a BDUF - Big Design Up Front) but may appear as the development continues. So, how do we adjust the development process to lead the developers towards insightful decisions about the direction of the project as a whole?