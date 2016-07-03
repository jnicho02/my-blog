---
title: Revamped my blog to Boostrap 4 + github pages
date: 2016/02/15
tags: [code]
author: Jez Nicholson
---
I revamped my blog over the weekend to use Middleman and Bootstrap 4. Version 4 isn't a Production release, but hey, what could possibly go wrong?! I needed to learn and there isn't much point learning a soon-to-be-superceded version.

I've been wanting to combine the power of a CMS with the ease of programming of a Ruby On Rails app. The answer may be a system called Middleman. Blog entries are written in Markdown format then compiled via editable code templates to static html. This means that there is no special hosting required. Any pages can be included as 'erb' (Embedded RuBy) template scripting code to do more complicated stuff.

It is far from finished but 100 times more attractive than my previous version.

The major addition in Bootstrap 4 is Cards. A card is a container in itself and could be used to display an instance of an object (eg a blog post, a user record). These can then be put into a screen container to lay them out in columns say, or 'flowing columns' where each card doesn't have a fixed height.

This handles unknown numbers of things better than table-rows-columns. To me, it is much more like a programmable interface, ie display * from blogposts where tag='ux'
