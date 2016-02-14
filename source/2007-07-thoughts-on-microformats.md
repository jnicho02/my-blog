---
title: Thoughts on microformats
date: 2007/07/06
tags: [ideas]
author: Jez Nicholson
---
I've been thinking a bit about microformats. My first thought was that they are an abonimation, a Frankenstein's monster hacked out of html, but now I am seeing their worth. As an extension of user experience they are excellent for common web objects like 'things that have dates' and 'people' (aka hCal and hCard). The new microformat features of FireFox enable you to list the events and people on a web page and export them to Outlook/Google Calendar/etc. For a human user this is very useful. For a machine it is not very efficient and I would much prefer to see an accompanying feed: e.g. for a holiday calendar I think that you need an iCal feed for readers (like Sunbird/Google Calendar) and markup the html as microformats for users to pick and choose individual events to transfer to a calendar. What you don't do, is generate the iCal feed by parsing the whole html page. However, what if you page was not generated from a database? Then you would be duplicating data.

Microformats may be a better solution than meta tags. I am keen on geourl, but a meta tag does limit the page to a single location, whereas the page often contains multiple locations.

My major worry for microformats is that they try to expand into other schemas. New microformat schemas are just a standards argument like any involved with deciding an XMLSchema, apart from the fact that the agreed standard schema is not machine readable and a developer has to look at it manually on a web site. If you are trying to provide data that is going to be machine processed then pass it as XML with an XMLSchema.