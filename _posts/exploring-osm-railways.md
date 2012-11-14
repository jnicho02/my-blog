title: Exploring OSM Railway Data
date: 2012-10-26
tags: [osm]
author: Jez Nicholson

I've been using Postgis to explore OSM Railway Data. As tagging is open in Open Street Map it means that there may be a number of alternatives to look for. I am doing some counts to see what people actually tag nodes and ways as.

http://wiki.openstreetmap.org/wiki/Railway_stations states that a node should be tagged as railway=station or railway=halt to mark the actual station/halt, or, rather than being on a node, this tag could be on the building, a closed way tagged building=train_station. Let's look at what is actually in the England OpenStreetMap dataset:

    SELECT 
      tag.v, count(*) 
    FROM 
      public.node_tags tag
    WHERE
      tag.k = 'railway'
    GROUP BY tag.v
    	ORDER BY count(*) DESC

72 results
**"station";2883** - "level_crossing";2346 - "buffer_stop";1129 - "crossing";975 - "tram_stop";349 - "halt";178 - **"station_site";168** - **"disused_station";165** - "subway_entrance";159 - "switch";98 - "junction";94 - **"historic_station";87** - **"stop";80** - **"disused";36** - "turntable";31 - **"abandoned";29** - "signal";28 - "point";22 - **"station site";17** - "ventilation_shaft";15 - "points";14 - "dismantled_colliery";13 - "trailing_crossover";12 - **"abandoned_station";12** - "facing_crossover";11 - "platform";11 - "disused_halt";11 - "entrance";8 - "signal_box";7 - "construction";5 - "tunnel_portal";4 - "junction_site";4 - "escape_shaft";4 - "colliery_site";4 - "milepost";3 - "box";3 - "signal_post";3 - "dismantled";3 - "ticket_machine";2 - "depot";2 - "old_station";2 - "terminal_site";2 - "water_tank";2 - "crossovers";1 - "preserved";1 - "station_entrance";1 - "Ticket Office";1 - "diamond";1 - "abandoned_power_station";1 - "Level Crossing";1 - "works";1 - "abandoned junction";1 - "ground_frame";1 - "trailing crossover";1 - "miniature";1 - "catch_pit";1 - "dismantled signal box";1 - "wash";1 - "ticket_desk";1 - "proposed_station";1 - "loading_gauge";1 - "dismantled_station";1 - "bridge";1 - "ticket_office";1 - "flat_crossing";1 - "gradient_post";1 - "lift";1 - "c";1 - "former_station";1 - "level_crossing;abandoned";1 - "level_crossing site";1 - "proposed";1

The wiki page states that "A node on a track way should be tagged as railway=stop to mark the estimate point at which the actual train stops" but there are only 80 occurances in England.

    SELECT 
      tag.v, count(*) 
    FROM 
      public.way_tags tag
    WHERE
      tag.k = 'railway'
    GROUP BY tag.v
    ORDER BY count(*) DESC

67 results

**"rail";31619** - **"abandoned";8164** - **"platform";3266** - **"subway";2543** - **"dismantled";1285** - **"disused";1117** - **"preserved";1090** - "tram";815 - **"proposed";684** - "light_rail";604 - "miniature";422 - "narrow_gauge";363 - "station";252 - "construction";103 - "monorail";48 - "signal_box";43 - "historical";36 - "overbridge";32 - "crossing";18 - "abandoned commented out until source is addes";16 - "siding";14 - "funicular";12 - "0";12 - "depot";11 - "turntable";11 - "level_crossing";8 - "junction";8 - "station_site";4 - "engine_shed";3 - "service";3 - "footbridge";3 - "historic_station";3 - "abandoned:monorail";2 - "shed";2 - "unknown";2 - "disused platform";2 - "dismissed";2 - "signalbox";2 - "signal_box_site";2 - "dismsntled";2 - "approved";2 - "narrow gauge";2 - "obliterated";2 - "former_platform";1 - "box";1 - "ticket_office";1 - "Motive_Power_Depot";1 - "discharge_point";1 - "terminal";1 - "dismanted";1 - "spur";1 - "workshop";1 - "roundhouse";1 - "covered";1 - "control_tower";1 - "disused_platform";1 - "dismantled; abandoned";1 - "station_building";1 - "F7";1 - "traverser";1 - "narrow_guage";1 - "waiting_room";1 - "disused_tram";1 - "cutting";1  - "terminal_site";1 - "subway_entrance";1 - "miniatrue";1

"Tracks within a station should be ways that are tagged as railway=rail". There are 31619 of these.


    SELECT 
      tag.v, count(*) 
    FROM 
      public.way_tags tag
    WHERE
      tag.k = 'building'
      and (tag.v like 'rail%'
      or tag.v like '%station'
      or tag.v like 'tunnel%')
    GROUP BY tag.v
    ORDER BY count(*) DESC

36 results

"station";159 - "train_station";153 - "railway_station";65 - "ground_station";32 - "fire_station";23 - "railway_platform";16 - "police_station";16 - "railway";14 - "sub_station";9 - "tunnel_shaft";9 - "ambulance_station";6 - "bus_station";5 - "substation";4 - "pumping_station";4 - "petrol station";4 - "fire station";3 - "railway station";3 - "fuel_station";2 - "service_station";2 - "sub station";2 - "police station";2 - "radio_station";2 - "filling_station";1 - "train_station;bus_station";1 - "train station";1 - "underground_station";1 - "petrol_station";1 - "transformer_station";1 - "rail_station";1 - "railway_depot";1 - "sewage_pumping_station";1 - "bus station";1 - "ambulance station";1 - "trian_station";1 - "disused_station";1 - "ranger_station";1


    SELECT
      t2.v, count(*)
    FROM
      public.way_tags t1, public.way_tags t2
    WHERE
      t1.way_id = t2.way_id
      and t1.k = 'building' and t1.v = 'yes'
      and t2.k = 'railway' and t2.v in ('station','train_station','railway_station','railway station','train station','rail_station')
    GROUP BY t2.v
  
1 result

**"station";148**

Looking at Brighton Station as an example it would appear that the station node carries lots of information. Some have 'ref' but most have 'naptan:AtcoCode':

    SELECT
      *
    FROM
      public.node_tags tag
    WHERE
      tag.node_id in
      (SELECT 
         node_id
       FROM
         public.node_tags t2
       WHERE
         t2.k = 'railway' and t2.v = 'station')
    ORDER BY tag.node_id
  
104734;"name";"Swindon"
104734;"wikipedia";"en:Swindon railway station"
104734;"naptan:AtcoCode";"9100SDON"
104734;"railway";"station"
104783;"name";"Chippenham"
104783;"naptan:AtcoCode";"9100CHIPNHM"
104783;"railway";"station"
104783;"source";"NPE + GPX"
105075;"railway";"station"
105075;"name";"Knebworth"
105075;"naptan:AtcoCode";"9100KNEBWTH"
105105;"name";"Royston"
105105;"naptan:AtcoCode";"9100ROYSTON"
105105;"network";"National Rail"
105105;"railway";"station"
106000;"name";"Sandy"
106000;"naptan:AtcoCode";"9100SNDY"
106000;"network";"National Rail"
106000;"railway";"station"
207493;"name";"Birmingham International"
207493;"naptan:AtcoCode";"9100BHAMINT"
207493;"network";"National Rail"
207493;"railway";"station"
262715;"naptan:AtcoCode";"9100LIPHOOK"
262715;"network";"National Rail"
262715;"railway";"station"
262715;"name";"Liphook"
262716;"operator";"South West Trains"
262716;"railway";"station"
262716;"ref";"HSL"
262716;"naptan:AtcoCode";"9100HASLEMR"
262716;"network";"National Rail"
262716;"name";"Haslemere"
etc.


    SELECT
      t1.way_id, name_tags.v AS name
    INTO station_polygons
    FROM way_tags AS t1
      INNER JOIN way_tags AS t2 ON (t1.way_id = t2.way_id
        and t2.k = 'railway' and t2.v in ('station','train_station','railway_station','railway station','train_station;bus_station','train station','underground_station','rail_station','trian station')
  )
      LEFT OUTER JOIN way_tags AS name_tags ON (t1.way_id=name_tags.way_id AND name_tags.k='name')
    WHERE t1.k = 'building' and t1.v in ('yes','true')
      UNION
    SELECT
      t1.way_id, name_tags.v AS name
    FROM way_tags AS t1
      LEFT OUTER JOIN way_tags AS name_tags ON (t1.way_id=name_tags.way_id AND name_tags.k='name')
    WHERE t1.k = 'building' and t1.v in ('station','train_station','railway_station')
    ORDER BY name


    ALTER TABLE station_polygons ADD COLUMN linestring GEOMETRY

Let's look at what other tags a railway/station also has:

    SELECT
      tag.k, count(*)
    FROM
      public.node_tags tag
    WHERE
      tag.node_id in
      (SELECT 
         node_id
       FROM
         public.node_tags t2
       WHERE
         t2.k = 'railway' and t2.v = 'station')
      AND tag.k != 'railway'
    GROUP BY tag.k
    ORDER BY count(*) DESC

111 results

**"name";2823** - **"naptan:AtcoCode";1855** - **"network";1079** - **"source";977** - **"ref";499** - "wikipedia";487 - "source_ref";379 - "wheelchair";236 - **"operator";235** - "disused";184 - **"line";164** - "usage";153 - "platforms";125 - "tube";88 - "note";68 - "postcode";68 - "postal_code";64 - "old_name";61 - "tourism";60 - "layer";53 - "source:name";42 - "electrified";37 - "addr:postcode";30 - "odbl";24 - "uic_ref";22 - "zone";22 - "wikipedia:en";18 - "public_transport";17 - "addr:street";16 - "website";16 - "opening_hours";16 - "media:commons";16 - "tracks";13 - "alt_name";11 - "nat_ref";10 - "created_by";9 - "name:cy";9 - "abandoned";9 - "FIXME";8 - "tfl_travelzone";7 - "start_date";7 - "source:ref";7 - "railway:historic";6 - "wheelchair:description";6 - "fixme";5 - "name:ru";5 - "construction";5 - "end_date";5 - "is_in:county";4 - "name:fr";4 - "frequency";4 - "train";4 - "dismantled";4 - "addr:housenumber";4 - "addr:city";4 - "voltage";3 - "name:en";3 - "is_in";3 - "addr:housename";3 - "owner";3 - "access";3 - "historic";3 - "farezone";3 - "status";3 - "naptan:Indicator";2 - "level";2 - "source:operator";2 - "local_ref";2 - "naptan:Landmark";2 - "building";2 - "historic:status";2 - "osmarender:renderName";2 - "upload_tag";2 - "type";2 - "source_ref:network";2 - "designation";2 - "naptan:CommonName";2 - "naptan:Street";2 - "naptan:Bearing";2 - "naptan:verified";2 - "loc_name";2 - "naptan:BusStopType";2 - "naptan:NaptanCode";2 - "url";2 - "surveillance";2 - "name:et";2 - "note:passenger_lounge";1 - "name:pa";1 - "station";1 - "noexit";1 - "description";1 - "notes";1 - "is_in:country_code";1 - "naptan:AtocCode";1 - "disused:railway";1 - "erected";1 - "route";1 - "crs";1 - "rail";1 - "is_in:country";1 - "destination";1 - "name:be";1 - "shelter";1 - "website:departures";1 - "opened";1 - "note:location";1 - "closed";1 - "gauge";1 - "source:old_name";1 - "colour";1 - "served_by";1

I'm thinking that the next task is to flatten out the data into a 'station_nodes' table..

* https://github.com/migurski/HighRoad does interesting stuff for roads.
* https://github.com/pgRouting/osm2pgrouting
* http://hub.qgis.org/projects/quantum-gis/wiki/Using_OpenStreetMap_data might help