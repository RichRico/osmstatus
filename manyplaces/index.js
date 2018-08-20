const fs = require('fs');
const geojson = JSON.parse(fs.readFileSync(process.argv[2]).toString());
//console.log(geojson.features[0].properties.WOREDANAME);
console.log(geojson.features[0].properties.NAME_2);
