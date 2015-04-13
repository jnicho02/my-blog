title: CodingDojo #5
date: 2006/12/12 21:00:00 -0700
tags: [events]
author: Jez Nicholson
alias: /coding-dojo-5

I attended the Brighton CodingDojo Meet 5 last night where Dan, Richard and Dominic did some binary chopping.

Now, mathematically algorithms are 100 miles away from what I normally do, so I was a little scared about this one. As usual, the session through up a number of discussions about the essence of software development....which to me, is the purpose of the CodingDojo....plus the fact that I enjoy musing about stuff.

Agile
I quickly discovered that algorithms weren't particularly suited to rapid, agile development. The code created was pretty rubbish and I certainly wouldn't want to use any of them in real life. The approach seemed to produce long, unreliable code, but now that I think back maybe we just didn't break the task down into smaller sections properly. If so, then it's not Agile's fault, we were just jumping in and trying to code the whole thing in one go.

Just go with the one supplied...
The shortest and most reliable implementation was from the Java API: Arrays.binarySearch. If there is no good reason to go writing your own implementation then stick with the standard one, it has been tested in thousands in cases and is much less likely to contain an error than your code!

4th and 5th implementation gets more creative
The first three implementations were fairly standard, but when it came to the 4th and 5th then I had an opportunity to be creative. Seems like you need a combination of Developers with maths skills and some with creative skills in order to have a full team.

( Dec 12 2006, 10:20:00 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061206 Wednesday December 06, 2006
in which I "big up" The Disco Blog
For me, a new job is often an opportunity to set up a new development environment. I'm a fan of continuous integration and my new team environment is now shaping up well. This morning i've been reading The Disco Blog >> Continuous Integration and found it informative about building and testing, so I thought that i'd give a "big up".....yay Disco Blog!

To me, the point of this continuous integration malarkey is that we have a development environment that frees up the team from worries it will deliver high quality software at a rapid rate and let us concentrate on being creative

( Dec 06 2006, 11:14:00 AM GMT ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061204 Monday December 04, 2006
Tweaking installed open source webapps
I'm a big fan of open source web applications like Mantis, Moodle and Mediawiki (and some not starting with 'M' too). In my experience, when using systems like these within a company you soon find need for minor tweaks. It's always best to stick with the released version as much as possible, but sometimes it is the difference between the product being accepted by users or not. Obviously, if your tweak works then the ideal is to feed it back to the open source project and have it accepted as a patch.

As these are PHP systems (yes, I know that this is a Java blog site, but I use these tools to manage my Java projects, plus I think that PHP people should be encouraged to take up build tools such as Ant even if it is Java-based) it is tempting to just unzip the distribution, install it on the server and maybe check all the files in to source control (+5 for subversion!). But, when it comes round to upgrading the software with the next release it could be a pain to find out which files you tweaked.

I like all my projects to be buildable from scratch via an Ant build, and I treat the installation and upkeep of a bugtracking system exactly the same as a system we are developing in-house. The ultimate aim is that a new developer can check out the project from subversion, run an Ant build and the system will run. I use a cut-down version of the AppFuse build.xml and properties. This includes a lib.properties file that specifies which version of a library is being used.

The final piece of the jigsaw is to set CruiseControl up on the server, that way any developer can configure the app by checking a tweak into subversion. There is no need for anyone to have access to the server at all.

The files
directory structure
lib
svnant-1.1.0-RC2
...unzipped svnant...
lib.properties
mantis-1.0.6.tar.gz
MantisConnect-1.0a5.zip
src
...check in any files you tweak here...
...put the original in first and you'll be able to diff against it...
build.properties (optional)
build.xml
properties.xml
build.xml
<?xml version="1.0" encoding="UTF-8"?>
<project name="Mantis" basedir="." default="deploy">

    <!-- import properties (app settings, classpath, jar file locations) -->
    <import file="properties.xml"/>

    <path id="svnant.classpath">
        <fileset dir="${svnant.dir}" includes="*.jar"/>
    </path>

    <typedef resource="org/tigris/subversion/svnant/svnantlib.xml" classpathref="svnant.classpath" />

    <target name="init" description="defines custom tasks">
        <echo>Create a file ${user.home}\${ant.project.name}-build.properties to override project properties</echo>
        <echo>or a file ${user.home}\build.properties to globally override properties</echo>
    </target>

    <target name="deploy" depends="update">
        <mkdir dir="${build.dir}"/>
        <gunzip src="${mantis.tar.gz}" dest="${build.dir}/mantis.tar"/>
        <untar src="${build.dir}/mantis.tar" dest="${build.dir}"/>
        <move todir="${build.dir}/${webapp.name}">
            <fileset dir="${build.dir}/mantis-${mantis.version}"/>
        </move>
        <unzip src="${mantisconnect.zip}" dest="${build.dir}"/>
        <copy todir="${build.dir}/${webapp.name}/mc">
            <fileset dir="${build.dir}/MantisConnect-${mantisconnect.version}/webservice"/>
        </copy>
        <copy todir="${build.dir}/${webapp.name}">
            <fileset dir="src"/>
        </copy>
        <copy file="metadata/${user.name}-config_inc.php" tofile="${build.dir}/${webapp.name}/config_inc.php"/>
        <copy file="metadata/${user.name}-MantisNotify.exe.config" tofile="${build.dir}/MantisConnect-${mantisconnect.version}/bin/MantisNotify.exe.config" overwrite="true"/>
        <copy file="metadata/${user.name}-MantisFilters.exe.config" tofile="${build.dir}/MantisConnect-${mantisconnect.version}/bin/MantisFilters.exe.config" overwrite="true"/>
        <copy file="metadata/${user.name}-MantisSubmit.exe.config" tofile="${build.dir}/MantisConnect-${mantisconnect.version}/bin/MantisSubmit.exe.config" overwrite="true"/>
    </target>

    <target name="update" depends="init">
        <echo>Updating ${ant.project.name} from subversion</echo>
        <svn>
            <update dir="."/>
        </svn>
    </target>    

    
</project>
properties.xml
<?xml version="1.0" encoding="UTF-8"?>
<project>
    <!-- Load user overrides -->
    <property file="${user.home}/${ant.project.name}-build.properties"/>
    <property file="${user.home}/build.properties"/>
    <property name="config.filename" value="${user.name}.properties"/>
    <property file="config/${config.filename}"/>
    <property file="build.properties"/>
    
    <!-- Directory structure of the project -->
    <property name="build.dir" value="${basedir}/build"/>
    <property name="dist.dir" value="${basedir}/dist"/>
    <property name="test.dir" value="${build.dir}/test"/>
    
    <!-- Library versions and JARs -->
    <property name="lib.dir" location="lib"/>
    <property file="${lib.dir}/lib.properties"/>
</project>
lib.properties
#
# Mantis 
#
mantis.version=1.0.6
mantis.tar.gz=${lib.dir}/mantis-${mantis.version}.tar.gz

#
# MantisConnect 
#
mantisconnect.version=1.0a5
mantisconnect.zip=${lib.dir}/MantisConnect-${mantisconnect.version}.zip

#
# SvnAnt
#
svnant.version=1.1.0-RC2
svnant.dir=${lib.dir}/svnant-${svnant.version}/lib
( Dec 04 2006, 05:48:00 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061130 Thursday November 30, 2006
CodingDojo #4
CodingDojo Meet 4 ran last night and was pretty successful. We'd decided to run this one on a Wednesday to give different people a chance to come, but the experiment seems not to have worked as the numbers were low. I feared that the session wouldn't work with fewer people, but it did. The task for this week was to revisit the game written in Meet 1.

It was good to have Thom Hopper of Future Platforms there. He's the author of the Nabaztag CruiseControl plug-in which I shall be using soon (when John sets up the wireless in our new office). We gave Thom a quick intro and seemed like seasoned Dojo-ers....after only two sessions. Anyway, having someone new to the process was good, plus Thom obviously has an enquiring mind and brought plenty of issues to the surface

File cards
I was in the first pairing and pulled out my secret stash of file cards (which Dominic says was a Good ThingTM) and got down in writing the first couple of things that were core to the game working. I would have liked to have got more down, but even by having two cards decided we were able to start on something. Particularly because people felt like they hadn't done anything until they's got some code down....smells suspiciously like a bad code smell to me.

Staying on plan
The cards become very useful later when I was able to stop the project drifting into new features before the core one had been completed. It is very easy to start adding bits of code that you know (think) that you will need later. But, taking a step back, all that gave us was more unfinished features. By having a physical card with the current goal written on I could literally wave it at the current developer and shout, "stop!".

Cos Joshua Bloch says so
I enjoyed an exchange about reassigning variables with a method. In this case it was to trim a String that was being passed in. This was objected to as poor form, the reply came, "why? says who?" (questioning everything is good....says me) "well....cos Joshua Bloch says so in Effective Java Programming", "okay, next time you see Joshua Bloch can you ask him why then?". Now, I don't know whether the use of good programming form would have been wise because it may have saved us falling into a later trap, but it does make me think that I must have hundreds of little 'good form' habits that I sort of know are right but could I defend them if challenged?

The meaning of success
We moved forward considerably faster than the previous sessions. Whether this was a product of the group being smaller and there being fewer directions, or whether it was because we were all pulling in the same direction, will remain to be seen. There is also the question of the definition of 'success'. Is it 'having a working system by the end of the session' or is it 'learning a lot along the way'? Personally I think that by achieving frequent small victories, i.e. achieving a user story, the developers feel better about what they are doing and more issues are successfully explored and more things are learnt.

Struggled near the end
About 3/4 of the way through and we had done pretty well. The game actually worked but we didn't know what to do next! We'd been so engrossed with achieving the most important goals that we didn't have anything lined up. We had also neglected to keep the tests up-to-date, so this seemed like a good short term goal. By working on tests it became clear that the room map was part of the system and the same thing should be used by the tests and the game itself. This prompted some refactoring and an ugly but practical decision to put some fields public and reference them from the test. When we hit 9pm it worked, and to me that was the goal.

Using Agile
I like the idea of the cards and all the Agile ideas, but i'm not going to insist on them. Hopefully, if they really do work then it'll be obvious that they are useful tools. The CodingDojo is a great opportunity to try out different tools and approaches in a safe environment

( Nov 30 2006, 09:53:00 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061117 Friday November 17, 2006
'new job' notification via LinkedIn
I'm a fan of LinkedIn.com. To many people it may look like a waste of time, or maybe a moneyspinner, but i've paid nothing and found it useful in encouraging me to build contacts with other techies in Brighton + i've been able to ask specialists in e-learning and Pisces XML for information. In fact, I just got my new job through it. I had seen a job advertised on jobserve, but luckily the agent was lazy enough to cut and paste the job description rather than understand the client's needs and rewrite it. Google didn't throw it up, but then I remembered the job section on LinkedIn and found it there.

The approach that they've taken for their interface has influenced my thinking. Little things like the slider gauge that says, "your profile is 90% complete...get another recommendation" are a subtle way to encourage people to use all the features. New features are released without a fanfare because if the design is right then it should 'just work' (one of my other influences is Donald A Norman who says, amongst other things, that design should 'just work' and that if you need instructions then it is designed wrongly) and, like with Google, it is often a pleasure to discover new stuff for yourself.

The only problem i've had with it was the 'new job' notification. There is a drop-down shortcut for sending a message. Normally this takes you to another screen where you can compose a message. I clicked on this to send my contacts a notification, but no new screen appeared and I got no feedback whether a message had been sent or not. I've asked a couple of people whether they got an email and they said "no, but I might have email notifications turned off". This isn't too cool.

If it were my system, the only change I would make is the ability to discriminate between a 'contact' and a 'friend'. Some people abuse the system by collecting as many links as possible. I normally turn them down, but maybe I should be able to add them as a loose link until I know them better.

( Nov 17 2006, 08:36:03 AM GMT ) Permalink 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061113 Monday November 13, 2006
ant..maven..raven...what build tool to go for?
I've got on fairly well with Ant in the past. Where there is no build script at all then it is a good win to intoduce a basic Ant script. However, over time, it gets more complicated and many people have trouble doing more complicated stuff as it is XML based. It doesn't help with dependencies either. When it comes to building a heavy-duty webapp i've opted to use AppFuse and let Matt Raible sort out the dependencies for me...i've got enough troubles making an application, I don't want to have to sort out the can of worms of working out which jar works with which.

After playing with Ruby on Rails for a bit I found that I especially liked the whole gem idea. I was looking at the weekly JavaLobby News email, which I find very useful for it's roundup of open source releases, and it had a link to Raven a build tool for Java programs based on Rake and Ruby Gems.

Raven looks great and i'd like to give it a go, but i'm still in the position where I wish it was all 'just done for me'....I know that it sounds lazy...but it's the truth.

( Nov 13 2006, 11:40:37 AM GMT ) Permalink Comments [2] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061031 Tuesday October 31, 2006
Coding Dojo Episode 2
I attending the Brighton Coders (Coding?) Dojo for the second time last night. This week we were attempting to write a text adventure game in Java. The game was to include a number of things like 'a cat', 'a lift (elevator)', and some other things I can't remember as the spec hasn't been updated on the wiki yet. People were less nervous (of looking stupid!) and we nearly managed to create a working piece of software. The meeting threw up a number of areas of thought for me:

Why are we here?
There is no defined purpose to the Dojo and after a discussion it's not that we weren't told, it's just that there doesn't seem to be one. I like the freedom in that. It's an opportunity to just play and consider the results afterward... if you want to.

Working software or quality software?
What is more important, 'do it right' or 'build something that works'? For example, if you make attributes public then you can access them directly. This is widely regarded as poor practice as it doesn't give encapsulation and the opportunity to change the internal workings of a class later without affecting the calling classes, however it takes time to do things properly and maybe stops you from getting a complete working program by the deadline.

I think that I would like to do the quickest way first, get a unit test working, then refactor the class to 'do it right'.

First approach
Last week the first pair just discussed the problem and suggested a few objects. This week the first pair dived straight into creating classes. I know that it sounds wrong, but I preferred this week's approach as it was easy enough to think in classes.

Preparation
We discussed whether you should prepare something beforehand. If you did then you might impose your own thoughts too much on the solution. However, this means that you aren't building on top of the experience of people not in the dojo session. It's funny not using the CodingByGoogle pattern!

I think one of the purposes of the dojo is to learn how to create something quickly in collaboration with others.

You don't have to know Java
Dave said, "sounds interesting but i think i would spend most of my time working out the langauge syntax rather than solving the problem, sounds like everyone who goes knows their java onions!" but it's not true. Half of the Dojo aren't Java experts and it had no effect on their interaction. Another 'purpose' of the Dojo is that you get to learn Java/analysis/collaboration by doing stuff rather than being told how to.

Refer back to the spec
After Daniel and I got part of the system to work we were unsure of what to do next. I think that we were both hoping that the 5 minutes would be up at that point and we'd be able to change places. So, we started doing the first new feature we could think of. Even though the (admittedly rough) spec was on the desk next to the keyboard I didn't see anyone refer back to it and make sure that their efforts were focussed on achieving what it asked for. Everyone was so busy trying to work with the software produced so far that the spec was all but forgotten.

Meeting people
It's great to meet people from the industry who have a similar outlook. Many of us stay hidden in offices around town and never cross paths. I'll be inviting people to connect up with me on LinkedIn and continue to be more sociable!

www.flickr.com
A photo on Flickr	A photo on Flickr	
More Flickr photos tagged with codingdojo
( Oct 31 2006, 09:56:45 AM GMT ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061030 Monday October 30, 2006
my quick n' easy Apache2 set up
Whilst developing or trialling web applications I often find that I have to change my Apache2 setup. I'm starting a new job next Monday so i'm going to write up my quick n' easy way for posterity. I'm sure that someone will tell me that there's a better way, but here goes (BTW: I'm on a Windows box):

modules
In my httpd.conf, at the bottom of section two I include any .conf in my config directory:
#
# Bring in additional module-specific configurations
#
<IfModule mod_ssl.c>
  Include C:/cygwin/etc/httpd/conf/ssl.conf
</IfModule>

include C:/cygwin/etc/httpd/conf/*.conf

The conf files include these:

php4.conf
ScriptAlias /php/ "C:/Program Files/php-4.4.1-Win32/"

# For PHP 4
Action application/x-httpd-php "/php/php.exe"

# For PHP 4 do something like this:
LoadModule php4_module "C:/php-4.4.1-Win32/sapi/php4apache2.dll"
AddType application/x-httpd-php .php

# configure the path to php.ini
PHPIniDir "C:/Program Files/php-4.4.1-Win32"

# Uncomment one of the following (but not both)
# Use for PHP 4.x:
AddHandler php-script php

AddType text/html php

# PHP Syntax Coloring
# (optional but useful for reading PHP source for debugging):
AddType application/x-httpd-php-source phps
php504.conf
ScriptAlias /php/ "C:/Program Files/php-5.0.4-Win32/"

# For PHP 5
#Action application/x-httpd-php "/php/php-cgi.exe"

AddType application/x-httpd-php .php

LoadModule php5_module "c:/Program Files/php-5.0.4-Win32/php5apache2.dll"

# configure the path to php.ini
PHPIniDir "C:/Program Files/php-5.0.4-Win32"

# Uncomment one of the following (but not both)
AddHandler php5-script php 

AddType text/html php

# PHP Syntax Coloring
# (optional but useful for reading PHP source for debugging):
AddType application/x-httpd-php-source phps
php516.conf
ScriptAlias /php/ "C:/Program Files/php-5.1.6-Win32/"

# For PHP 5
#Action application/x-httpd-php "/php/php-cgi.exe"

AddType application/x-httpd-php .php

LoadModule php5_module "c:/Program Files/php-5.1.6-Win32/php5apache2.dll"

# configure the path to php.ini
PHPIniDir "C:/Program Files/php-5.1.6-Win32"

# Uncomment one of the following (but not both)
AddHandler php5-script php 

AddType text/html php

# PHP Syntax Coloring
# (optional but useful for reading PHP source for debugging):
AddType application/x-httpd-php-source phps
jrun4.conf
LoadModule jrun_module modules/mod_jrun20.so

<IfModule mod_jrun20.c>
  JRunConfig Verbose false
  JRunConfig Apialloc false
  JRunConfig Ssl false
  JRunConfig Ignoresuffixmap false
  JRunConfig Serverstore "C:/JRun4/lib/wsconfig/1/jrunserver.store"
  JRunConfig Bootstrap 127.0.0.1:51000
  AddHandler jrun-handler .jsp .jws
</IfModule>
virtual hosts
then at the bottom of httpd.conf I create a virtual host and pick up any .vhost files:
NameVirtualHost 127.0.0.1
include C:/cygwin/etc/httpd/conf/*.vhost

phpmyadmin270.vhost
<VirtualHost localhost:80>
  ServerName phpmyadmin.badger:80
  DocumentRoot D:/phpMyAdmin-2.7.0-pl1
  CustomLog D:/logs/access_log combined
  ErrorLog D:/logs/error_log
  <IfModule mod_ssl.c>
    SSLEngine off
  </IfModule>
  <Directory D:/phpMyAdmin-2.7.0-pl1>
    <IfModule sapi_apache2.c>
      php_admin_flag engine on
       php_admin_value open_basedir "D:/phpMyAdmin-2.7.0-pl1:D:/tmp"
     </IfModule>
    Options -Includes -ExecCGI
  </Directory>
</VirtualHost>
hosts
Final thing is to set up a memorable domain name for your local site. Add a line to your C:/WINDOWS/system32/drivers/etc/hosts file to direct http calls to that domain to your localhost (127.0.0.1) so that Apache can receive it:
127.0.0.1 localhost
127.0.0.1 badger
127.0.0.1 mantis.badger
127.0.0.1 moodle144.badger
127.0.0.1 moodle153.badger
127.0.0.1 moodle163.badger
127.0.0.1 phpmyadmin.badger
127.0.0.1 bb.badger

I then change the file extension for any that I don't want: 

( Oct 30 2006, 05:15:38 PM GMT ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061027 Friday October 27, 2006
the key to success for e-commerce: combining the virtual and the physical?
One of my pet theories is that to be successful in e-commerce you must combine the virtual and the physical, i.e. there should be a physical/meatspace element to your product. In the long run, people seem more prepared to pay for physical goods whereas the price of pure software degrades. Combine the two and you have low running costs with sustained prices. If your product is software only then you will probably require continual innovation to sustain the price, you may also be more susceptible to competitors replicating your offering.

Example #1: Threadless.com
Threadless sell t-shirts online. Which isn't very hard to copy. However, they enable designers to upload their images to be put on the shirts and sold, and give them a fee. So, they don't have to employ designers to physically sit in their offices and design Tees. Plus, the community weeds out the wheat from the chaff. This is still fairly copyable, but they've built up enough of a reputation and community to hold off much of the competition.

Example #2: Nabaztag
This wireless rabbit sits on your desk and responds to events such as email receipts. Money can be made up front with the sale of the hardware and then over time through the sale of services. It's hard for a competitor to come along and steal your customer by selling them their rabbit/llama/whatever-it-is.

( Oct 27 2006, 10:40:26 AM BST ) Permalink Comments [2] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061023 Monday October 23, 2006
monetise gaming at your peril
Was just reading an article about alleged 'spyware' in the new Battlefield 2142 from EA Games. It looks like EA are looking for different ways to monetise gaming, in this case by serving up different ads during the game depending on your habits within the game. While this may be a reasonable thing to do, it is always risky. Get anything wrong, or let the information leak out to the public and there will be an outcry. In a previous life I worked on Direct Marketing systems for cruise holidays and a certain multi-billion software giant and day-to-day you have to face moral questions about what is fair and what is not. In the long run in-game advertising may continue to fund game development and everyone wins, or it may just spoil a parallel universe where there are no commercial pressures e.g. a battlefield in the year 2142.

Let's face facts, games companies are like any others (in fact i'm going to start work at one in two weeks time!) and they have to make money. They are going to need to find different ways to make it in the future. What would you suggest?

( Oct 23 2006, 02:45:18 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061018 Wednesday October 18, 2006
Brighton Coders' Dojo
Here are my experiences of the Brighton Coders' Dojo on Monday night. Concept: 12 people meet and work on a specified problem for 2 hours, pair programming is used (a keyboard 'driver' and a 'navigator'), after 5 minutes one of the pair is swapped out. The screen is attached to a projector so that everyone could see. All of the developers are aware of progress, but cannot assist if they think that the current pair are going wrong (unless they don't understand, in which case they can ask for clarification).

The problem domain for this session was money handling in a supermarket. My initial expectation was that I would learn about the complexities of the problem domain but it soon turned out that people were finding things out about Java, Eclipse and Agile/Extreme Programming. My primary interest is in how people work together in order to make teams more cohesive and developers less isolated.

Points that came up were:

you can get started quickly by listing possible objects and attributes in a text file.
using encapsulation lets you create a few objects quickly as you can can get the workings right later on
how to store decimal values
how you use JUnit
test-first programming
letting the test deliberately fail before you write it correctly
Object equality
Java 1.5 generics
why make Objects instead of just accepting primitives
static variables to make code more readable/prevent incorrect values
extending classes to override methods
how one person's approach can affect the direction of the development
The final point was what it all boiled down to for me. What you've got is an ultra short development cycle with no structure and lots of disruption. If one pair adopts a strong enough approach (in this case 'test-first programming') it can force the development in that direction, rightly or wrongly. I realised that no approach could be labelled 'right' or 'wrong', just useful at the moment. However, the approach may obscure the problem, i.e. people spend all their time learning about test-first programming and none in modelling money in supermarkets.

I think that I had the best suggestion: let's just build a Poundshop (where every item costs one pound)

www.flickr.com
A photo on Flickr	A photo on Flickr	
More Flickr photos tagged with codingdojo
( Oct 18 2006, 10:25:08 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061017 Tuesday October 17, 2006
the spelling correction test
I'm not sure whether this makes me a pedant, but whenever I see any mistake on a website (e.g. a spelling mistake) then I email the site to tell them. As far as i'm concerned I have zero tolerance to errors, and a typo makes people worry that you might have made errors in the lovely piece of software/tutorial/site that you are trying to sell. Saying this, I expect that this blog is full of typos...

How the site respond to the bug report also shows you what sort of service you might expect from them if you took them on as a supplier. So, full marks to Kevin Yank at An Introduction to AJAX overnight.

I also strongly encourage you to send a complaint to any site that doesn't work properly in FireFox. The response will be "there's no demand" until enough people complain.

( Oct 17 2006, 12:00:00 PM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20061016 Monday October 16, 2006
webapp presentation layer = "None of the above"
When choosing a presentation layer one of the questions you should always ask yourself is "should I be doing this in the first place?". I've just been reading Valery&Galina's Enterprise Web Application. Presentation Layer. Requirements.Take 2 and noted Daniel Spiewak's comments on whether a desktop app should be shoehorned into a web browser. I see Daniel's point and think that it's always important to use the right tool for the job.

Having built an application with a thick-client communicating over the web (Acce-lerator) and more recently a full browser-based app (BookingBooster) I have found increasing customer expectation to be able to do it all in a web browser. I see this as a sea-change in attitude which we in the IT world must not let slip through our fingers by producing poor systems. The idea of Application Service Provider services has been around for yonks, but it is only now that businesses seem happy to sign up to salesforce.com and the likes without questioning whether the service will be uninterupted, to what point will their data be restored in the event of a database crash? what if their internet connection goes down?. (amusingly JRoller went down when I tried to post this blog entry...but I created it in bloggar, a desktop application, and therefore didn't lose my entry and was able to continue working)

There is a point to desktop applications. They can show multiple views of the same data, handle state, have multiple windows, enable drag and drop, use objects, etc. The web introduces different ways of accessing data and we shouldn't lose sight of that and force it to look and act exactly the same as a desktop app, rather we should keep the flexibility of the web and add application-like functionality. Just as the document/desktop metaphor fundementally affected the way that desktop apps worked and magazine publishing affected the web we should be careful not to turn the web into document/desktop...it should be it's own thing.

( Oct 16 2006, 11:01:01 AM BST ) Permalink 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060726 Wednesday July 26, 2006
creating indexes in Hibernate with XDoclet tags
Perhaps i've been a little slow, but up to now I hadn't realised how you create indexes via Hibernate XDoclet tags. I suppose it's because most of the work i've been doing is development from scratch that i'm so busy getting the properties and relationships right that I haven't focussed on tuning. I subscribe to the 'build first, tune later' approach as "Premature optimization is the root of all evil.". Generally, database servers are built to make the obvious/logical queries run quickly and a cunning plan at twisting the table structure to run quickly will miss out on these. Now I let Hibernate dictate much of my database table structures....I wonder how efficient the indexing is?

Where @hibernate.property name="bingoWings" column="bingo_wings" can be used to control the actual name used for the database column @hibernate.column gives some extra control over that database column, so that @hibernate.column name="bingo_wings index="idx_bingo_wings" will create an index on the bingo_wings column. Check the XDoclet @hibernate Tag Reference for more details or Thomas Gaudin's Hibernate mapping with xdoclet tutorial.

As to choosing which things to index, then it is a subtle art. Some database servers include features to explain the query plan used, but make sure that you've loaded a lot of realistic test data into the system first otherwise the results will be false.

( Jul 26 2006, 08:35:00 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060725 Tuesday July 25, 2006
procrastination, Agile...and a bit of footy for luck
I've been reading an anti-procrastination book called The Now Habit and see that some of the advice is relevant to Agile development. I don't think that I have the worst symptoms of procrastination: inability to start or finish a task through fear of failure. But, a lot of projects in my personal life seem to take forever and I feel that a number of tasks at work take too long.

The procrastination log
I carried out the first activity last week, it was to keep a log for a week of how I spent my time. When I noticed that I was avoiding a particular task (mostly those that involve phoning someone) I noted that on my log. Looking at the sheets now, I can see that on some days I was highly focussed on one task and on others I was flitting around between lots of different tasks. Both types of work have their place, but I seem to spend whole days on one type of work where perhaps I should be mixing them. One part of time management is to recognise the times of day when you will be effective at each different type of work and schedule it in.

Getting started
Procrastinators are often crippled by the inability to start a task because it seems so huge that they will never be able to finish it. The book's advice is to think of it as a series of small starts. If you can achieve just half an hour of quality work to start a task it chips away at it. In software development we often face a dauntingly huge task of creating a system. even worse is that the task is going to change whilst you are working on it! Agile breaks down the long term goal into smaller steps that meet a clear purpose that is meaningful to the client. What I like about Agile is that we can have a conversation with the client about their priorities and they can then choose the one (and only one!) that is top. We then deliver this as soon as possible then repeat the conversation and see what the top priority is now. I can be a bit deep here and quote, "the longest journey starts with the smallest step". What we are doing is agreeing on which direction to head, taking a step, looking up and checking what the direction is now and stepping again. A procrastinator is so focussed on the far-away destination that they never take any steps.

...and here's the footy
This also fits with my favourite analogy subject, football (soccer). After receiving the ball, many people head off upfield as fast as they can with their head down focussing on the ball. They may have enough skill to dribble round the other team and progress all the way up to the opposition's end, but the defenders are there to prevent proximity to the goal area and the attacker will be pushed to the corner of the pitch with no team mates to pass to. They will probably feel let down by their team because they have clearly been working very hard and have ended up close to the goal but with little chance of actually scoring. But it's scoring the goal that matters, and not the amount of effort. Dribbling involves sharing your focus between the ball and looking up to see where your team mates are. A well-placed pass is often more effective and takes less effort than a long dribbling run. i.e. lots of little efforts followed by a re-assessment of position and direction, perhaps culminating in a change of strategy (a pass) leads to reaching the goal in the fastest time with the minumum effort.