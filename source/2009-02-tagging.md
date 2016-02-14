---
title: There is more to Tagging than meets the eye
date: 2009/02/25
tags: [books]
author: Jez Nicholson
---
Today, I read "Tagging: People-Powered Metadata for the Social Web" by Gene Smith. I have to admit that before I read it I thought that I knew all that could be known about tags, which is not-a-lot, but I found that I was wrong. At 202 pages it might look to be a bit pricey, but it contains a detailed discussion of a single Social Web feature. If you really want to be advising people to use a particular feature or if you want to be adding it yourself then it is worth knowing the details.

My plan is to work on the Grails acts-as-taggable plugin to add particular features. These being:

##Tag Service
Retrieve more complicated data about tags via a Service rather than direct form domain objects

##Personal tags
To give users the opportunity to look at their own personal tags we need to store each users taggings and be able to return tags filtered by User

##Public/Private tags
The ability to mark specific tags as private so that nobody else can access them

##Generating test data
Tags will often follow a power-law curve (i.e. a very few tags will be used a large number of times and it will rapidly tail off so that a large number of tags are each used a few times). It would be great to use something like db-monster to pump in as much test data as we like.

##Tags Dashboard
A visual represention of various metrics such as tags per time period, unique tags created this period, popular tags today/yesterday/this week/month/period

##Synonym Rings and Authority Files
Define where words have an equivalent meaning, or in the case of Authority files define which is the preferred term.

##Facets
This is where tags are grouped into specific areas, which is probably a very thin line between being a tag and being a domain object attribute. It appears that the difference is that attributes are a fixed set of responses where tags are user variable, but i'm not 100% convinced that attributes have to come from a fixed set of responses. The main advantage I can see is that are treated as normal tags, e.g. they appear in tag clouds. Some thought needs to go into how to implement this one.

##Clusters
By seeing how many tags co-occur for a particular set of resources, then calculating the probability of tags occurring together we can group the high-probability terms together in clusters. This is implemented well in Flickr.

##Tag Clouds
The plugin could provide at minimum the data to construct a tag cloud, but maybe also output the appropriate html snippet.

##Linear Scaled Tag Clouds
As the distribution of tags is frequently a power-law curve the tag cloud produced won't be aesthetically pleasing as most words will be small and a few will be large. By scaling the counts returned logarithmically to produce a linear scaling the words will be more evenly distributed between sizes.

##Time Periods
By returning tags and counts for a time period it is possible to show hot topics. It also means that the favourite tags can be knocked off their perch. One thing about showing uses existing tags is that it may well encourage consensus. To me, this means neatness as well as the possibility of mediocrity.

##Machine Tags
The structure of namespace:key=value has been well used in Flickr, Upcoming and the like. It makes my happy and upset at the same time. whilst it displays emergent functionality, where users create their own features, I also see the major database antipattern "column stuffing" at work. It would be great to implement machine tags in a similar way to facets: they should appear to be tags, but are stored as attributes.

##Bulk Updates
Where bulk changes need to be applied they can be put into a queued operation.

##Feeds For Everything
One of the big wins from tagging is that of useful data feeds. Grails is great at this anyway, as generally a feed is just a view