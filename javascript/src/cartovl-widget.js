import makeLayers from "./make-layers";
// import df2geojson from "./helpers/df2geojson";

const _cartoVLWidget = global._cartoVLWidget = {};
// _cartoVLWidget.df2geojson = df2geojson;

export default function(widgetElement, width, height) {
  const widget = {};

  var map = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    logVersions();
    mapboxgl.accessToken = widgetData.mapProperties.mapboxAccessToken;
    map = _cartoVLWidget.map = makeMap(widgetElement.id, widgetData.mapProperties);
    if (widgetData.controls.nav) {
      const nav = widgetData.controls.nav;
      addNavigationControlTo(map, nav.props, nav.position);
    }

    const layers = _cartoVLWidget.layers = makeLayers(widgetData.layers);
    layers.forEach((layer) => layer.addTo(map));
  };

  widget.resize = function(width, height) { };

  return widget;
}

const logVersions = function() {
    console.log("carto-vl " + carto.version);
    console.log("mapbox-gl " + mapboxgl.version);
  };

const makeMap = function(elementId, properties) {
  const map = new mapboxgl.Map({
    container: elementId,
    style: properties.style || MAP_BACKGROUND, // carto.basemaps.voyager,
    center: properties.center || [0, 30],
    zoom: properties.zoom || 2
  });
  return map;
};

const MAP_BACKGROUND = {
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

const addNavigationControlTo = function(map, props, position) {
  const navControl = new mapboxgl.NavigationControl(props);
  map.addControl(navControl, position || "top-left");
};
