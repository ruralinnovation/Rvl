export default function(layers) {
  return layers.map((layer) => {
    let source = new carto.source.GeoJSON(layer.data);
    layer.vizDef = layer.vizDef || [];
    let viz = new carto.Viz(layer.vizDef.join("\n"));
    return new carto.Layer(layer.id, source, viz);
  });
}
