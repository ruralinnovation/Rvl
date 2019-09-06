import makeLayers from "./make-layers";

global._cartoVLWidget = {};

export default function(widgetElement, width, height) {
  var widget = {};

  var map = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    logVersions();

    mapboxgl.accessToken = widgetData.mapProperties.mapboxAccessToken;

    map = _cartoVLWidget.map = makeMap(widgetElement.id, widgetData.mapProperties);
    const layers = _cartoVLWidget.layers = makeLayers(widgetData.layers);
    layers.forEach((layer) => layer.addTo(map));
  };

  widget.resize = function(width, height) { };

  return widget;
}

var logVersions = function() {
    console.log("carto-vl " + carto.version);
    console.log("mapbox-gl " + mapboxgl.version);
  };

var makeMap = function(elementId, properties) {
  const map = new mapboxgl.Map({
    container: elementId,
    style: properties.style || MAP_BACKGROUND, // carto.basemaps.voyager,
    center: properties.center || [0, 30],
    zoom: properties.zoom || 2
  });
  return map;
};

var MAP_BACKGROUND = {
  version: 8,
  sources: { },
  layers: [
    {
      id: "background",
      type: "background",
      paint: { "background-color": "black" }
    }
  ]
};
