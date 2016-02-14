---
title: CodingDojo 10
date: 2007/03/09
tags: [events]
author: Jez Nicholson
---
​​​​I attended the second Brighton Coding Dojo to be held using Ruby. It's a lot easier to work out why you are at a Dojo if you don't know the language as it's clear that you are there to experience it in action. Dom has been doing a great job in letting people get on with it but being available to give input on syntax, etc. if they want to ask. If you are currently in the driving seat then you are allowed to do anything you like, including 'ask the audience'. The task this week was a repeat of a previous week's kata, that of parsing a file of weather data and returning the day number which has the smallest range between max and min temperatures. Here are the things I noticed about this week:

##testing first encourages more methods
Developing with a test-first approach encourages the developers to make small steps towards the solution rather than trying to solve it in one step. This tends to result in there being more methods in a class, with each method solving a part of the problem. In this case: getDay(), getMax(), getMin(), getSpread(), getMinSpreadDay(). This is a sort of reductionist approach, 'divide-and-conquer' if you will, that works for a large number of problems but maybe misses the 'divine inspiration' of solving a problem in a lateral way.

##lots of static
I'm slightly confused about when a method should be created as a static function and when they should be properly object-oriented. Just about all of the methods we produced were functions performed on a String and as such didn't rely on a Line object being created, e.g. getDay(String line) instead of Line line = new Line(String s), line.getDay(). I will investigate further as I suspect that it's more than a style issue and probably an incorrect use of OO

##slower or faster?
I had a good conversation with Jack about whether the Agile approach solved the task as a whole slower or faster than developing without it. On a smallish task it seems like overkill to split it into smaller parts, each with a unit test, and it would appear that the problem could have been attacked as a single block. I can see his point, but I would say that this ignores the requirement for proof, i.e. proof that the code does actually work. If this small chunk of code is to be one of the fundamental building blocks of my system then i'd like to be really sure that it works and therefore I will want tests, and if the tests are produced as part of the development process there is no need to revisit the code after completion. Also, if testing is an afterthought it is highly probable that the code is not written in a way that it is easily testable.