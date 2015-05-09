title: read up about Apache Kafka
date: 2015/04/07
tags: [articles]
author: Jez Nicholson
time-spent: 1h

​​​After seeing it mentioned in a Microservices article I took a look at [Apache Kafka](https://kafka.apache.org/documentation.html)

Kafka was originally built by LinkedIn and then hived off to make a new company called Confluent. It is intended for processing of real-time data (such as web site tracking).

This [article from Confluent](http://blog.confluent.io/2015/02/25/stream-data-platform-1/​) helps.

One of the features of a microservices platform is that datastores are local to applications, i.e. they *do not* use a large centralised database. Some activities such as exploring logs, real-time analytics, will require data from lots of places to be piped to their own datastores, In a lossless, non-disruptive way. e.g. you don't want your e-commerce web site to run slowly because the web tracking is slowing it down.

This can happen particularly when the services aren't located geographically near to each other.

The idea is that everything can write to activity/log streams that can then be processed by Kafka as generic messages. This leaves you with a central pipeline.