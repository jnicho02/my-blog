---
title: Test Driven Text adventure development
date: 2008/01/08
tags: [agile,games]
author: Jez Nicholson
---
To continue my investigations into text adventure programming using Inform7 I have been thinking about different types of puzzles. I was browsing through a Game Design book in Borders which included a short paragraph on puzzle types. If I remember rightly, the list is as below:

* ordinary use of an object: use something for it's normal purpose
* extraordinary use of an object: use something in a way that it wasn't originally intended
* in-the-middle: erm...i'll fill this in later when I remember what it is!
* chain of events: A causes B, elsewhere in the game C causes D, player summises that B will cause C so that A --> D
* timing: performing an action before or after a specific event
* preparing the way: do something so that when another event occurs then it has a different result
* fabrication: make something out of a number of objects
* dialogue: by leading the conversation down a particular path, the solution is reached
* people: by understanding character's unique personalities the player can use them to achieve a desired action
* cryptogram / word: an anagram, hidden word, play on meaning (like a crossword clue)
* riddle: a classic riddle puzzle
* classic: a puzzle historically used in text adventures

I would like to write an example of each type of puzzle in Inform in order to learn how it works

##Ordinary use of an object: Opening a bottle of wine
My first attempt is to code opening a bottle of wine.
###Iteration 1: Give it a title and write a test

    "Opening some wine" by Jez Nicholson
    Test wine with "open bottle" holding the wine.

This will fail to compile as Inform doesn't know what the wine is. This is fixed by introducing a room with a bottle of wine in:

    "Opening some wine" by Jez Nicholson
    Test wine with "open bottle" holding the wine.
    The lounge is a room.
    The bottle of wine is in the lounge.

This will now compile, but the test will result in nothing happening

    lounge
    You can see a bottle of wine (empty) here.
    test wine
    (first acquiring the bottle of wine)
    (Testing.)
    [1] open bottle
    That's not something you can open.

###Iteration 2: Make the bottle into something that is openable

    "Opening some wine" by Jez Nicholson
    Test wine with "open bottle" holding the wine.
    The lounge is a room.
    The bottle of wine is in the lounge. The bottle of wine is an openable container.

results in:

    lounge
    You can see a bottle of wine (empty) here.
    test wine
    (first acquiring the bottle of wine)
    (Testing.)
    [1] open bottle
    That's already open.
    The bottle appears to be already open.

###Iteration 3: The bottle should be closed

    "Opening some wine" by Jez Nicholson
    Test wine with "open bottle" holding the wine.
    The lounge is a room.
    The bottle of wine is a closed openable container in the lounge.

results in:

    lounge
    You can see a bottle of wine (closed) here.
    test wine
    (first acquiring the bottle of wine)
    (Testing.)
    [1] open bottle
    You open the bottle of wine.

But, it shouldn't be that easy, you should use a corkscrew

###Iteration 4: Lock the bottle

    The bottle of wine is a closed openable locked container in the lounge.

Gives:

    lounge
    You can see a bottle of wine (closed) here.
    test wine
    (first acquiring the bottle of wine)
    (Testing.)
    [1] open bottle
    It seems to be locked

###Iteration 5: Introduce a corkscrew

    The corkscrew is in the lounge.

###Iteration 6: Use the corkscrew to open the bottle

    "Opening some wine" by Jez Nicholson
    Test wine with "take corkscrew / unlock bottle with the corkscrew / open bottle" holding the wine.
    The lounge is a room.
    The bottle of wine is a closed openable locked container in the lounge.
    The corkscrew is in the lounge.
    The corkscrew unlocks the wine bottle.

results in:

    lounge
    You can see a bottle of wine (closed) and a corkscrew here.
    test wine
    (first acquiring the bottle of wine)
    (Testing.)
    [1] take corkscrew
    Taken.
    [2] unlock bottle with the corkscrew
    You unlock the bottle of wine.
    [3] open bottle
    You open the bottle of wine.

###Iteration 7: Make the English more natural
rather than unlocking the bottle, then opening it, it is more natural to just 'open the bottle with the corkscrew'

Test wine with "take corkscrew / open bottle with the corkscrew" holding the wine.