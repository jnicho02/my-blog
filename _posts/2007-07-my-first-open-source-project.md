title: my first open source project, oo-writer-lite
date: 2007/07/25
tags: [ideas]
author: Jez Nicholson
alias: /my-first-open-source-project
​​​​
I released my first open source project this morning. It is called oo-writer-lite http://code.google.com/p/oo-writer-lite/ and is a lightweight OpenOffice.Org Writer document wrapper.

I have done a fair amount of developing using OpenOffice.Org Writer documents as output format for presenting data. I have extracted this mini Java api which wraps a Writer document and makes the various parts of it easily accessible. You could then do things like change the content via xslt or xml, switch placeholder images for your own, create a document from scratch. All by accessing the underlying files and not needing OO.O itself to be active.

The OO.O project does provide a programming library called UNO. This lets you communicate with the OO.O main engine and remote control it. In my experience I found UNO really painful to use as all the methods are called indirectly and because I wanted to mass produce documents, not just remote control the engine.