title: quick cloning in Hibernate
date: 2006/07/01 21:00:00 -0700
tags: [ideas]
author: Jez Nicholson
alias: /quick-cloning-in-hibernate

Yesterday, I was pondering why my system was a bit slow in performing a clone operation when I had an epiphany.

The system uses Hibernate with the objects extending a base object and implementing a primary key + version number. I had cunningly written a generic clone method that queries Hibernate metadata and copies the contents across to the new object. This works fine, but there is some reflection and new object instantiation in there, both of which take time. It also seems to take up a lot of memory on the client, but that may be a misnomer.

Part of the clone operation involves not copying the id and version from the original (or setting id to null and version to zero on the new object) so that Hibernate recognises it as a new object. This got me to thinking, why not traverse the object tree of the existing objects setting their ids to null....and then save them in Hibernate, making new records in the database! I might have to watch out for objects that aren't involved in a cascade-update and pre-save them, but it sounds much quicker to only work on the id + version.

There might be some problems if objects are already being referenced by screens or whatever as they will now be the cloned object, but seeing as this is a rare operation when I need to clone an entire project at one time then I can't see any problems. I'll follow up with a note when i've tried it out.