---
title: Next steps in open source OpenStreetMap Points Of Interest POI data
date: 2011/06/09
tags: [openstreetmap,hacking]
author: Jez Nicholson
---
<p><div class='p_embed p_image_embed'>
<a href="/media/getfile/files.posterous.com/temp-2011-06-09/BwjEkDbwJIFHuBHyaptfivpzrzgerGwmFGaElobJsfGyEemdbBHpgGuGGavD/fullosm.JPG.scaled1000.jpg"><img alt="Fullosm" height="347" src="/media/getfile/files.posterous.com/temp-2011-06-09/BwjEkDbwJIFHuBHyaptfivpzrzgerGwmFGaElobJsfGyEemdbBHpgGuGGavD/fullosm.JPG.scaled500.jpg" width="500" /></a>
</div>
</p>
<p>My journey for OSM Points Of Interest has taken me firstly to&nbsp;Enrico Zini's post "<a href="http://www.enricozini.org/2010/tips/osm-import-nodes/" title="Importing OSM nodes into Spatialite">Importing OSM nodes into Spatialite</a>"</p>
<p>* as I am using Windows (not by choice, they made me do it!) I needed to download and install libspatialite, proj, geos and libiconv dlls from&nbsp;<a href="http://www.gaia-gis.it/spatialite/binaries.html">http://www.gaia-gis.it/spatialite/binaries.html</a></p>
<p>* I needed pysqlite for my python 2.5 installation from&nbsp;<a href="http://code.google.com/p/pysqlite/downloads/list">http://code.google.com/p/pysqlite/downloads/list</a></p>
<p>* I also needed simplejson which I got via easy_install</p>
<p>* The script needed to point to the .dll and not an .so -&gt;&nbsp;<em>self.db.execute("SELECT load_extension('libspatialite-1.dll')")</em></p>
<p>* dict() doesn't like it when a key doesn't exist, so if there is an OSM node with no tags["name"] the program will error. Instead, I used defaultdict() with:&nbsp;<em>from collections import defaultdict</em>&nbsp;and&nbsp;<em>self.tags = defaultdict(str)</em></p>
<p><code>


SELECT poi."id", tag."name"


, Distance("geom" ,GeomFromText('POINT(-6.2626 53.34942)'))*100000&nbsp;AS dist


, poi."name", "data"


FROM "poi", "poitag", "tag"


WHERE poi.id = poitag.poi   &nbsp;


AND poitag.tag = tag.id   &nbsp;


AND tag."value" = "cafe"


ORDER BY dist


</code></p>
<p>Which gives me <em>Dublin Dental Hospital</em> as my first hit.&nbsp;Again, I am faced with the same difficulty in that amenities could either be an OSM node or a circular OSM way. It gets more complicated to process a Way as it references the Nodes that make it up, and Enrivo's script is about parsing the xml input stream.</p>
<p>In Spatialite 2.4 rc4&nbsp;<a href="http://www.gaia-gis.it/spatialite-2.4.0-4/binaries.html">http://www.gaia-gis.it/spatialite-2.4.0-4/binaries.html</a>&nbsp;there is a new tool called <strong>spatialite_osm_raw</strong>. This was really easy to use to import OSM XML data direct into a Spatialite database.</p>
<p>&nbsp;</p>
<p><code>


C:\Users\jez.nicholson.ARGYLLENVIRO\Desktop&gt;spatialite_osm_raw -o Dublin.osm -d&nbsp;dub_osm.sqlite


SQLite version: 3.7.3


SpatiaLite version: 2.4.0   &nbsp;


inserted 8239 nodes


4992 tags


inserted 2207 ways   &nbsp; &nbsp; &nbsp; &nbsp;


7068 tags   &nbsp; &nbsp; &nbsp; &nbsp;


10879 node-refs


inserted184 relations   &nbsp; &nbsp; &nbsp; &nbsp;


688 tags   &nbsp; &nbsp; &nbsp; &nbsp;


903 node-refs   &nbsp; &nbsp; &nbsp; &nbsp;


6573 way-refs   &nbsp; &nbsp; &nbsp; &nbsp;


0 relation-refs


</code></p>
<p>A quick bit of SQL:</p>
<p><code>


SELECT wt.way_id, osm_way_node_refs.node_id, wt.k, wt.v, name.v


, Distance("Geometry" ,GeomFromText('POINT(-6.2626 53.34942)'))*100000 AS dist


FROM osm_way_tags wt, osm_way_tags name, osm_way_node_refs, osm_nodes


WHERE wt.way_id = osm_way_node_refs.way_id


AND osm_way_node_refs.node_id = osm_nodes.node_id


AND wt.k="amenity" AND wt.v="hospital"


AND wt.way_id = name.way_id


AND name.k="name"


ORDER BY dist   &nbsp;


</code></p>
<p>...and I can list hospitals which are defined as ways: Rotunda Maternity Hospital at 256m away at it's nearest point and Children's University Hospital Temple Street 706m, which is better than the result of "Children's University Hospital at 862m" which I got from Navtec.</p>
<p>Next step is to combine Node and Way POIs. I feel that I will need to create a new sql table that mixes point and polygon geometries (if it doesn't do that already).</p>
<p>&lt;h2&gt;see also&lt;/h2&gt;</p>
<p>* my previous post <a href="http://itsallinthega.me/first-steps-towards-open-source-openstreetmap">First steps towards open source OpenStrretMap Points Of Interest POI data</a></p>
<p>* my next post <a href="http://itsallinthega.me/openstreetmap-points-of-interest-it-works">OpenStreetMap Points Of Interest - it works</a>!</p>
