title: following the maxims with mini web servers
date: 2014/12/15
tags: [ideas]
author: Jez Nicholson

​​Thinking about the DMGI Maxim of "HTTP RESTful API's (using JSON) will serve all data and core transactions - the same api's will serve internal application requirements and external partners" I've been looking for a tiny C# web server to add to our production 'robots'. Each robot would then have some standard api objects like logs, jobs, and report counts that could be queried on-the-fly.

​Internally, we use a lot of XML. In my hobby project I am now moving towards 'everything in GeoJson' whenever possible. This works nicely because geo things can be hooked into maps at any time really easily.

Project Katana http://www.asp.net/aspnet/overview/owin-and-katana/an-overview-of-project-katana​ looks like a good candidate.

https://github.com/unosquare/embedio​ might have worked, but I would prefer a more mainstream development.

and some people have implemented simple REST http://weblogs.asp.net/fredriknormen/creating-a-simple-rest-like-service-with-owin-open-web-server-interface

​There doesn't appear to be native JSON parsing, but Json.NET looks viable http://json.codeplex.com/​