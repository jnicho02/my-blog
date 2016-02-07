---
title: creating indexes in Hibernate with XDoclet tags
date: 2006/07/26
tags: [events]
author: Jez Nicholson
alias: /creating-indexes-in-hibernate-eith-xdoclet-tags
---
Perhaps i've been a little slow, but up to now I hadn't realised how you create indexes via Hibernate XDoclet tags. I suppose it's because most of the work i've been doing is development from scratch that i'm so busy getting the properties and relationships right that I haven't focussed on tuning. I subscribe to the 'build first, tune later' approach as "Premature optimization is the root of all evil.". Generally, database servers are built to make the obvious/logical queries run quickly and a cunning plan at twisting the table structure to run quickly will miss out on these. Now I let Hibernate dictate much of my database table structures....I wonder how efficient the indexing is?

Where @hibernate.property name="bingoWings" column="bingo_wings" can be used to control the actual name used for the database column @hibernate.column gives some extra control over that database column, so that @hibernate.column name="bingo_wings index="idx_bingo_wings" will create an index on the bingo_wings column. Check the XDoclet @hibernate Tag Reference for more details or Thomas Gaudin's Hibernate mapping with xdoclet tutorial.

As to choosing which things to index, then it is a subtle art. Some database servers include features to explain the query plan used, but make sure that you've loaded a lot of realistic test data into the system first otherwise the results will be false.