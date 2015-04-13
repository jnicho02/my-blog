title: RSS feed polling frequency and 304 Not modified
date: 2005/08/26 21:00:00 -0700
tags: [code]
author: Jez Nicholson
alias: /rss-feed-polling

I've just been doing some research into my plans on integrating news and information into a Swing client application via RSS (and/or Atom). It seems to me that rather than expecting our users to continually check the web site for news items we can just poll a feed from within the app. The main impetus was the ability to send system messages as the client does not maintain state on the server.

There is talk about RSS readers bandwidth hogging. Common consensus is that a poll frequency of 1 hour is the most frequent that should be used, but if I want to publish service announcements I would want it to appear fairly quickly so would poll this feed more often, which would be okay as after all it would be our users polling our web server, but I don't want to overload it unneccessarily. A comment mentioned the http 304 Not modified response and reminded me that web browsers cache pages.

So, note to self: when selecting an Java RSS API check that it uses HttpURLConnection or similar (org.apache.commons.httpclient?) to utilise 304 Not modified. This way it doesn't have to download the whole feed every time it polls