---
title: Using Ruby OSMlib
date: 2011/04/26
tags: [openstreetmap,hacking]
author: Jez Nicholson
---
Just doing a bit of noodling with <a href="http://openstreetmap.org">http://openstreetmap.org</a> data to follow up my investigations during the LinkedGov Hack Day. I was working on an OSM ThingMatcher to find you an existing node at a particular postal address. The idea is that uniquely tagged objects such as doctors surgeries, postboxes, etc. will be more accurately positioned in OSM than the geolocation you'll get by geocoding the postcode. I wrote some code to pull in and parse OSM xml, but after a hunt I have found the ruby <a href="http://osmlib.rubyforge.org/">OSMLib</a>. Amongst other things, it gives you quick access to the OSM API.  There are examples at <a href="https://github.com/jekhor/osmlib-base/blob/master/examples/get_bbox">https://github.com/jekhor/osmlib-base/blob/master/examples/get_bbox</a>

    gem install osmlib-base

    irb

    require 'OSM/API'
    @api = OSM::API.new
    location = 50.83362, -0.1387
    db = @api.get_bbox(location[1] - 0.01, location[0] - 0.01, location[1] + 0.01, location[0] + 0.01)
    post_boxes = db.nodes.values.select {|node|node.tags.detect{|tag|tag[1]=="post_box"} }

gives an Array of post_boxes within a bounding box.
