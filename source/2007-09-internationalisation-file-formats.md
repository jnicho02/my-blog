---
title: Internationalisation file formats
date: 2007/09/18
tags: [ideas]
author: Jez Nicholson
alias: /internationalisation-file-formats
---
Was just musing about file formats for i18n and thought the following:

If i18n translations are key-value pairs then XML won’t be the most efficient form. It would probably be better suited to properties files which will be more compact and less costly to parse. This is the approach that Java takes.
I’ve had problems in the past containing chunks of html within an XML tag as they have to be escaped.
In a previous project I used a tool called Popeye http://popeye.sourceforge.net/ to view and edit the translations.
A benefit of XML is that the charset can be clearly stated, as there can be lots of problems with accented characters.
One situation where the translations would want to be in XML is when they are used by xslt as an ‘xml include’ to access the file from within the stylesheet. see http://www.topxml.com/xsltStylesheets/xslt_multilingual.asp
You need to take care which editors are used on the files. It is very easy to save it from an editor and mess up the character encoding. Surprisingly to me, a MSoft product appears to be a stable choice.....Excel. We use scripts to convert XML to csv and back again.