title: Data tiles in Leaflet
date: 2015/06/02
tags: [ideas,code]
author: Jez Nicholson

Here is a little something i've been playing with. After the first flush of plotting points on a Leaflet map I soon realised that things can get quite slow. I've been building a tile-based data server which is hooked in to the map tile calls in the javascript. It isn't an original thought (i'll add in links to original references when I find them) but i've taken it a bit further than other people have.

This post is not complete, I will be expanding it.

​​A short video...

https://youtu.be/2PCPa8PuHng

Leaflet is very quick and easy to get a map up and running.

![/images/basic_map.png](/images/basic_map.png)

If you return points from your data server as geojson they can be hooked straight in
![/images/some_points.png](/images/some_points.png)

That is a bit ugly, but the [Leaflet.markerclusterer](https://github.com/Leaflet/Leaflet.markercluster) comes to the rescue

![/images/clusters.png](/images/clusters.png)

If you don't have an awful lot of data then you could simply load all of it from a single geojson file. We have 35000+ plaques on Open Plaques so passing the entire database is not an option.

The standard functionality is to trigger a bounding box query with [leaflet-vector-layers](http://jasonsanford.github.io/leaflet-vector-layers/) or similar. Top-left and  bottom-right coordinates are sent as parameters in whatever url structure you tell it.

![/images/bounding_box.png](/images/bounding_box.png)

A bounding box is a very simple SQL query

    SELECT * from plaques
    WHERE latitude between (a and b)
    AND longitude between (x and y)

And if you index on 'latitude, longitude' then it should run pretty quick.

However, once you do a big zoom then you'll be doing a correspondingly large SQL query :( Large numbers of records could be returned. In our case this pushed the http call past the Heroku 12 second maximum and it assumed that our server had hung.

![/images/big_zoom.png](/images/big_zoom.png)

A slippymap is made of tiles…

![/images/tiles.png](/images/tiles.png)

It is fairly trivial to convert from tile number -> coordinates and vice versa. The formulae are published on the [OpenStreetMap Wiki Slippy_map_tilenames](http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames)

![/images/do_the_math.png](/images/do_the_math.png)

![/images/tiled_calls.png](/images/tiled_calls.png)

![/images/one_data_tile.png](/images/one_data_tile.png)

Big zoom. Lots of little SQL queries :)

![/images/big_zoom_tiled.png](/images/big_zoom_tiled.png)

Standardize on one zoom level for the data calls. This will reduce the number of calls made and enable us to cache the results.

![/images/data_at_one_level.png](/images/data_at_one_level.png)

Speed Improvements

* Only query at one zoom level
* Streamline the SQL
* Don’t repeat calls, keep a list
* Cache json on the server with Redis or memcached
* Dump to files…

![/images/cached_json.png](/images/cached_json.png)

What's left?

* Country level view fires a lot of calls
* Can flood the server
* Restrict the maximum map zoom level?
* Store aggregated counts

Alternatives?
* http://agentscript.org/docs/data.tile.html
* http://bl.ocks.org/glenrobertson/6203331
