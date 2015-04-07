title: read microservices article "Agile coding in enterprise IT: Code small and local" (1hr)
date: 2015/04/07 21:00:00 -0700
tags: [articles]
author: Jez Nicholson
alias: /read-microservices-in-enterprise-it

​​http://www.pwc.com/us/en/technology-forecast/2014/cloud-computing/features/microservices.jhtml

As Landmark move into the world of Microservice​​​s I think that it is important that we all understand what it actually means. This article gives a reasonable understanding and i've made some notes...​

Microservices are very decoupled. "​Developers can create and activate new microservices without prior coordination with others. Their adherence to microservices architecture principles makes continuous delivery of new or modified services possible."

Simplicity, tight scope, minimal change request process.

Microservices architecture is evolving and unproven over the long term.

"you don’t want elaborate middleware, service buses, or other orchestration brokers, but rather simpler messaging systems such as Apache Kafka."

fine-grained, stateless, self-contained

services are expected to change, and some eventually will become disposable

When a package doesn’t do more than is absolutely necessary, it’s easy to understand and to integrate into other applications

Favours the "reactive actor" programming model

As a result of this independence, you can use the right language for the microservice in question, as well as the right database or other related service

* Each single-function microservice has one action.
* A small set of data and UI elements is involved.
* One developer, or a small team, independently produces a microservice.
* Each microservice is its own build, to avoid trunk conflict.
* The business logic is stateless.
* The data access layer is statefully cached.
* New functions are added swiftly, but old ones are retired slowly.