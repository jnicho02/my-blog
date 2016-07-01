---
title: First steps towards open source OpenStreetMap Points Of Interest POI data
date: 2011/06/06
tags: [geo,openstreetmap,opendata,hacking]
author: Jez Nicholson
---
<div class='p_embed p_image_embed'>
<a href="/media/getfile/files.posterous.com/temp-2011-06-06/nnikuqgbyqFHvawqjliHmcGbvmwbbFhfwcifbgdnvryHFgoiCcHJhguAycxn/spatialite_pois.JPG.scaled1000.jpg"><img alt="Spatialite_pois" height="350" src="/media/getfile/files.posterous.com/temp-2011-06-06/nnikuqgbyqFHvawqjliHmcGbvmwbbFhfwcifbgdnvryHFgoiCcHJhguAycxn/spatialite_pois.JPG.scaled500.jpg" width="500" /></a>
</div>

I'm working with some European data at the moment, part of which is POI data for "nearest hospital", "nearest educational facility", etc. and the data is quite poor. I suspect that it originally sourced from NavTec and hence "Yellow Books". I also suspect that the data in OpenStreetMap will be orders of magnitude more accurate.

My first port of call was to examine the attributes used in OSM. To do this I download an area of central Dublin into JOSM and look at the raw data. Taking hospitals as an example I can quickly see that these are encoded in three different ways:

* As point data with an attributes of "amenity=hospital" and "name=foo"
* As an area, again marked&nbsp;"amenity=hospital" and "name=foo"
* As a building, which is an area also marked with "building=hospital". Hospital buildings are often placed within a hospital area, but not necessarily.

I've then taken a look at [SpatiaLite](http://www.gaia-gis.it/spatialite) which is a really lightweight file-based database server. This would be great for packaging with an app, but is also good for quick experiments. I may need to go up to PostGIS if it isn't up to the job.

I downloaded the spatialite-gui binary for Windows, unzipped it and ran it.

From [GeoFabrik](http://download.geofabrik.de/osm/europe/) I downloaded [ireland.shp.zip](http://download.geofabrik.de/osm/europe/ireland.shp.zip)

<div class='p_embed p_image_embed'>
<a href="/media/getfile/files.posterous.com/temp-2011-06-06/yvgcIAisAGopCbbGylJtHDienxBnqofebnGwFxjprcdaoGberDEJityaAtdr/loadshapefile.JPG.scaled1000.jpg"><img alt="Loadshapefile" height="411" src="/media/getfile/files.posterous.com/temp-2011-06-06/yvgcIAisAGopCbbGylJtHDienxBnqofebnGwFxjprcdaoGberDEJityaAtdr/loadshapefile.JPG.scaled500.jpg" width="500" /></a>
</div>

In the SpatialLite GUI I created a new database and then went to "Load Shapefile", I picked a .shp file from my downloaded data and set the SRID to 4326 (which is the id in the spatial_ref_sys table for WGS-84) and the charset to UTF-8. It then imported in a matter of seconds. This gave me a sql table that I could query using extra functions such as Distance()

I got a WGS-84 lat/lon for my search point by right-clicking on Google Maps and doing a "Drop LatLng Marker" (I can't remember whether this is an opt-in feature). I have since worked out that SpatialLite expects the coordinated to be the other way round:&nbsp;lon/lat and not lat/lon.

    SELECT ROWID, "PK_UID", "osm_id", "name", "type"
    , Distance("Geometry" ,GeomFromText('POINT(-6.2626 53.34942)'))*100000 AS dist
    FROM "points"
    WHERE "type" = "hospital"
    ORDER BY dist

gives me a result set starting with:&nbsp;osmid=641802162, name=Dublin Dental Hospital, distance 1289m

When I query the buildings I get: osmid=51776450, name=NULL, distance 261m...which is the first building of the Rotunda Maternity Hospital.

What I don't know is where to get hold of the area data. Is it in the road shapefile?! I think not. So where would it be?

Enrico Zini's post [Importing OSM nodes into Spatialite](http://www.enricozini.org/2010/tips/osm-import-nodes/" title="Importing OSM nodes into Spatialite)

* as I am using Windows (not by choice, they made me do it!) I needed to download and install libspatialite, proj, geos and libiconv dlls from [http://www.gaia-gis.it/spatialite/binaries.html](http://www.gaia-gis.it/spatialite/binaries.html)
* I needed pysqlite for my python 2.5 installation from [http://code.google.com/p/pysqlite/downloads/list](http://code.google.com/p/pysqlite/downloads/list)
* I also needed simplejson which I got via easy_install
* The script needed to point to the .dll and not an .so -self.db.execute("SELECT load_extension('libspatialite-1.dll')")
* dict() doesn't like it when a key doesn't exist, so if there is an OSM node with no tags["name"] the program will error. Instead, I used defaultdict() with: from collections import defaultdict and self.tags = defaultdict(str)

    SELECT poi."id", tag."name", Distance("geom" ,GeomFromText('POINT(-6.2626 53.34942)'))*100000 AS dist, poi."name", "data"
    FROM "poi", "poitag", "tag"
    WHERE poi.id = poitag.poi
    AND poitag.tag = tag.id
    AND tag."value" = "cafe"
    ORDER BY dist
