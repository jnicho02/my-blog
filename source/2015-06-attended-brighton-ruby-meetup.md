---
title: attended Brighton Ruby Group Meetup
date: 2015/06/04
tags: [events]
author: Jez Nicholson
time-spent: 2h
---
​This is a regular monthly [Meetup](http://www.meetup.com/Brighton-Ruby-Group/) that brings Ruby developers together.

Andy Croll gave a talk about the joys of Rails ActiveJob. This is essentially a standard interface to different technologies that enable work items to be queued and/or scheduled for later processing. The main benefit being that potentially slow tasks can be offloaded from the main processing thread and run at a more convenient pace.

The most common usage is for emailing as this is notorious for having slow-running processes.

    UserMailer.welcome(@user).deliver_later

Use of ActiveJob could lead to different thinking if you broke a larger update into multiple tiny ones, for example updating cached counts. Error handling needs to be considered. The paradigm shift may come from when it is not essential that every single task succeeds.