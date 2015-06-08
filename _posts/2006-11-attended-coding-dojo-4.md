title: CodingDojo #4
date: 2006/11/30
tags: [events]
author: Jez Nicholson
alias: /coding-dojo-4

CodingDojo Meet 4 ran last night and was pretty successful. We'd decided to run this one on a Wednesday to give different people a chance to come, but the experiment seems not to have worked as the numbers were low. I feared that the session wouldn't work with fewer people, but it did. The task for this week was to revisit the game written in Meet 1.

It was good to have Thom Hopper of Future Platforms there. He's the author of the Nabaztag CruiseControl plug-in which I shall be using soon (when John sets up the wireless in our new office). We gave Thom a quick intro and seemed like seasoned Dojo-ers....after only two sessions. Anyway, having someone new to the process was good, plus Thom obviously has an enquiring mind and brought plenty of issues to the surface

##File cards
I was in the first pairing and pulled out my secret stash of file cards (which Dominic says was a Good ThingTM) and got down in writing the first couple of things that were core to the game working. I would have liked to have got more down, but even by having two cards decided we were able to start on something. Particularly because people felt like they hadn't done anything until they's got some code down....smells suspiciously like a bad code smell to me.

##Staying on plan
The cards become very useful later when I was able to stop the project drifting into new features before the core one had been completed. It is very easy to start adding bits of code that you know (think) that you will need later. But, taking a step back, all that gave us was more unfinished features. By having a physical card with the current goal written on I could literally wave it at the current developer and shout, "stop!".

##Cos Joshua Bloch says so
I enjoyed an exchange about reassigning variables with a method. In this case it was to trim a String that was being passed in. This was objected to as poor form, the reply came, "why? says who?" (questioning everything is good....says me) "well....cos Joshua Bloch says so in Effective Java Programming", "okay, next time you see Joshua Bloch can you ask him why then?". Now, I don't know whether the use of good programming form would have been wise because it may have saved us falling into a later trap, but it does make me think that I must have hundreds of little 'good form' habits that I sort of know are right but could I defend them if challenged?

##The meaning of success
We moved forward considerably faster than the previous sessions. Whether this was a product of the group being smaller and there being fewer directions, or whether it was because we were all pulling in the same direction, will remain to be seen. There is also the question of the definition of 'success'. Is it 'having a working system by the end of the session' or is it 'learning a lot along the way'? Personally I think that by achieving frequent small victories, i.e. achieving a user story, the developers feel better about what they are doing and more issues are successfully explored and more things are learnt.

##Struggled near the end
About 3/4 of the way through and we had done pretty well. The game actually worked but we didn't know what to do next! We'd been so engrossed with achieving the most important goals that we didn't have anything lined up. We had also neglected to keep the tests up-to-date, so this seemed like a good short term goal. By working on tests it became clear that the room map was part of the system and the same thing should be used by the tests and the game itself. This prompted some refactoring and an ugly but practical decision to put some fields public and reference them from the test. When we hit 9pm it worked, and to me that was the goal.

##Using Agile
I like the idea of the cards and all the Agile ideas, but i'm not going to insist on them. Hopefully, if they really do work then it'll be obvious that they are useful tools. The CodingDojo is a great opportunity to try out different tools and approaches in a safe environment.