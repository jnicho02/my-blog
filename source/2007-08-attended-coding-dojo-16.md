---
title: CodingDojo 16
date: 2007/08/02
tags: [events,hacking]
author: Jez Nicholson
---
​​I went to the Brighton Coding Dojo last night to do some more Ruby programming. We continued with the Klondike (aka Solitaire, aka Patience) CodeKata.

I think that the group benefitted from having an existing codebase to work on and that this is leading to higher levels of programming emerging. The approach has been to model the individual elements of the game which will then be combined to make the game itself, e.g. Card, Deck, Pile(s), etc.

##Test Driven Development
TDD was shown to be very useful when a strange event occurred. When trying to print out the contents of the piles there were 20+ of them rather than 7. We then discovered that the starting conditions of the Game had not been tested and contained an error. This could have been avoided and time saved.

##Responsibility
By doing Test Driven Development the classes are tending towards being responsible for their own actions. The tests exercise the class early and avoids the methods drifting off into game-related things, e.g. a Deck of cards is responsible for being 52 cards, 4 suits, etc. but knows nothing about playing Klondike. Conceivably, the Deck could easily be used for a completely different card game without having to be altered.

##Dependency Injection
The limits of responsibility start to be challenged when the game starts to be assembled. It is tempting to start adding gameplay methods to domain objects, but remember, each class should only do one thing and that one thing should be obvious from it's name. We have a Game class (that should be renamed to Klondike) and I think that we'll end up with a ComputerPlayer class that does ComputerPlayer.play(game).
