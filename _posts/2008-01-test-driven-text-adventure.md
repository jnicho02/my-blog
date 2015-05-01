title: Test Driven Text adventure development
date: 2008/01/08
tags: [ideas]
author: Jez Nicholson
alias: /test-driven-text-adventure

To continue my investigations into text adventure programming using Inform7 I have been thinking about different types of puzzles. I was browsing through a Game Design book in Borders which included a short paragraph on puzzle types. If I remember rightly, the list is as below:

ordinary use of an object: use something for it's normal purpose
extraordinary use of an object: use something in a way that it wasn't originally intended
in-the-middle: erm...i'll fill this in later when I remember what it is!
chain of events: A causes B, elsewhere in the game C causes D, player summises that B will cause C so that A --> D
timing: performing an action before or after a specific event
preparing the way: do something so that when another event occurs then it has a different result
fabrication: make something out of a number of objects
dialogue: by leading the conversation down a particular path, the solution is reached
people: by understanding character's unique personalities the player can use them to achieve a desired action
cryptogram / word: an anagram, hidden word, play on meaning (like a crossword clue)
riddle: a classic riddle puzzle
classic: a puzzle historically used in text adventures
I would like to write an example of each type of puzzle in Inform in order to learn how it works

Ordinary use of an object: Opening a bottle of wine
My first attempt is to code opening a bottle of wine.
Iteration 1: Give it a title and write a test
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

>test wine
(first acquiring the bottle of wine)
(Testing.)

>[1] open bottle
That's not something you can open.
Iteration 2: Make the bottle into something that is openable
"Opening some wine" by Jez Nicholson
Test wine with "open bottle" holding the wine.
The lounge is a room.
The bottle of wine is in the lounge. The bottle of wine is an openable container.
results in:

lounge
You can see a bottle of wine (empty) here.

>test wine
(first acquiring the bottle of wine)
(Testing.)

>[1] open bottle
That's already open.
The bottle appears to be already open.

Iteration 3: The bottle should be closed
"Opening some wine" by Jez Nicholson
Test wine with "open bottle" holding the wine.
The lounge is a room.
The bottle of wine is a closed openable container in the lounge.
results in:

lounge
You can see a bottle of wine (closed) here.

>test wine
(first acquiring the bottle of wine)
(Testing.)

>[1] open bottle
You open the bottle of wine.
But, it shouldn't be that easy, you should use a corkscrew

Iteration 4: Lock the bottle
The bottle of wine is a closed openable locked container in the lounge.
Gives:

lounge
You can see a bottle of wine (closed) here.

>test wine
(first acquiring the bottle of wine)
(Testing.)

>[1] open bottle
It seems to be locked
.
Iteration 5: Introduce a corkscrew
The corkscrew is in the lounge.
Iteration 6: Use the corkscrew to open the bottle
"Opening some wine" by Jez Nicholson
Test wine with "take corkscrew / unlock bottle with the corkscrew / open bottle" holding the wine.
The lounge is a room.
The bottle of wine is a closed openable locked container in the lounge.
The corkscrew is in the lounge.
The corkscrew unlocks the wine bottle.
results in:

lounge
You can see a bottle of wine (closed) and a corkscrew here.

>test wine
(first acquiring the bottle of wine)
(Testing.)

>[1] take corkscrew
Taken.

>[2] unlock bottle with the corkscrew
You unlock the bottle of wine.

>[3] open bottle
You open the bottle of wine.
Iteration 7: Make the English more natural
rather than unlocking the bottle, then opening it, it is more natural to just 'open the bottle with the corkscrew'

Test wine with "take corkscrew / open bottle with the corkscrew" holding the wine. ( Jan 08 2008, 09:08:17 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20071220 Thursday December 20, 2007
Targets of an Agile Manager
Joh and I held the fort for the Brighton Agile Forum last night by discussing a number of Agile issues over beers at The Eagle. One thing we discussed was what the ultimate targets of an Agile Manager are. Targets being the slightly abstract concepts that lead you to achieve the end goals.

An Autonomous Process aka Make Yourself Redundant
Joh suggested that it was to create a process that will work without you, i.e. to make yourself redundant. Easy enough to test: when you go on holiday does everything crumble? or do you have to put in double hours the week before making sure that everything is all set up?

This reminded me of being a DBA or a Linux Admin. A test of whether you are doing it right is that people start to believe that you don't do anything, as you have set up the systems so smoothly that they either never go wrong, or if they do then it is easily corrected.

Our current process is simple but effective.

A requirement is identified and agreed with the business
Short sprints each have a defined high level user story which is meaningful to the end customer
The sprint story is a collection of smaller user stories (preferably agreed with the business)
Each story is listed in a bug tracker under the release indicated as the 'next iteration'
Developers can choose any story from the 'next iteration' to work on
A Developer may only have one story/issue assigned to them at any one time
Every issue must have tests written to prove that it works
Tests should be written before any code
A continuous integration server, which is set up the same as the live server, integrates code and tests
Every project contains (nearly) everything that you need to build and run (I say 'nearly' as we don't currently include Apache and PHP)
Developers can set up their development environments however they like
See The Big Picture
I started thinking about what it is that I do that isn't part of our current devlopment process. At the moment I believe that we have implemented a process that is quite efficient but doesn't see 'The Big Picture'. I think that the role that I provide is that of an Analyst. I sit between the development process and the business and decide what we should develop in order to enhance their work. This is a creative activity that involves experience and imagination. Once it has been decided 'what' we want to achieve, then the development process kicks in and actually produces it. However, the isn't all decided up front (as a BDUF - Big Design Up Front) but may appear as the development continues. So, how do we adjust the development process to lead the developers towards insightful decisions about the direction of the project as a whole?

( Dec 20 2007, 10:34:57 AM GMT ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20071219 Wednesday December 19, 2007
Agile text adventure development
Inform is a tool for writing text adventures. It is a domain specific language presented via a slick editor interface (since version 7) and works somewhat like a book: you write about the scenery; create characters; define actions and reactions; create puzzles. The reader (player) then takes the role of the lead character.

I've used it before with the Brighton Coding Dojo Festival night and at the Brighton Farm Hack Day, but both times we reached the limit of what we could achieve without reading the manual. So, seeing as i've had to use up all my remaining holidays and am off for Christmas already, I thought that i'd give it a spin. First thing was to check that I am following my much-touted Agile processes!

Simplest thing first
This is fairly easy with Inform. The most basic thing that you can do is give your adventure a name, declare a room and then run the program. The language is compiled, but the editor will do that for you. 
"The Flat" by Jez Nicholson 
The lounge is a room.

test driven development
I lose points for not noticing that Inform has some built in testing functionality. It lets you define named tests as a set of commands that the user would enter. 
Test mytestname with "go north" 
To run the test, run the game and type test mytestname. There doesn't appear to be any way to react to the result of this test, so it must be run manually and visually inspected. I suppose that a final condition could be checked for, e.g. whether the user has a specific object in their possession. It is also possible to call individual tests from another one so a 'test all'. 
test all with "test mytestname / test mytestname2 / etc."

I have now begun doing TDD by writing the tests first. 
e.g. Test Jane with "ask jane about dinner / ask jane about wine" references a person called Jane and will cause a compile error until the character has been created: Jane is a person.

The tests in Inform7 also allow you to specify some starting conditions, e.g.
Test wine with "drop wine / give wine to Jane" in the lounge holding the wine. 
This test specifies that it will occur in the lounge (where Jane is) and whilst you are holding the wine (which it will retrieve from wherever it is).

Continuous integration
The project could be checked into Subversion and have Cruise Control or something working, but i'm not sure how automated build and testing would run. The language does compile up to a runtime that can be played on a number of open sourced engines, so it is possible that a test client could be written that interacts with it. I would need to see if the compiler can be called from the command line.

Long-term goal
Something I learnt from the Hack Day is that the target for the text adventure is not just that the puzzles should work, but that there should be an interesting narrative. This was highlighted by Thom's Dad joining our team and focussing on working from the desired end result backwards, an approach that is part of Edward De Bono's Lateral Thinking course. This makes me think that I must look at my Agile/SCRUM/etc. and see how the eventual long-term goal is voiced.

Corridor testing
The good thing about writing a game is that 'normal' people (i.e. wives, girlfriends, parents) can be easily encouraged to have a go at the work-in-progress.

Short iterations
Having corridor testers encourages this, as you need to have a working version at all times. It is really frustrating to have someone show interest, but you have to tell that it was working 5 minutes ago and will take you about 5 to fix it..then another 5..then another..They will soon wander off and do something else!

Writing tests first also encourages short iterations as the language is compiled. You won't want to have loads of tests that break the build for too long.

( Dec 19 2007, 10:39:54 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20071210 Monday December 10, 2007
Widgety Goodness 2007UK
Went to a conference on widgets last week. Here are some of the memes that I picked up.

Chris Cunningham, Freewebs
Users have a voracious appetite for things to publish on their personal sites.
If someone embeds a widget on their page then this serves to identify who they are to the widget and it can customise content. (Me...to myself)
Value in the near-term is in honing your skills, but in the long term is through 'Engagement Marketing'.
To be 'successful' widget must have a personal outcome and a purpose
Russell Davies, Open Intelligence Agency
"the more you know about me, the more it freaks me out". CRM can reach an uncanny valley point and scare the user.
If you get something wrong when you personalise it, then it is really bad. Why personalise things that you don't have to? e.g. getting your name wrong on the hotel room's TV screen welcome message.
"give me meaning, give me fun"
Simon Andrews
Viral doesn't work if you are just using as a cheap option. Traditional advertising methods will be needed to publicise the widgets.
Traditional marketing agencies don't know what to do with them as it is low(er) spend + they are geared up to produce TV, print and/or large web sites.
"It's time to experiment"
Colm O'Connor, Joost
Widgets are connected to 'the future of TV'....but I can't say what it is yet.
There's something extremely interesting about Joost, but I can't put my finger on it. (me...to myself)
Emmanuel Prat, Widgetavenue
If you want to publish to multiple social networks then you probably need to use a Widget Distribution Platform.
It's a Write-One-Read-Anywhere problem. WidgetAvenue wrappers your widget so that it works anywhere.
don't do slides with green writing on white background. Especially when it is the most important line on the slide! (me...to myself)
Matthew Trewhella, Google
OpenSocial, is it a Widget Distribution Platform killer...or an enhancer? (me..to myself)
Ankur Shah, Techlightenment
The Dylan widget worked fantastically. Required zero advertising after being seeded to close (influentual?) friends first.
Interesting that the growth rate was not exponential. leads me to think that it had a viral index of 1 (on average, every recipient sent it on to one person)
Alex Bard, yourminis
Widgets can be classed as 'expression widgets' or 'consumption widgets'
'Expression widgets' just say something about the user. They are the 'new car sticker'. They tend to have a shorter lifespan as they don't generally involve any interaction.
'Consumption widgets' have a purpose, such as a weather feed, and may have a longer lifespan.
'Virality' is the index of how many people pass it on. To be called 'highly viral' your widget wants to have an index of 2-3 (i.e. on average every recipient passes it on to 2-3 friends).
Ori Soen Musestorm
Widget usage should be measured in detail. If it's a video then: how many people pressed play; how many people paused the video; how many people quit; etc.
A widget can be thought of a bit like a microsite
Once the widget is on a users site you can (and most definitely should) update it with new content.
Monitor engagement carefully, learn and optimise.
The design of the UI matters a lot, it should lead users to engage (me...to myself)
A Flash widget is still just a banner.
Musestorm doesn't wrapper widgets, it generates native apps for each platform.
Khris Loux, js-kit
SEO: how does you widget interact with indexing engines?
lots of other interesting stuff that went over my head (me..to myself)
Steve Touhill, Clearspring
Types of widgets usages lead to different window sizes: social net (400*300), start page (300*250), blog (skyscraper banner), ad (banner)
You can't pop out of MySpace
Seed widgets on fan sites
Track generational leads (people who got it from someone else) as well as people who got it from the source
Use other channels to plug your widget
Keep content fresh or your widget will be removed. It takes up real estate.