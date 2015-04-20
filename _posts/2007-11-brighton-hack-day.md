title: Fun at Brighton Hack Day
date: 2007/11/20
tags: [events]
author: Jez Nicholson
alias: /fun-at-brighton-hack-day

​​​​Well, as the title says, I had a bit of fun this weekend at the inaugoral Brighton Hack Farm.

The plan was fairly simple: turn up at 10am, spend the day hacking together some code, demo at 5pm. Implementation of the plan was slightly trickier, but ultimately successful.

I went along as part of the Brighton Coding Dojo group. We convened at 10(ish) and decided on a SCRUM-based effort. Thom had brought a box of sensors with him and after a quikc brainstorm I put foward the idea of an Inform text adventure interacting with from the physical world.

The team split into pairs to investigate the different sections of the project and reconvened every 1/2 hour or so. On the whole this worked extremely (no pun intended) well as it meant that we could attack the problem on multiple fronts. The main problem that I had was in finding the right syntax to use in Inform.

Around lunchtime we were joined by Mr Hopper Snr, who after hearing a little about the plan jumped in to story writing for the text adventure. I was focussed on producing a single simplest interaction to prove that the system would work, whereas Simon was interested in the story as a whole (i.e. start with the solution and work backwards). I split this off to be a separate activity and it worked well as it is easy to end up with a really lame text adventure if you focus on getting the mechanism working.

We nearly had an integration problem where an incomplete command would be issued to the game. This was because we didn't force a test.

The eventual demo worked a treat. Thom had adapted the temperature sensor at the last minute to be embedded in the bottom of a cut off Coke can. Hot or cold liquid could be poured into this and be in direct contact with the sensor. This would post a message to a web server which the demo laptop was polling. The java Robot API was then used to write the appropriate command into the Inform game window at the prompt.

www.flickr.com

what is this?
( Nov 20 2007, 12:25:16 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070926 Wednesday September 26, 2007
Twitter builds community
I'm a big fan of Twitter and use it as a fine upstanding example of all things Web2.0. It is a very simple application that only really does one thing, it allows you to post "what are you doing right now" and tells you what your friends have written. At first, it didn't seem that interesting. I used it as a micro-blogging platform...a way to keep an audit trail of thoughts with any accompanying links. I could have used delicious, but I have never really fallen in love with it.

Over time, as my number of contacts increased i found that Twitter is achieving something cool. It is building community. A sizeable number of Brighton (and surrounding) new media types are regular Twitterers, and I feel that I know lots of them to the point where I consider them friends even if i've never physically met them. People regularly meet up for Twunch (Twitter-lunch) arranged on the spur of the moment. It's like a chatroom, but it's not quite, it's more like blogging. I say stuff in Twitter if I can express it in a single line, but I say stuff here in my blog if it's going to take longer to say it. With both I am pleased if I get a response, but I don't really write to get as many responses or hits as possible, I write to get the thought out of my system and down on (virtual) paper. The value of doing this publicly is that some of the comments are really interesting and helpful.

( Sep 26 2007, 04:13:36 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070918 Tuesday September 18, 2007
internationalisation file formats
Was just musing about file formats for i18n and thought the following:

If i18n translations are key-value pairs then XML won’t be the most efficient form. It would probably be better suited to properties files which will be more compact and less costly to parse. This is the approach that Java takes.
I’ve had problems in the past containing chunks of html within an XML tag as they have to be escaped.
In a previous project I used a tool called Popeye http://popeye.sourceforge.net/ to view and edit the translations.
A benefit of XML is that the charset can be clearly stated, as there can be lots of problems with accented characters.
One situation where the translations would want to be in XML is when they are used by xslt as an ‘xml include’ to access the file from within the stylesheet. see http://www.topxml.com/xsltStylesheets/xslt_multilingual.asp
You need to take care which editors are used on the files. It is very easy to save it from an editor and mess up the character encoding. Surprisingly to me, a MSoft product appears to be a stable choice.....Excel. We use scripts to convert XML to csv and back again.
p.s. there's an interesting comment from Joris below.....

( Sep 18 2007, 12:11:39 AM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070802 Thursday August 02, 2007
BrightonCodingDojo #16
I went to the Brighton Coding Dojo last night to do some more Ruby programming. We continued with the Klondike (aka Solitaire, aka Patience) CodeKata.

I think that the group benefitted from having an existing codebase to work on and that this is leading to higher levels of programming emerging. The approach has been to model the individual elements of the game which will then be combined to make the game itself, e.g. Card, Deck, Pile(s), etc.

Test Driven Development
TDD was shown to be very useful when a strange event occurred. When trying to print out the contents of the piles there were 20+ of them rather than 7. We then discovered that the starting conditions of the Game had not been tested and contained an error. This could have been avoided and time saved.

Responsibility
By doing Test Driven Development the classes are tending towards being responsible for their own actions. The tests exercise the class early and avoids the methods drifting off into game-related things, e.g. a Deck of cards is responsible for being 52 cards, 4 suits, etc. but knows nothing about playing Klondike. Conceivably, the Deck could easily be used for a completely different card game without having to be altered.

Dependency Injection
The limits of responsibility start to be challenged when the game starts to be assembled. It is tempting to start adding gameplay methods to domain objects, but remember, each class should only do one thing and that one thing should be obvious from it's name. We have a Game class (that should be renamed to Klondike) and I think that we'll end up with a ComputerPlayer class that does ComputerPlayer.play(game).

( Aug 02 2007, 08:53:16 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070801 Wednesday August 01, 2007
Why use a CMS?
For a recent presentation I gave reasons why you should use a CMS for an information publishing system rather than creating your own from scratch.

Forces
Timeliness
Accuracy
Presentation
Security
Extensibility
Human Resources
Commentary
What are the forces that affect the decision on how you will present information to users?

Timeliness - how long are you prepared to wait between deciding that an article should be published and the user actually seeing it? e.g when publishing a newspaper there is today's news which cannot be delayed, but also feature articles that could appear any time within the next few weeks.

Accuracy - does the content need to be approved by an editorial team, or are individuals empowered to say anything they like? On an intranet it would be a lot freer than a corporate web site.

Presentation - a system should allow for easy templating and reuse of component layouts so that (and here's one of my set-in-stone rules) any screen that can be viewed by an end user must be styled and laid out by a graphic designer. It is not a techies job to manage the presentation, but it is a techies job to make sure that the power is in the hands of the designers, e.g. by creating a tagging system that enables designers to control html contents

Security - if you are creating an easy to use publishing system make sure that you aren't just creating an easy to spam system. Consider security concerns early.

Extensibility - any information publishing system (package or home made) will only solve 80% of the requirements. Success will guarantee that the system needs to be extended and enhanced. Choosing or making an extensible system will future-proof it and also can enable more people to provide enhancements.

Human Resources - in the end, a system is only as good as the people who operate it. Just how many people do you have, what are there skills, where are the bottlenecks? If you create your own system, then there will be a heavy reliance on technical staff. Do you have enough to cope with demand for changes?

Information Publishing System Components
Content (words)
Digital Assets
Page Layout
Site Structure
Code
Commentary
An information publishing system consists of these components in some form or another. The end product is a combination of them all and different systems will put more emphasis on the importance of different components.

Ownership
Balance human resources by putting the components into the right hands

Content & Site Structure = Community
Timeliness. Words matter, they must not be delayed by technical concerns.
Digital Assets & Page Layout = Design
Presentation. Any output seen by an end user must be created by a Graphic Designer.
Code = Web Development
Accuracy, Security, Extensibility
Commentary
The components of a publishing system should be able to be owned by the appropriate group of people. I believe that in creating a system you should be empowering people and1 not restricting them. You don't know what they are going to do with the system yet so should make sure that you are providing tools that are of appropriate power to the right people. There will often be a trade-off with complexity e.g. content editors want to be able to enter raw text quickly and easily whereas designers want full control over what goes where and are prepared to learn tag-based coding systems if it gives them that power.

Why Use a CMS?
There are many ways to solve the problem. All have pros and cons. Static html, file includes, database driven site, multilanguage CMS, separate CMSs, web framework, CMS engine.

Using an available CMS can give flexibility, structure, and security for less effort

However, there are 100's to choose from and you could get tied in to the wrong metaphor, programming language or templating engine

Nail the provision of standard written information and you can extend into the clever stuff

Commentary
Just mention "re-inventing the wheel" to any manager and they will start to reconsider creating their own system from scratch. A CMS system will have solved a lot of the problems you are trying to solve, plus a lot more that you haven't encountered yet. However, any CMS that you select will have it's own quirks and foibles so you will be trading one type of pain for another.

( Aug 01 2007, 09:05:20 AM BST ) Permalink Comments [3] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070730 Monday July 30, 2007
dom4j makes xslt a breeze
If you are writing an XML->XSLT transformation, I advise playing with dom4j for a bit to find out how to write XPath statements the painless way.

In my experience, XML->XSLT transformations hold up great initial promise and deliver quick results, but as time goes on it gets more complicated and harder to programme. It is easy enough to take a chunk of incoming XML and pass it through XSLT to restructure it. Then you get some more complicated problems, and it becomes time-consuming to use trial-and-error poking around.

This is where dom4j can help. It is fab at doing XPath and allows you to experiment on small chunks of XML in memory rather than having to run a complete transformation every time. The Quick Start has a few examples of this. You could even decide to do everything within dom4j itself and not have individual stylesheets.

( Jul 30 2007, 09:43:52 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070725 Wednesday July 25, 2007
my first open source project, oo-writer-lite
I released my first open source project this morning. It is called oo-writer-lite http://code.google.com/p/oo-writer-lite/ and is a lightweight OpenOffice.Org Writer document wrapper.

I have done a fair amount of developing using OpenOffice.Org Writer documents as output format for presenting data. I have extracted this mini Java api which wraps a Writer document and makes the various parts of it easily accessible. You could then do things like change the content via xslt or xml, switch placeholder images for your own, create a document from scratch. All by accessing the underlying files and not needing OO.O itself to be active.

The OO.O project does provide a programming library called UNO. This lets you communicate with the OO.O main engine and remote control it. In my experience I found UNO really painful to use as all the methods are called indirectly and because I wanted to mass produce documents, not just remote control the engine.

( Jul 25 2007, 11:20:40 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070711 Wednesday July 11, 2007
TV Program + web site = intregal
I was watching BBC Children's TV the other day (I was channel hopping, honest!) and saw a program called 'Do Something Different'. It is probably the modern equivalent of 'Why Don't You..'. Anyhoo, the TV program is the front-end for http://www.bbc.co.uk/dsd/ It's a Web 2.0 sort of thing because the program presents ideas posted by kids to the web site and discusses which areas of the country have completed the most new things this week, etc. It's the first time that I have seen a web site that isn't a second thought but is an integral part of the TV program. The interface is quite jazzy (aka garish) too.

( Jul 11 2007, 11:07:00 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070706 Friday July 06, 2007
thoughts on microformats
I've been thinking a bit about microformats. My first thought was that they are an abonimation, a Frankenstein's monster hacked out of html, but now I am seeing their worth. As an extension of user experience they are excellent for common web objects like 'things that have dates' and 'people' (aka hCal and hCard). The new microformat features of FireFox enable you to list the events and people on a web page and export them to Outlook/Google Calendar/etc. For a human user this is very useful. For a machine it is not very efficient and I would much prefer to see an accompanying feed: e.g. for a holiday calendar I think that you need an iCal feed for readers (like Sunbird/Google Calendar) and markup the html as microformats for users to pick and choose individual events to transfer to a calendar. What you don't do, is generate the iCal feed by parsing the whole html page. However, what if you page was not generated from a database? Then you would be duplicating data.

Microformats may be a better solution than meta tags. I am keen on geourl, but a meta tag does limit the page to a single location, whereas the page often contains multiple locations.

My major worry for microformats is that they try to expand into other schemas. New microformat schemas are just a standards argument like any involved with deciding an XMLSchema, apart from the fact that the agreed standard schema is not machine readable and a developer has to look at it manually on a web site. If you are trying to provide data that is going to be machine processed then pass it as XML with an XMLSchema.

( Jul 06 2007, 09:40:00 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070309 Friday March 09, 2007
CodingDojo #10
I attended the second Brighton Coding Dojo to be held using Ruby. It's a lot easier to work out why you are at a Dojo if you don't know the language as it's clear that you are there to experience it in action. Dom has been doing a great job in letting people get on with it but being available to give input on syntax, etc. if they want to ask. If you are currently in the driving seat then you are allowed to do anything you like, including 'ask the audience'. The task this week was a repeat of a previous week's kata, that of parsing a file of weather data and returning the day number which has the smallest range between max and min temperatures. Here are the things I noticed about this week:

testing first encourages more methods
Developing with a test-first approach encourages the developers to make small steps towards the solution rather than trying to solve it in one step. This tends to result in there being more methods in a class, with each method solving a part of the problem. In this case: getDay(), getMax(), getMin(), getSpread(), getMinSpreadDay(). This is a sort of reductionist approach, 'divide-and-conquer' if you will, that works for a large number of problems but maybe misses the 'divine inspiration' of solving a problem in a lateral way.

lots of static
I'm slightly confused about when a method should be created as a static function and when they should be properly object-oriented. Just about all of the methods we produced were functions performed on a String and as such didn't rely on a Line object being created, e.g. getDay(String line) instead of Line line = new Line(String s), line.getDay(). I will investigate further as I suspect that it's more than a style issue and probably an incorrect use of OO

slower or faster?
I had a good conversation with Jack about whether the Agile approach solved the task as a whole slower or faster than developing without it. On a smallish task it seems like overkill to split it into smaller parts, each with a unit test, and it would appear that the problem could have been attacked as a single block. I can see his point, but I would say that this ignores the requirement for proof, i.e. proof that the code does actually work. If this small chunk of code is to be one of the fundamental building blocks of my system then i'd like to be really sure that it works and therefore I will want tests, and if the tests are produced as part of the development process there is no need to revisit the code after completion. Also, if testing is an afterthought it is highly probable that the code is not written in a way that it is easily testable.

( Mar 09 2007, 08:10:54 AM GMT ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070214 Wednesday February 14, 2007
CodingDojo #8 The Ruby Dojo
It's been a week since Brighton CodingDojo Meet 8 and i've been slacking on writing down my opinions. I think that i've caught the blogging bug because it starts to trouble me if i don't put my thoughts down in writing. As soon as they're published then they can stop buzzing round my head.

Intro to Ruby
This session was in Ruby and proved to be very popular. I guess that people are interested in the CodingDojo for learning a new language, whereas I personally am mainly interested in team dynamics and development methodologies. Dom presented a good 'Intro to Ruby for Java Developers' and it didn't matter that some people weren't Java-ites as it was more a compare and contrast. We've been working with Groovy and Grails here for the past week which helped me to grasp the basics of Ruby.

Analysis Paralysis
The main thing that I noticed with this session was instances of 'analysis paralysis'. This may have been because people were new to the CodingDojo concept but it was very obvious. When you only have five minutes to achieve something and you can't picture the problem holistically then maybe it is time to implement one small step and help to understand the problem. e.g. we were working on the sudoku solver again and nobody really new how to solve a sudoku...people were starting to think about loops "step over each cell and if it is empty then see if a number fits" and this should lead you to write the code for the smallest bit rather than the containing loop, in this case write a unit test that picks a cell that you know is empty and should only allow one number then write the code to do it.

My only fear is the opposite of paralysis, which is looking really busy but achieving nothing. But if the activity is constrained by the user story and unit tested to make sure that it is atomic then it may well be a step in the right direction

( Feb 14 2007, 09:00:00 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
"Release It! Design and Deploy Production-Ready Software"
Just seen this book by Michael T. Nygard discussed in the JavaRanch Big Moose Saloon so I thought i'd make a note here to remember to look at it when it is released.

Michael appears to be covering a subject close to my heart. That of making software 'Production-Ready' and manageable in a live Production environment. If putting software live causes headaches then people won't want to, but releasing stuff should be our reason to live. The process needs to be as painless as possible so as to enable Developers to exercise their creative abilities in happiness.

( Feb 14 2007, 08:30:00 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20070125 Thursday January 25, 2007
CodingDojo #7
I've increased my attendance of events in Brighton following my rediscovery of upcoming.org. I believe that upcoming.org has now reached a critical mass of users/events that make it the place to communicate Developer events. I might even kill my BNM Google Calendar that I crowed about previously.

So, anyway, I went to CodingDojo Meet 7 last Monday night after a quick hour of five-a-side footy. This time we were tasked with using Java to solve sudokus. CodingDojo regulars Dom and Dan were there and I met Ollie (hi Ollie!). The session followed an Agile style and prompted a number of interesting discussions including:

Test-first Development
Me getting a bit evangelical to Ollie. A while ago I took on a 'thing' from 43things to Practice religious test-first development for a month and got some really good results (quality code, zero errors, less stress, delivery on time). I think the name scares people as they think that they have to code the entire test for every possible method first, but I call it 'test-during development' as you write the test just before you begin writing a particular method. Yes, it would be nice to specify full interfaces and tests first but if you are doing rapid development then you won't necessarily know what methods you are going to need.

Outsourcing
Where specifying full interfaces and tests first would be very useful is if you were outsourcing all the code development.

Developing the game rules as a means of progressing...
One of the points of the CodingDojo is that you don't need to prepare for it. This raises the question of 'do you need to have in your head an idea of how to solve the problem before you start coding it, or is the act of coding a way of exploring the problem and getting you closer to the solution?'. Quite frankly, I didn't have much of an idea how to write a sudoku solving algorithm. My 'bag' is managing teams to solve problems and not knowing all the answers. In this case, I believe that turning the sudoku problem into code first was leading us closer to being able to write a solver.

How soon to abstract
We had a discussion over what dimensions a sudoku puzzle can be. The standard size is 9-by-9 with 9 mini squares, but larger ones can be constructed. Dan suggested that the value had to be a power. After a while I got to wondering whether the abstraction process was actually helping, because a) we would 99% of the time want a standard size puzzle, b) the spec didn't ask for different sizes, c) time was flowing away and we weren't progressing...or were we? By thinking about the abstraction, maybe we were learning more about the problem.

It would seem that it is a value choice which way you choose to probe the problem. If you are getting bogged down on one approach then maybe it is pragmatic to try another. The previous approach can always be returned to. Sometimes the abstraction is just overcomplicating the problem.

www.flickr.com

what is this?
This is a Flickr badge showing public photos from Flickr tagged with codingDojo. Make your own badge here.
( Jan 25 2007, 01:18:00 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
experimenting with RoR and not writing "neato ajax driven thingies" too soon
I believe that a good Developer should be able to code in more than one language so that we can: use the right tool for the right job; not be tied down to a single approach because when you've got a hammer everything looks like a nail; experience different approaches. Anyway, enough of the dull metaphors! The result is that i've asked Tom and Alex to play around with RubyOnRails and Grails. I'm keen on finding a tool to rapidly develop webapp prototypes and also to broaden my thinking on development approaches.

So far, we found these links useful:

Uber basic beginner guide
Model/View/Control description
Guide to the auto built stuff
The poignant ruby guide with silly cartoons and examples (can make the reading a little less tedious)
Alex found http://glu.ttono.us/ and particularly the article Things You Shouldn't Be Doing In Rails. I agree with Tom that the quote:

"Stop trying to write neato ajax driven thingies before you understand how to write it properly without ajax. In fact, write the non-ajax version first. Always. It means that you'll have a place to fallback to if the client doesn?t support javascript. It will also keep you from doing things like writing a separate action for the ajax and non ajax version of a form."
was sensible. Although I'm loath to do so because it might add fuel to the fire that is 'The Cult of Keith' I can't go by without mentioning Jeremy Keith's Bulletproof Ajax as the idea of graceful degradation of ajax code is important for a technique not getting spoilt through poor implementation + it'll stop Dave from telling me I should have mentioned it ;) (hi Dave!).
( Jan 25 2007, 12:34:00 PM GMT ) Permalink Comments [0] 