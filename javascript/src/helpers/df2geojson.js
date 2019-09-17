export default function(data, props) {
  const longitude = props.longitude || "lng";
  const latitude = props.latitude || "lat";
  const geojson = {
    type: "FeatureCollection",
    features: []
  };
  const firstKey = Object.keys(data)[0];
  const keys = Object.keys(data).filter(key => key != longitude && key != latitude);
  const n = data[firstKey].length;
  for (let i = 0; i < n; i++) {
    const feature = {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [ data[longitude][i], data[latitude][i] ]
      },
      properties: getProperties(keys, data, i)
    };
    geojson.features.push(feature);
  }
  return geojson;
}

const getProperties = function(keys, data, i) {
  const properties = {};
  keys.forEach(key => properties[key] = data[key][i]);
  return properties;
};
