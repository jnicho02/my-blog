---
title: dom4j makes xslt a breeze
date: 2007/07/30
tags: [code]
author: Jez Nicholson
---
If you are writing an XML->XSLT transformation, I advise playing with dom4j for a bit to find out how to write XPath statements the painless way.

In my experience, XML->XSLT transformations hold up great initial promise and deliver quick results, but as time goes on it gets more complicated and harder to programme. It is easy enough to take a chunk of incoming XML and pass it through XSLT to restructure it. Then you get some more complicated problems, and it becomes time-consuming to use trial-and-error poking around.

This is where dom4j can help. It is fab at doing XPath and allows you to experiment on small chunks of XML in memory rather than having to run a complete transformation every time. The Quick Start has a few examples of this. You could even decide to do everything within dom4j itself and not have individual stylesheets.