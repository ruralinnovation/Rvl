import df2geojson from "./helpers/df2geojson";

export default function(layers) {
  return layers.map((layer) => {
    if (layer.props.df) {
      layer.data = df2geojson(layer.data, layer.props);
    }

    const source = new carto.source.GeoJSON(layer.data);
    layer.vizDef = layer.vizDef || [];
    const viz = new carto.Viz(layer.vizDef.join("\n"));
    return new carto.Layer(layer.id, source, viz);
  });
}
