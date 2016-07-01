---
title: parsing csv files with groovy
date: 2011/08/02
tags: [hacking]
author: Jez Nicholson
---
We have a piece of software that insists on generating a type of csv file containing multiple datasets. I'm currently turning this into XML to make it easier to process (funny that, people seem to have a downer on xml most of the time). I want to parse the csv without knowing what the columns will be, plus they can be speechmark delimitted and maybe contain carriage returns.
Anyway, it seems easy to start with and then gets more and more involved. Let's face it, life is too short to write a full parser for myself. I did a bit of research and took the opportunity to try it out in groovy. My latest version uses a groovy wrapper [https://github.com/xlson/groovycsv/](https://github.com/xlson/groovycsv/) of [http://opencsv.sourceforge.net/](http://opencsv.sourceforge.net/)

UPDATE: my good friend and ex-colleague @nugsie suggested a MarkupBuilder....

'''groovy

    @Grab('com.xlson.groovycsv:groovycsv:0.2')
    import com.xlson.groovycsv.CsvParser
    import groovy.xml.MarkupBuilder

    def csv = '''field_one,field_two,field_three
    ay,"be""e",sea
    ay,"bee
    multiline",sea'''

    def writer = new StringWriter()
    def xml = new MarkupBuilder(writer)
    def data = new CsvParser().parse(csv)
    xml.records() {
    &nbsp; &nbsp;data.each { line -&gt;
    &nbsp; &nbsp; &nbsp;feature() {
    &nbsp; &nbsp; &nbsp; &nbsp;line.columns.each { columnName, index -&gt;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"${columnName}"(line.values[index])
    &nbsp; &nbsp; &nbsp; &nbsp;}
    &nbsp; &nbsp; &nbsp;}
    &nbsp; &nbsp;}
    }

    writer.toString()
'''

output from which is:

&lt;?xml version="1.0" encoding="UTF-8"?&gt;
 &lt;records&gt;
 &nbsp; &lt;Feature&gt;
 &nbsp; &nbsp; &lt;field_one&gt;ay&lt;/field_one&gt;
 &nbsp; &nbsp; &lt;field_two&gt;be"e&lt;/field_two&gt;
 &nbsp; &nbsp; &lt;field_three&gt;sea&lt;/field_three&gt;
 &nbsp; &lt;/Feature&gt;
 &nbsp; &lt;Feature&gt;
 &nbsp; &nbsp; &lt;field_one&gt;ay&lt;/field_one&gt;
 &nbsp; &nbsp; &lt;field_two&gt;bee
 multiline&lt;/field_two&gt;
 &nbsp; &nbsp; &lt;field_three&gt;sea&lt;/field_three&gt;
 &nbsp; &lt;/Feature&gt;
 &lt;/records&gt;

...nice.
