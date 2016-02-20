---
title: can you de-implement an interface?
date: 2006/01/24
tags: [ideas]
author: Jez Nicholson
---
Maybe someone will tell me that i'm being really stupid, but is it possible to stop a class from being Serializable?

The reason I ask, is because java.awt.Component implements Serializable which means that all my Swing components are. Eclipse warns me that I haven't set up a static serialVersionUID which I do want to do for my model classes, that I really want to be serializable. So, is it possible to de-implement an interface? or is there an underlying reason that awt Components need to be serializable?

In connection with this thought i've been reading up on serialVersionUID. Here are some resources that might be useful:

* Java Forums: To serialVersionUID or Not To serialVersionUID?
* The Squizlog: Eclipse 3.1, RAD 6.0 and serialVersionUID
* There is no performance gain from specifying a serialVersionUID. JavaWorld: Into the mist of serialization myths