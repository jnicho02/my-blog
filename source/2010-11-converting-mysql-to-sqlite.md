---
title: converting MySql data to sqlite3
date: 2010/12/11
tags: [ideas]
author: Jez Nicholson
---
I was just trying to switch a Rails app over to mysql and had a bad time with the mysql gem. In the end I decided to get the data into sqlite3 instead. It wasn't too hard. I loaded the sql dump that I had been given into mysql then dumped it out again in a sqlite-friendly format with:

    mysqldump openplaques -u root -p --skip-add-drop-table --skip-extended-insert --no-create-info --skip-add-locks > sqlite3_friendly.sql

sqlite expects apostrophes in inserts to be doubled '' rather tahn slashed, so I did a replace in a text editor. Maybe this could be set as a mysqldump param, but I couldn't find it.

Then it's a case of going into sqlite and

    .read sqlite3_friendly.sql
