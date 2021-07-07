---
title: Clean Rails migrations
date: 2021/07/07
tags: [ideas]
author: Jez Nicholson
---
I really like building early-stage applications in Rails. The way that I can sit down with a subject expert and have them explain how something is modelled and then build it almost before their eyes. One trick is to create ActiveModel extending objects that mimic a database table before commiting to creating a migration (but more about that another time). Today i've been thinking about the transition from hacking up an early-stage prototype to turning it into a Production-ready system.

Whilst prototyping, the model will have changed a lot, oftentimes a good modelling scheme is discovered and the old ones abandoned. I'd quite like to start the set of migrations again from scratch before moving to Production. Many of my old migrations will have been adding a column rather than stating it as a Rails reference and a useful index that gets autocreated will have been missed. So, the question is....is this a common thought, and if so what have other people done about it?