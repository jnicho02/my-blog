title: Agile text adventure development
date: 2007/12/19
tags: [ideas]
author: Jez Nicholson
alias: /agile-text-adventure-development

Inform is a tool for writing text adventures. It is a domain specific language presented via a slick editor interface (since version 7) and works somewhat like a book: you write about the scenery; create characters; define actions and reactions; create puzzles. The reader (player) then takes the role of the lead character.

I've used it before with the Brighton Coding Dojo Festival night and at the Brighton Farm Hack Day, but both times we reached the limit of what we could achieve without reading the manual. So, seeing as i've had to use up all my remaining holidays and am off for Christmas already, I thought that i'd give it a spin. First thing was to check that I am following my much-touted Agile processes!

##Simplest thing first
This is fairly easy with Inform. The most basic thing that you can do is give your adventure a name, declare a room and then run the program. The language is compiled, but the editor will do that for you. 

    "The Flat" by Jez Nicholson 
    The lounge is a room.

##test driven development
I lose points for not noticing that Inform has some built in testing functionality. It lets you define named tests as a set of commands that the user would enter. 

    Test mytestname with "go north" 

To run the test, run the game and type test mytestname. There doesn't appear to be any way to react to the result of this test, so it must be run manually and visually inspected. I suppose that a final condition could be checked for, e.g. whether the user has a specific object in their possession. It is also possible to call individual tests from another one so a 'test all'. 

    test all with "test mytestname / test mytestname2 / etc."

I have now begun doing TDD by writing the tests first. 
e.g. Test Jane with "ask jane about dinner / ask jane about wine" references a person called Jane and will cause a compile error until the character has been created: Jane is a person.

The tests in Inform7 also allow you to specify some starting conditions, e.g.
Test wine with "drop wine / give wine to Jane" in the lounge holding the wine. 
This test specifies that it will occur in the lounge (where Jane is) and whilst you are holding the wine (which it will retrieve from wherever it is).

##Continuous integration
The project could be checked into Subversion and have Cruise Control or something working, but i'm not sure how automated build and testing would run. The language does compile up to a runtime that can be played on a number of open sourced engines, so it is possible that a test client could be written that interacts with it. I would need to see if the compiler can be called from the command line.

##Long-term goal
Something I learnt from the Hack Day is that the target for the text adventure is not just that the puzzles should work, but that there should be an interesting narrative. This was highlighted by Thom's Dad joining our team and focussing on working from the desired end result backwards, an approach that is part of Edward De Bono's Lateral Thinking course. This makes me think that I must look at my Agile/SCRUM/etc. and see how the eventual long-term goal is voiced.

##Corridor testing
The good thing about writing a game is that 'normal' people (i.e. wives, girlfriends, parents) can be easily encouraged to have a go at the work-in-progress.

##Short iterations
Having corridor testers encourages this, as you need to have a working version at all times. It is really frustrating to have someone show interest, but you have to tell that it was working 5 minutes ago and will take you about 5 to fix it..then another 5..then another..They will soon wander off and do something else!

Writing tests first also encourages short iterations as the language is compiled. You won't want to have loads of tests that break the build for too long.