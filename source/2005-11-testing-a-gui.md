---
title: Is it practical to JUnit test a GUI?
date: 2005/11/16
tags: [code]
author: Jez Nicholson
---
I was talking to Doug last week about test driven development in theory and in practice. Most people are prepared to accept the idea of test driven development, but when you look at big projects that you are working on how many have full JUnit tests? To me, it seems that the first place that the rot sets in is in testing a Swing GUI.

Some thoughts on why this is the case are:

GUI development is not always viewed as 'serious' programming. The 'serious' code gets tested (e.g. the core model) but the GUI doesn't.
The GUI is written at the end of the development and there is a big rush, so testing is dropped.
It's difficult to think how some visual elements could be tested
The GUI code is full of dependencies on other classes and it's hard to isolate individual screens
It appears tricky to simulate someone typing and clicking buttons
I have been trying to produce more thorough GUI tests and the results are:

* Individual screens and panels can be run standalone. This is because i've been encouraged to write them in a proper OO manner.
* I've introduced data binding, i.e. a screen can be fired up, then have an Object bound to it and it will populate it's fields with the appropriate data values. On unbinding it will do the opposite
* The screens are pure views of the data in the object, the object being the model.
* Screens can easily bind/unbind sub-components with a generic method that loops through everything in getComponents()
* I managed to locate errors where screen data wasn't being set into the underlying object.
* I had problems with listeners. Calling checkbox.setSelected(true) doesn't fire listeners whereas checkbox.doClick() does
* You could use the Robot class, but that means that the component has to physically be visible on a screen which is slower than having it invisible. Also, if this is test-driven development the tests might be being run by CruiseControl on a blind server somewhere

Resources
* JavaWorld article "Automate GUI tests for Swing applications" Nov 1994
* Yahoo Group for Java GUI Testing
* list of Junit GUI tools
* GUIDancer