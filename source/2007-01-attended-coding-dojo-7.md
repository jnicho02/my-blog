---
title: CodingDojo 7
date: 2007/01/25
tags: [events,brighton-coding-dojo]
author: Jez Nicholson
---
I have increased my attendance of events in Brighton following my rediscovery of upcoming.org. I believe that upcoming.org has now reached a critical mass of users/events that make it the place to communicate Developer events. I might even kill my BNM Google Calendar that I crowed about previously.

So, anyway, I went to CodingDojo Meet 7 last Monday night after a quick hour of five-a-side footy. This time we were tasked with using Java to solve sudokus. CodingDojo regulars Dom and Dan were there and I met Ollie (hi Ollie!). The session followed an Agile style and prompted a number of interesting discussions including:

##Test-first Development
Me getting a bit evangelical to Ollie. A while ago I took on a 'thing' from 43things to Practice religious test-first development for a month and got some really good results (quality code, zero errors, less stress, delivery on time). I think the name scares people as they think that they have to code the entire test for every possible method first, but I call it 'test-during development' as you write the test just before you begin writing a particular method. Yes, it would be nice to specify full interfaces and tests first but if you are doing rapid development then you won't necessarily know what methods you are going to need.

##Outsourcing
Where specifying full interfaces and tests first would be very useful is if you were outsourcing all the code development.

##Developing the game rules as a means of progressing...
One of the points of the CodingDojo is that you don't need to prepare for it. This raises the question of 'do you need to have in your head an idea of how to solve the problem before you start coding it, or is the act of coding a way of exploring the problem and getting you closer to the solution?'. Quite frankly, I didn't have much of an idea how to write a sudoku solving algorithm. My 'bag' is managing teams to solve problems and not knowing all the answers. In this case, I believe that turning the sudoku problem into code first was leading us closer to being able to write a solver.

##How soon to abstract
We had a discussion over what dimensions a sudoku puzzle can be. The standard size is 9-by-9 with 9 mini squares, but larger ones can be constructed. Dan suggested that the value had to be a power. After a while I got to wondering whether the abstraction process was actually helping, because a) we would 99% of the time want a standard size puzzle, b) the spec didn't ask for different sizes, c) time was flowing away and we weren't progressing...or were we? By thinking about the abstraction, maybe we were learning more about the problem.

It would seem that it is a value choice which way you choose to probe the problem. If you are getting bogged down on one approach then maybe it is pragmatic to try another. The previous approach can always be returned to. Sometimes the abstraction is just overcomplicating the problem.