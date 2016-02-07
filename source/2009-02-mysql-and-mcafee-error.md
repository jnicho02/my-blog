---
title: Mysql Errcode:13 and McAfee
date: 2009/02/04
tags: [code]
author: Jez Nicholson
alias: /subtitled-quicktime
---
​​​​I had another case of the "Mysql Errcode:13" last week and found that it was caused by McAfee virus checker. Just thought that i'd put a note here so that a) I remember, or b) it helps someone else

When MySql carries out a mysqldump it creates temp files. McAfee virus checker will spot this and think that they are illegal virus files. Similarly, when a large data operation is carried out (e.g. lots of update statements) a temp file may get created in mysql/data.

To get around this problem, go into McAfee VirusScan/All Processes/Exclusions... and add your mysql temp and data directories. If you are using an enterprise solution then your local settings might get updated by the enterprise rules, in which case you'll have to request from your IT department to have a named directory added, to which you can move your mysql temp and data. Reconfigure the locations in my.cnf