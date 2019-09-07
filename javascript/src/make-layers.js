import df2geojson from "./helpers/df2geojson";

export default function(layers) {
  return layers.map((layer) => {
    if (layer.df) {
      layer.data = df2geojson(layer.data, layer.longitude, layer.latitude);
    }
    let source = new carto.source.GeoJSON(layer.data);
    layer.vizDef = layer.vizDef || [];
    let viz = new carto.Viz(layer.vizDef.join("\n"));
    return new carto.Layer(layer.id, source, viz);
  });
}
