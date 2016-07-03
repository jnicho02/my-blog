---
title: Experimenting with RoR and not writing "neato ajax driven thingies" too soon
date: 2007/11/20
tags: [ruby]
author: Jez Nicholson
---
I believe that a good Developer should be able to code in more than one language so that we can: use the right tool for the right job; not be tied down to a single approach because when you've got a hammer everything looks like a nail; experience different approaches. Anyway, enough of the dull metaphors! The result is that i've asked Tom and Alex to play around with RubyOnRails and Grails. I'm keen on finding a tool to rapidly develop webapp prototypes and also to broaden my thinking on development approaches.

So far, we found these links useful:

* Uber basic beginner guide
* Model/View/Control description
* Guide to the auto built stuff
* The poignant ruby guide with silly cartoons and examples (can make the reading a little less tedious)

Alex found http://glu.ttono.us/ and particularly the article Things You Shouldn't Be Doing In Rails. I agree with Tom that the quote:

"Stop trying to write neato ajax driven thingies before you understand how to write it properly without ajax. In fact, write the non-ajax version first. Always. It means that you'll have a place to fallback to if the client doesn?t support javascript. It will also keep you from doing things like writing a separate action for the ajax and non ajax version of a form."
was sensible. Although I'm loath to do so because it might add fuel to the fire that is 'The Cult of Keith' I can't go by without mentioning Jeremy Keith's Bulletproof Ajax as the idea of graceful degradation of ajax code is important for a technique not getting spoilt through poor implementation + it'll stop Dave from telling me I should have mentioned it ;) (hi Dave!).