---
title: Flash games. Threaded or single execution loop?
date: 2009/01/05
tags: [ideas]
author: Jez Nicholson
---
​​​Whilst writing a Flash mini-game the discussion came up whether the objects themselves should manage their proximity checking, etc. or whether there should be a single game execution loop that steps through a container of game characters. I'm making a note here because I am going for Inbox Zero and am about to delete the emails about it.

Me being a Java Dev, I tried an object-based approach first and it all ran really slowly. I'm not sure how good Flash (as in Actionscript 3.0) is at multi-threading, but my guess is nothing like as good as Java, so we tried the single "game loop" approach. This has the added benefit of being simple to pause the game and/or look at the current game state. I guess that the problem then becomes more about efficiently handling stepping through a set of objects giving them their 'turn'. It all takes me back to mainframe days of round-robin and priority scheduling.

The single game loop seems fairly effective for small-ish numbers of objects, so maybe it is sensible to just accept that and use it. I know that there are other schemes based on splitting the screen into cells and only checking for collisions between close objects (to me, this sounds like a database index). http://lab.polygonal.de/2007/09/09/quadtree-demonstration/

Another area to investigate later would be more efficient containers e.g. http://code.google.com/p/as3ds/ and plenty of good examples here: http://lab.polygonal.de/category/data-structures/