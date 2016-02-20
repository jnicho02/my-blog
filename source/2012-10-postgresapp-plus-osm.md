---
title: Loading OpenStreetMap data on Mac OS X Mountain Lion
date: 2012-10-31
tags: [openstreetmap]
author: Jez Nicholson
---
I recently installed PostgresApp http://postgresapp.com/ from Heroku on my Mac (OS X Mountain Lion) and am interested in OpenStreetMap data. PostgresApp includes postgis 2.0 as standard and appears to have hstore, although I am having slight difficulties with it.
1. install PostgresApp
2. download some test data from http://download.geofabrik.de/openstreetmap/ I guess I could have used wget, but I was exploring in Chrome so just downloaded it.
3. create an empty database
> psql -h localhost
> CREATE DATABASE osm_england;
> \q

add hstore

4. configure postgis
> psql -h localhost -d osm_england -f /Applications/Postgres.app/Contents/MacOS/share/contrib/postgis-2.0/postgis.sql
> psql -h localhost -d osm_england -f /Applications/Postgres.app/Contents/MacOS/share/contrib/postgis-2.0/spatial_ref_sys.sql
> psql -h localhost -d osm_england -f /Applications/Postgres.app/Contents/MacOS/share/contrib/postgis-2.0/topology.sql
5. install osmosis
Osmosis is a Java application to load OSM data. I used homebrew. I normally use macports, but am using homebrew in parallel.
> brew install osmosis
6. create OSM 'simple' schema
> psql -h localhost -d osm_england -f /usr/local/opt/osmosis/libexec/script/pgsimple_schema_0.6.sql
> psql -h localhost -d osm_england -f /usr/local/opt/osmosis/libexec/script/pgsimple_schema_0.6_linestring.sql

the 'linestring' bit will add a column to the ways table that will include all of the node points in a line. This could then be used by the Postgis function ST_MakeLine or ST_MakePolygon.

7. load OSM data
PostgresApp automatically creates a role (user) with your main Mac user's name, so use yours and not 'jeznicholson'.
> osmosis --read-pbf file="Downloads/england.osm.pbf" --write-pgsimp database="osm_england" host="localhost" user="jeznicholson"

> Oct 24, 2012 7:13:16 PM org.openstreetmap.osmosis.core.Osmosis run
> INFO: Pipeline executing, waiting for completion.
> Oct 24, 2012 8:58:07 PM org.openstreetmap.osmosis.core.Osmosis run
> INFO: Pipeline complete.
> Oct 24, 2012 8:58:07 PM org.openstreetmap.osmosis.core.Osmosis run
> INFO: Total execution time: 6290917 milliseconds.