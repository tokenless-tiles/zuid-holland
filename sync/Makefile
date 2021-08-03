clean:
	rm index-v1-nogeom.json parents ids
index-v1-nogeom.json:
	curl -O https://download.geofabrik.de/index-v1-nogeom.json

parents: index-v1-nogeom.json
	<$< jq -r '.features[]|.properties.parent' | sort -u >$@

ids: index-v1-nogeom.json
	<$< jq -r '.features[]|.properties.id' | sort -u >$@

extracts: ids parents
	comm -23 $^ | comm -23 - excludes >$@
