title: CodingDojo #1
date: 2006/10/18
tags: [events]
author: Jez Nicholson
alias: /coding-dojo-1

Here are my experiences of the Brighton Coders' Dojo on Monday night. Concept: 12 people meet and work on a specified problem for 2 hours, pair programming is used (a keyboard 'driver' and a 'navigator'), after 5 minutes one of the pair is swapped out. The screen is attached to a projector so that everyone could see. All of the developers are aware of progress, but cannot assist if they think that the current pair are going wrong (unless they don't understand, in which case they can ask for clarification).

The problem domain for this session was money handling in a supermarket. My initial expectation was that I would learn about the complexities of the problem domain but it soon turned out that people were finding things out about Java, Eclipse and Agile/Extreme Programming. My primary interest is in how people work together in order to make teams more cohesive and developers less isolated.

Points that came up were:

* you can get started quickly by listing possible objects and attributes in a text file.
* using encapsulation lets you create a few objects quickly as you can can get the workings right later on
* how to store decimal values
* how you use JUnit
* test-first programming
* letting the test deliberately fail before you write it correctly
* Object equality
* Java 1.5 generics
* why make Objects instead of just accepting primitives
* static variables to make code more readable/prevent incorrect values
* extending classes to override methods
* how one person's approach can affect the direction of the development

The final point was what it all boiled down to for me. What you've got is an ultra short development cycle with no structure and lots of disruption. If one pair adopts a strong enough approach (in this case 'test-first programming') it can force the development in that direction, rightly or wrongly. I realised that no approach could be labelled 'right' or 'wrong', just useful at the moment. However, the approach may obscure the problem, i.e. people spend all their time learning about test-first programming and none in modelling money in supermarkets.

I think that I had the best suggestion: let's just build a Poundshop (where every item costs one pound)