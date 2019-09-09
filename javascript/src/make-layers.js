import df2geojson from "./helpers/df2geojson";

export default function(map, layers) {
  return layers.map(layer => {
    if (layer.props.df) {
      layer.data = df2geojson(layer.data, layer.props);
    }

    const source = new carto.source.GeoJSON(layer.data);
    layer.vizDef = layer.vizDef || [];
    const viz = new carto.Viz(layer.vizDef.join("\n"));
    const cartoLayer = new carto.Layer(layer.id, source, viz);

    // TEST interactivity
    if (layer.props.popup) {
      const interactivity = new carto.Interactivity(cartoLayer);
      interactivity.on("featureClick", e => {
        const feature = e.features[0];
        if (!feature) return;

        const value = feature.variables.popup.value; // needs popup variable to be set
        console.log(value);

        // create popup
        const coords = e.coordinates;
        new mapboxgl.Popup(value)
          .setLngLat([coords.lng, coords.lat])
          .setHTML(value)
          .addTo(map);
      });
    }

    return cartoLayer;
  });
}
