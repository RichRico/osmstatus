#!/bin/bash
	while IFS='' read -r line || [[ -n "$line" ]]; do

	    echo {\"type\": \"FeatureCollection\", \"features\": [$line]} > zone.geojson
	    
	    zoneName="$(node index.js zone.geojson)"
	    #echo $zoneName
	    #cp zone.geojson $zoneName.geojson
	    
	    geojson2poly zone.geojson zone.poly
	    osmconvert ayacucho.pbf -B=zone.poly --complete-ways --complex-ways -o="$zoneName.pbf"
	    
	    #info="$(osmstatus region.pbf)"
		osmstatus "$zoneName.pbf" >> resultado.csv
		
	    #info="$(node /home/ds/apps/osmlazer/index.js --file region.pbf --mode basemap | jq .)"
	    #node /home/ds/apps/osmlazer/index.js --file region.pbf --mode basemap | jq .
	    #info="$(node /home/ds/apps/osmlazer/index.js --file region.pbf --mode poi)"
    	#echo $zoneName, $info >> info.csv
    	#result = "$(node merge.js zone.geojson info.json)" //no

    	#echo $result >> outpt.json //no
    	#node merge.js >> mergeoutput.json
    	

    
	done < prov_ayac.json
