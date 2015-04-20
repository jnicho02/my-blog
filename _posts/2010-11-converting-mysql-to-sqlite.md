title: converting MySql data to sqlite3
date: 2010/12/11
tags: [code]
author: Jez Nicholson
alias: /

I was just trying to switch a Rails app over to mysql and had a bad time with the mysql gem. In the end I decided to get the data into sqlite3 instead. It wasn't too hard. I loaded the sql dump that I had been given into mysql then dumped it out again in a sqlite-friendly format with:

    mysqldump openplaques -u root -p --skip-add-drop-table --skip-extended-insert --no-create-info --skip-add-locks > sqlite3_friendly.sql

sqlite expects apostrophes in inserts to be doubled '' rather tahn slashed, so I did a replace in a text editor. Maybe this could be set as a mysqldump param, but I couldn't find it.

Then it's a case of going into sqlite and

    .read sqlite3_friendly.sql

( Dec 11 2010, 01:29:23 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20100705 Monday July 05, 2010
"the tyranny of the menu" vs "Game-centred UX"
One of the things i've noticed about screen design in games is what I call "the tyranny of the menu". When you look at the flows between screens (for example on iphone Guitar Hero UX) you soon notice that it is arranged hierarchically, i.e. things that are alike have been grouped into menu items. Where there are too many items (more than 5?) then they have a sub-group screen so that making choices lets the user drill-down to the thing that they want. An example of this is high-scores - GH shows leaderboards in many different combinations so it could get confusing, but drilling down simplifies the process.

All well and good if the found item is the major thing...but it isn't, the game is. All of these screens are really just the supporting act to the main event, the game. Therefore I say that there should be a different sort of design process going on, not just grouping. All actions should flow towards playing the game. E.g. when you look at a leaderboard of scores by track then the user is actually filtering the track list, so give them a chance to play on a track.

What shall we call this then? "Game-centred UX"?

( Jul 05 2010, 08:52:01 AM BST ) Permalink Comments [0] 


 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
time for a new name
So, i've been blogging here on-and-off since August 2005 as 'The Jezblog' and I got to thinking that maybe I should go for it a bit more professionally...like, get a url and a design and things like that. I'm not going to go on about plans, etc. as it's embarrassing when you don't end up having the time to do them.

Anyways, seeing as I ramble about games and technology the new name is "It's All In The Game" which is from a song by Tommy Edwards...

 ( Jun 20 2010, 06:36:19 PM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20100312 Friday March 12, 2010
Create “transparent” technologies So, here is my my first blog post for Urgent Evoke, a new Social Innovation 'game'. The Innovation In Africa Tips post had a number of good points, some of which are relevant to all good design for the future and not just in Africa. The one that stood out for me is Create “transparent” technologies as technology is my thing. My Physics teacher used to say "Physics is simple, if you're finding it complicated then you are doing it wrong". My Design teacher used to tell me, "don't just make it, make it beautiful" and I see that the beauty in good technology is when it does something great whilst appearing simple.

As to blogging on urgentevoke.com, wouldn't it have been better for me to write this on my own blog out there on the internet so that the word will spread? It isn't quite beautiful, but it is simple and achieves a higher goal than just getting me to understand. ( Mar 12 2010, 08:45:14 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090928 Monday September 28, 2009
Over The Air 2009
I went to the Over The Air 2009 conference on Friday/Saturday, which was about mobile development. My highlights were:

lots of interest in Google Android development.
Augmented Reality (AR) was very big... e.g. superimposing information on the view seen through the camera a la http://www.wikitude.org/ and mentions of things similar to invizimals (has already been used to market Transformers http://www.youtube.com/watch?v=pzB4mIPdm9k)
lots of stuff about widget platforms that can run stuff on any phone
Paul Coulton gave a talk about mobile gaming. Stressed the difference between play (rule-based) and playfulness (loose rules, made-up play) and that mobile was ideally suited for the latter, i.e. a shoot-em-up would be less effective than a social game that gave room for the player to add imagination or their own rules.
Animatics for prototype: I saw an interesting talk by Bryan Rieger about a simple prototyping tool that they had built which used images and flows between states to make a simple working model. I think that this would be much more useful for simple game design than wireframes are.
Inoue Makoto's Friend Hangman http://friendhangman.com/ was my favourite app. Guess the Twitter name of someone using the conference hashtag, after all, they should be your friend by now ;) After a couple of fails it gives you one of their tweets as a clue, then half of their profile photo.
( Sep 28 2009, 11:31:55 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090812 Wednesday August 12, 2009
Elonex iGame low-cost console
The Sunday Times carried an article about the Elonex iGame this week. According to the article the mini-console with a Wii-like controller and docking station for an iPhone will retail for £80 and be available in HMV this week. The igamefamily.com web site appears to be a holding page at the moment (12th Aug 09) and I can't find much other mention on the interweb about it. There are six mini-games available in memory at launch, but apparently Elonex are banking on 3rd party developers to write new titles. Not sure that this is a good way to market a new console.

Elonex iGame article

( Aug 12 2009, 04:45:25 PM BST ) Permalink Comments [2] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090802 Sunday August 02, 2009
Monetisation of content
I've come across two examples of monetisation of content recently through small chunks of content being sold for a micropayment. I wonder whether the business models are effective?

The first is GroovyMag, a magazine for groovy and grails developers that is published monthly as a pdf priced at $4.99. There has been discussion about a print-on-demand version. I guess that I support the idea of people earning money for writing professional, up-to-the-minute technical articles as I would quite like to do that myself, but I can't help thinking that I used to get all this for free.

The second is a Kindle version of an article about Using FlexBuilder for Flash Development. The 'Kindle version' says that it contains extra updated material and retails for $1.49.

( Aug 02 2009, 03:30:33 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090728 Tuesday July 28, 2009
xslt replace-text-multi function
I just wrote an xslt replace-text function that replaces multiple words in one go. Looking on the internet, this is something that people seem to be searching for but not finding, so maybe this page will become popular.

So, the first part is a Jeni Tennison snippet for replace-text:

<xsl:template name='replace-text'>
  <xsl:param name='text'/>
  <xsl:param name='replace'/>
  <xsl:param name='by'/>
  <xsl:choose>
    <xsl:when test='contains($text, $replace)'>
      <xsl:value-of select='substring-before($text, $replace)'/>
      <xsl:value-of select='$by' disable-output-escaping='yes'/>
      <xsl:call-template name='replace-text'>
        <xsl:with-param name='text' select='substring-after($text, $replace)'/>
        <xsl:with-param name='replace' select='$replace'/>
        <xsl:with-param name='by' select='$by'/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select='$text'/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
Call this with something like:

<xsl:call-template name="replace-text">
  <xsl:with-param name="text" select="//name"/>
  <xsl:with-param name="replace" select="'Jeremy'"/>
  <xsl:with-param name="by" select="'Jez'"/>
</xsl:call-template>

This is fine until you want to do a number of replaces on the same text, for example 'Jez' for 'Jeremy, 'Bob' for 'Robert', etc. I have this in real-life because I want to replace the name of a month in Dutch for the English spelling. My solution is to tokenise the 'replace' and 'by' strings then descend into the input string recursively:

<xsl:template name="replace-text-multi">
  <xsl:param name="text"/>
  <xsl:param name="replaces"/>
  <xsl:param name="bys"/>
  <xsl:param name="delim"/>
  <xsl:choose>
    <xsl:when test="contains($replaces, $delim)">
      <xsl:variable name="textSoFar">
        <xsl:call-template name="replace-text-multi">
          <xsl:with-param name="text" select="$text"/>
          <xsl:with-param name="replaces" select="substring-after($replaces, $delim)"/>
          <xsl:with-param name="bys" select="substring-after($bys, $delim)"/>
          <xsl:with-param name="delim" select="$delim"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:call-template name="replace-text">
        <xsl:with-param name="text" select="$textSoFar"/>
        <xsl:with-param name="replace" select="substring-before($replaces, $delim)"/>
        <xsl:with-param name="by" select="substring-before($bys, $delim)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="replace-text">
        <xsl:with-param name="text" select="$text"/>
        <xsl:with-param name="replace" select="$replaces"/>
        <xsl:with-param name="by" select="$bys"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
Call this by providing a list of 'replaces' and 'bys'. For example, I have a date field in Dutch that I want to replace any month for a month in English:

<xsl:call-template name="replace-text-multi">
  <xsl:with-param name="text" select="//rapportgegevens/rapport_datum"/>
  <xsl:with-param name="replaces" select="'januari februari maart april mei juni juli augustus september oktober november december'"/>
  <xsl:with-param name="bys" select="'January February March April May June July August September October November December'"/>
  <xsl:with-param name="delim" select="' '"/>
</xsl:call-template>
A word of warning, remember that those 'replaces' and 'bys' parameters are strings so they will need apostrophes around them. I got stuck on that one for a short while.

( Jul 28 2009, 03:27:04 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090720 Monday July 20, 2009
we (openplaques.org) now have an official Flickr machinetag
It's amazing what you can get if you show a bit of interest. Simon Harriyott had spoken with the guys at Flickr about machinetags in connection with our http://openplaques.org/ project and now we have an official Flickr machinetag. Read about it on the Flickr Dev blog.

What this means is that if any photos of plaques are tagged with openplaques:id=243 then we can pull metadata like the geographical position (if it's been placed on a Flickr map) and now a little link back to the openplaques.org site will be displayed.

Here's an example Flickr photo....


Here's a closeup of the machinetag link...

( Jul 20 2009, 12:29:34 PM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
"Communication Technology and Structures in Scrum Driven Projects" thesis
I am very proud to have been one of the subjects for Christoph Johann Szczecina's Masters thesis entitled "Communication Technology and Structures in Scrum Driven Projects" which has now been published. Available at http://www.szczecina.org/resources the study looks at the usage of communication and collaborative software in Scrum-driven software development teams. Christoph has a good writing style making his thesis easy to read, so I recommend that you go and have a peruse. A certain other Brighton-based company is also featured, but I won't give away their name unless they want to do it themselves.

Christoph is from the Norwegian University of Science and Technology based in Trondheim. He found me through my various Scrum/Agile photos on Flickr and some blog posts here. Another great example of how the interwebs has brought people closer together.

I agree with the conclusions of the study in that the best Scrum software aids area currently source control, IM, Skype, and Outlook Calendar; also that the usage requirements are dependent on team size and physical (co)location; and that not quite enough documentation and planning is created.

My personal comment to Scrum teams would be that if anything appears to be missing from your output (e.g. doing enough testing, writing enough documentation, publicising your work widely enough) then adapt the process so that it is a natural outcome of your work. In this way it will not feel like a chore. E.g. we found that proper testing was being left until the end of the sprint, risking overrun if something bad was discovered. So, we changed the process so that a Developer marks a story with a square to indicate 'finished coding and written an automated test' in order for another Developer to check that it does indeed work, at which point it can be marked as 'done' and the affect the burndown chart. The results were:

testing was checked as soon as possible because otherwise the burndown chart looked bad
mistakes were caught early and could be remedied without adversely affecting the sprint
knowledge of new features was shared between Devs
tests were written better as Devs knew that one of their peers would be running it
testing became a natural part of the process and not a chore to be performed in retrospect
( Jul 20 2009, 09:28:53 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090313 Friday March 13, 2009
MSc gps games...and Universities working with business
Yesterday afternoon I went up to Sussex University to assist in reviewing Msc students' game design projects. I accompanied Richard Vahrman from Locomatrix as the University had partnered with his company for the project, which was heartening in itself.

Universities Partnering with Local Business
I believe that the Universities in Brighton and Hove have so far done a poor job of working with local New Media companies. They have the classic 'science park' approach where low-cost offices are offered as an incubator. However, Sussex Uni is a bit too far out of town for this action to make this a bridge between business (town) and University (campus). Some of the companies there seem to have been round for quite a while (which in itself does indicate some success), so it's 'incubator' credentials may be questionable.

An Example of Where It Works
This project was a great example of how it can work and work well. The students were tasked with designing a game based around the Locomatrix, a gps game platform built by Future Platforms for a Brighton-based business. They could build simple prototypes, but the focus was on designing a game rather than building it. I was very impressed by the projects and a large number of them had thought of an original angle. Hilights for me were:

A Pokemon-style trading game - which introduced an offline element and collectability to gameplay
A map-based territory capture game
The presentation video for the territory capture game which synched with a physical handset to demonstrate the UI
The cattle stampede game
Global Pong (the game, not the smell)
Next Steps
Some of the games are being developed further and I may be involved with prototyping them on the Locomatrix Platform. Also, we have 'Bogfest', a Real-Life Gaming event coming up as part of the Brighton Festival Fringe, where we could play some of the games as a simulation to see how they play out.

( Mar 13 2009, 12:02:58 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
"The Best Software Writing 1 - Selected and Introduced by Joel Spolsky"
I've finished reading "The Best Software Writing 1 - Selected and Introduced by Joel Spolsky" and firmly believe that it should be on every Developer's bookshelf. Hilights for me were:

An end to the 'style wars'
Google Search UI as designed by Micrsoft
An EA Widow's exposure of dodgy working practices
What makes a 'Great Hacker'
How Starbucks serves coffee in an asynchronous manner
Agile team compensation
Clay Shirky's writings on why 'A Group Is Its Own Worst Enemy'
About Edward R. Tufte's essay "The Cognitive Style of Powerpoint" and how it forces linear/hierarchical thinking
The cartoon foxes from the Poignant Guide to Ruby
It also made me think about...

Unlimited Book Budget
Something that I have believed in for a long time is that companies should encourage Developers to buy and read as many textbooks as they like. Compared to sending someone on a training course the cost is minimal, but the benefits are huge. Most Devs that I know are bored by courses which regurgitate a manual at them, don't like the structure of taught courses (run or attend an All Day Coding Dojos instead!), and feel that it is a waste of money. I might attend a course about something really new, like grails, if it were provided by someone very well connected with the project.

Also, don't limit yourself to books from the Computing section. There are loads of books about how people think, react to the outside world, can be influenced, and got to be here, that could give vital insight into the human condition.

The Computing Section in Brighton and Hove Library
I love the new library, but the Computing Section suxxors. There are loads of old books on Powerpoint v1, Access 2, etc. which make it look like they've raided a second-hand book store or a jumble sale. I realise that language textbooks go out of date fairly quickly, but there a lots of books that don't...like "The Best Software Writing 1 - Selected and Introduced by Joel Spolsky". I think that i'm going to put an Amazon list together and ask the BNM list for their recommendations too. I'd love to be able to approach the library and give them a list of relevant titles to buy, or maybe the Brighton New Media industry could sponsor a title each?

I was thinking about how I might show the booklist on this blog and thought about an interactive bookshelf...which looking back in time was actually my very first web page back in 1992 for an Intranet that I built...now, i'm sure that i've got a CD of it somewhere...

How about you dear reader? Do you have any recommendations for books that any proud Dev should have access to?

( Mar 13 2009, 11:47:20 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090306 Friday March 06, 2009
What is Semiotics? and why do I care?
I've just read 'Introducing Semiotics', a rather nicely formatted book in the 'Introducing...' philosophy series. Now, that might strike you as a strange thing for a Developer to be reading, but far from it. A Developer's job is all (often?) about Human Computer Interaction so I feel that it is vitally important to understand as much about what makes people tick, and about communication. Semiotics is about both of those things

So, first off, i'm not telling you to go out and buy a philosophy textbook. I found this book in the library, so it was 'free'. It is also styled in a graphical novel style that makes it all a lot easier to digest.

What I learnt was:

Semiotics is about how ideas are communicated from one person's head to anothers in the form of language or symbols
How this language is interpreted is based on the habits and assumptions that you have learnt over the years
What you interpret as the world around you is not the world itself, only your interpretation. You might be wrong, or it might not even exist (Baudrillard, The Matrix, et al)
An interpretation could lead to another symbol, which leads to another interpretation, and so on forever...or until a final meaning is ascertained.
There is a lot of this going on in advertising and the cinema (Barthes)
I am a hack. A lot of the subject went right over my head
Two schools of thought grew up almost seperately in the US and in Europe
I had heard a lot of the names involved before, but had never actually read anything by or about them: Barthes, Baudrillard, Derrida, Eco, Lacan
( Mar 06 2009, 12:49:16 PM GMT ) Permalink Comments [2] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090225 Wednesday February 25, 2009
There is more to Tagging than meets the eye
Today, I read "Tagging: People-Powered Metadata for the Social Web" by Gene Smith. I have to admit that before I read it I thought that I knew all that could be known about tags, which is not-a-lot, but I found that I was wrong. At 202 pages it might look to be a bit pricey, but it contains a detailed discussion of a single Social Web feature. If you really want to be advising people to use a particular feature or if you want to be adding it yourself then it is worth knowing the details.



My plan is to work on the Grails acts-as-taggable plugin to add particular features. These being:

Tag Service
Retrieve more complicated data about tags via a Service rather than direct form domain objects

Personal tags
To give users the opportunity to look at their own personal tags we need to store each users taggings and be able to return tags filtered by User

Public/Private tags
The ability to mark specific tags as private so that nobody else can access them

Generating test data
Tags will often follow a power-law curve (i.e. a very few tags will be used a large number of times and it will rapidly tail off so that a large number of tags are each used a few times). It would be great to use something like db-monster to pump in as much test data as we like.

Tags Dashboard
A visual represention of various metrics such as tags per time period, unique tags created this period, popular tags today/yesterday/this week/month/period

Synonym Rings and Authority Files
Define where words have an equivalent meaning, or in the case of Authority files define which is the preferred term.

Facets
This is where tags are grouped into specific areas, which is probably a very thin line between being a tag and being a domain object attribute. It appears that the difference is that attributes are a fixed set of responses where tags are user variable, but i'm not 100% convinced that attributes have to come from a fixed set of responses. The main advantage I can see is that are treated as normal tags, e.g. they appear in tag clouds. Some thought needs to go into how to implement this one.

Clusters
By seeing how many tags co-occur for a particular set of resources, then calculating the probability of tags occurring together we can group the high-probability terms together in clusters. This is implemented well in Flickr.

Tag Clouds
The plugin could provide at minimum the data to construct a tag cloud, but maybe also output the appropriate html snippet.

Linear Scaled Tag Clouds
As the distribution of tags is frequently a power-law curve the tag cloud produced won't be aesthetically pleasing as most words will be small and a few will be large. By scaling the counts returned logarithmically to produce a linear scaling the words will be more evenly distributed between sizes.

Time Periods
By returning tags and counts for a time period it is possible to show hot topics. It also means that the favourite tags can be knocked off their perch. One thing about showing uses existing tags is that it may well encourage consensus. To me, this means neatness as well as the possibility of mediocrity.

Machine Tags
The structure of namespace:key=value has been well used in Flickr, Upcoming and the like. It makes my happy and upset at the same time. whilst it displays emergent functionality, where users create their own features, I also see the major database antipattern "column stuffing" at work. It would be great to implement machine tags in a similar way to facets: they should appear to be tags, but are stored as attributes.

Bulk Updates
Where bulk changes need to be applied they can be put into a queued operation.

Feeds For Everything
One of the big wins from tagging is that of useful data feeds. Grails is great at this anyway, as generally a feed is just a view