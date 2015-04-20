title: OpenStreetMap station data
date: 2012-10-31
tags: [code, osm]
author: Jez Nicholson

Here is some quick postgis sql that I used to knock up kml of railway station sites in England. I have now forked traingraph to add my own flourishes https://github.com/jnicho02/traingraph

    SELECT node.*
    FROM 
      node_tags tag, nodes node
    WHERE tag.k='railway' and tag.v='station'
      and tag.node_id = node.id


    SELECT node.*, '<Placemark><name>' || nametag.v || '</name>' || ST_AsKML(node.geom) || '</Placemark>'
    FROM 
      node_tags tag, nodes node, node_tags nametag
    WHERE tag.k='railway' and tag.v='station'
      and tag.node_id = node.id
      and nametag.k='name'
      and node.id = nametag.node_id