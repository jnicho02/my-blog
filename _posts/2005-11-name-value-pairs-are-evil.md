title: XML name/value pairs are evil
date: 2005/11/25
tags: [code]
author: Jez Nicholson
alias: /name-value-pairs-are-evil

When I approach outputting data into XML I always try to adopt an open industry standard. Something that i've noticed is that to enable you to put your own attributes in there is a name/value pair pattern.

I've seen this in my old days in databases, it surfaces as generic tables for reference data in order to 'make the database less complex'. It seems like a good idea at first, but the result is that the developer then has to know the particular code name to use when referencing data instead of the table name enforcing it, and it spoils some of the database server's query plans as it doesn't necessarily use the table joins to use table indexes. So, confusing to the developer and slower to process

for example:
   <somedata>
      <title>My data</title>
      <colour>blue</colour>
      <variableattributes>
         <attribute>
            <name>any attribute name I like</name>
            <value>budgie</value>
         </attribute>
      <variableattributes>
   </somedata>

Great, it allowed me to add a new attribute, but at the expense of my xslt including lines like <xsl:value-of select="attribute[@name='any attribute name I like']/value"/> There is also the chance that someone could spell that attribute name wrongly when creating XML, and also when I give the XML to someone else then there is no definition of my attributes.

My growing opinion is that the XML schema should be made extensible and that if I want to add attributes I should create a schema myself and add it to the XML:
   <somedata>
      <title>My data</title>
      <colour>blue</colour>
      <any_attribute_name_I_like>
         budgie
      </any_attribute_name_I_like>
   </somedata>

I've seen it discussed in Oasis