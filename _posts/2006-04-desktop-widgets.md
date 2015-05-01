title: what is the 'best' way to build a desktop widget?
date: 2006/04/21
tags: [ideas]
author: Jez Nicholson
alias: /desktop-widgets

Latest project requires a desktop widget to automatically update itself and display the number and status of bookings, e.g. some cute pictures of planes that fill up to show bookings for the week, but what is the 'best' way to do this?

First off, what does 'best' mean in this situation? Well it needs to be:

* highly graphical and groovy,
* easily updatable to new versions,
* not a resource hog,
* easy to install,
* not have too many platform-specific requirements that cause loads of support calls.
...some other stuff I haven't thought of yet...

##Yahoo Widgets
My first thought was of Yahoo Widgets (used to be Konfabulator). The Yahoo Weather widget sits on my desktop and looks really beautiful and is just the sort of thing we want to produce.


You can create a widget direct from Photoshop files, so slick graphics are easily possible. It can do GET and POST calls, so can be made more secure than an RSS reader. Dave tells me that the software can be a little bit buggy plus it can be a bit of a resource hog, but i've been running it for a few week now and it hasn't given me any trouble. Maybe Dave was using it a while ago? The things that might put me off are that you need to install and run the Yahoo Widget Engine in the background and this might put some people off. It's a new tech for me so is untested as yet, but that doesn't normally put me off.

Comments from Loosely Coupled about the potential of Yahoo Widgets

##Flash/Flex
Second thought was of Flash/Flex. Slick graphics are possible and there are plenty of developers out there, but am not sure whether you could program an always-on desktop widget with it?

##OpenLaszlo
Then there's OpenLaszlo, but similar to Flash/Flex

##Swing
I could just fall back to my old favourite Java Swing, but that might just be a case of having a hammer and seeing every problem as a nail. But, I do have plenty of experience of it so could cope with any problems that are thrown up. I can't say that any of the GUIs i've worked on have been works of art, but I know that groovy interfaces are possible.

##Help!
What to do....maybe someone can suggest other technologies or give some advice?....or maybe not, 155 reads so far and zero comments...