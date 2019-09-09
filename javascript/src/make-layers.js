import df2geojson from "./helpers/df2geojson";

export default function(layers) {
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
        console.log(feature.variables.popup.value); // needs popup variable to be set
      });
    }

    return cartoLayer;
  });
}
