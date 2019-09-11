import df2geojson from "./helpers/df2geojson";

const makePopupContent = function(feature) {
  const keys = Object.keys(feature.variables);
  return keys.map(key => `<h1>${key}</h1><p>${feature.variables[key].value}</p>`);
};

export default function(data, vizDef, id, props) {
  let map = this;
  if (props.df) data = df2geojson(data, props);

  const source = new carto.source.GeoJSON(data);
  // vizDef = vizDef || []; // TODO: needed?
  const viz = new carto.Viz(vizDef.join("\n"));
  const cartoLayer = new carto.Layer(id, source, viz);

  // Interactivity
  if (props.popup) {
    const interactivity = new carto.Interactivity(cartoLayer);
    interactivity.on("featureClick", e => {
      const feature = e.features[0];
      if (!feature) return;

      const html = feature.variables.popup ? [feature.variables.popup.value] : makePopupContent(feature);
      console.log(html);

      // create popup
      const coords = e.coordinates;
      new mapboxgl.Popup()
        .setLngLat([coords.lng, coords.lat])
        .setHTML(html.join("\n"))
        .addTo(map);
    });
  }

  map.on("load", () => map.addLayer(cartoLayer));
  // return cartoLayer;
}
