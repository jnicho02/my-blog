title: OpenStreetMap Points Of Interest - it works!
date: 2011/06/09
tags: []
author: Jez Nicholson
alias: /openstreetmap-points-of-interest-it-works

<p><div class='p_embed p_image_embed'>
<a href="/media/getfile/files.posterous.com/temp-2011-06-09/hbjJirtCtmHBGtkHDabIcrlfGblCuoEBuDsHoupJEvgdcbofghkaGrnEuhmG/OSM_Healthcare.JPG.scaled1000.jpg"><img alt="Osm_healthcare" height="306" src="/media/getfile/files.posterous.com/temp-2011-06-09/hbjJirtCtmHBGtkHDabIcrlfGblCuoEBuDsHoupJEvgdcbofghkaGrnEuhmG/OSM_Healthcare.JPG.scaled500.jpg" width="500" /></a>
</div>
So, taking features from OSM for healthcare:&nbsp;"pharmacy","hospital","dentist" and "doctors" (we'll leave <a href="http://wiki.openstreetmap.org/wiki/Tag:amenity%3Dbaby_hatch" title="Baby Hatch">"baby_hatch"</a> for now as it's slightly scary...or maybe i'm just not enlightened enough!) I can do two sql statements, one for the ways and one for the nodes then UNION ALL them together to get a result set of ways and nodes.</p>
<p>We are competing with:</p>
<p>nearest hospital = Children's University Hospital 862m</p>
<p>nearest pharmacy = Gordons Chemist, Newry 811km&nbsp;(!!!!)</p>
<p><div class='p_embed p_image_embed'>
<a href="/media/getfile/files.posterous.com/temp-2011-06-09/JhDsIElffrxFFysdfBmplAHlmIBtGiIxqFCswzylCHbEkjtzjEpFxdvCFfwD/itworks.JPG.scaled1000.jpg"><img alt="Itworks" height="330" src="/media/getfile/files.posterous.com/temp-2011-06-09/JhDsIElffrxFFysdfBmplAHlmIBtGiIxqFCswzylCHbEkjtzjEpFxdvCFfwD/itworks.JPG.scaled500.jpg" width="500" /></a>
</div>
</p>
<p>Results are:</p>
<p>&nbsp;</p>
<table>

<tr>
<th>way</th><th>node</th><th>key</th><th>value</th><th>site_name</th><th>dist</th>
</tr>
<tr>
<td>79498864</td>
<td>928009126</td>
<td>amenity</td>
<td>hospital</td>
<td>Rotunda Maternity Hospital</td>
<td>256.708557</td>
</tr>
<tr>
<td>51776450</td>
<td>660713035</td>
<td>building</td>
<td>hospital</td>
<td>NULL</td>
<td>261.315159</td>
</tr>
<tr>
<td>582756469</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>Parnell Pharmacy</td>
<td>304.355369</td>
</tr>
<tr>
<td>51776463</td>
<td>660713097</td>
<td>building</td>
<td>hospital</td>
<td>NULL</td>
<td>322.308431</td>
</tr>
<tr>
<td>631808707</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>Health Express</td>
<td>333.650710</td>
</tr>
<tr>
<td>471861761</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>Hickey's Pharmacy</td>
<td>338.425801</td>
</tr>
<tr>
<td>279912239</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>Hamilton Long Pharmacy</td>
<td>397.367718</td>
</tr>
<tr>
<td>768516996</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>doctors</td>
<td>Jervis Medical Centre</td>
<td>469.036586</td>
</tr>
<tr>
<td>249430783</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>Traceys</td>
<td>574.297052</td>
</tr>
<tr>
<td>567713114</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>doctors</td>
<td>Dame Street Medical Centre</td>
<td>597.042663</td>
</tr>
<tr>
<td>567713109</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>City Pharmacy</td>
<td>606.547296</td>
</tr>
<tr>
<td>559854612</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>Medipharm</td>
<td>653.331539</td>
</tr>
<tr>
<td>249430226</td>
<td>&nbsp;</td>
<td>amenity</td>
<td>pharmacy</td>
<td>NULL</td>
<td>694.285493</td>
</tr>
<tr>
<td>41779231</td>
<td>515098838</td>
<td>amenity</td>
<td>hospital</td>
<td>Children's University Hospital Temple Street</td>
<td>706.971984</td>
</tr>
<tr>
<td>33005187</td>
<td>371973866</td>
<td>amenity</td>
<td>hospital</td>
<td>Mater Private Hospital</td>
<td>829.883832</td>
</tr>

</table>
<p>The second object detected is a hospital building inside the grounds of Rotunda Maternity Hospital. Buildings often won't be contained within grounds, so I can't distinguish. Perhaps when there is a stanalone building then it has a name?</p>
<p>&nbsp;</p>
<p>The sql is:</p>
<p><code>


SELECT wt.way_id as way, osm_way_node_refs.node_id as node, wt.k as key, wt.v as value, name_tag.v AS site_name


, min(Distance("Geometry" ,GeomFromText('POINT(-6.2626 53.34942)'))*100000) AS dist


FROM osm_way_tags wt, osm_way_node_refs, osm_nodes


LEFT OUTER JOIN osm_way_tags name_tag


&nbsp;ON wt.way_id = name_tag.way_id AND name_tag.k="name"


WHERE wt.way_id = osm_way_node_refs.way_id


AND osm_way_node_refs.node_id = osm_nodes.node_id


AND wt.k in ("amenity","building") AND wt.v in ("pharmacy","hospital","dentist","doctors")


GROUP by way


&nbsp;


UNION ALL


&nbsp;


SELECT "" as way, n.node_id as node, wt.k as key, wt.v as value, name_tag.v AS site_name


, Distance("Geometry" ,GeomFromText('POINT(-6.2626 53.34942)'))*100000 AS dist


FROM osm_node_tags wt, osm_nodes n


LEFT OUTER JOIN osm_node_tags name_tag


&nbsp;ON wt.node_id = name_tag.node_id AND name_tag.k="name"


WHERE wt.node_id = n.node_id


AND wt.k in ("amenity","building") AND wt.v in ("pharmacy","hospital","dentist","doctors")


&nbsp;


ORDER BY dist


</code></p>
