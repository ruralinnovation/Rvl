export default function(layers) {
  return layers.map((layer) => {
    let source = new carto.source.GeoJSON(layer.data);
    let viz = new carto.Viz();
    return new carto.Layer(layer.id, source, viz);
  });
}
