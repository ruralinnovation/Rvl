import backgroundStyle from "./background-style";
import makeLayers from "./make-layers";

const _cartoVLWidget = global._cartoVLWidget = {};

const methods = {};

methods.addControl = function(className, props, position) {
  let map = this;
  map.addControl(new mapboxgl[className](props), position || "top-left");
};

methods.addMapboxSource = function(data, id) {
  let map = this;
  map.on("load", () => map.addSource(id, { type: "geojson", data: data }));
};

methods.addMapboxLayer = function(style) {
  let map = this;
  map.on("load", () => map.addLayer(style));
};

export default function(widgetElement, width, height) {
  const widget = {};

  var map = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    logVersions();
    mapboxgl.accessToken = widgetData.mapProperties.mapboxAccessToken;
    map = _cartoVLWidget.map = makeMap(widgetElement.id, widgetData.mapProperties);
    // addControls(map, widgetData.controls);
    const layers = _cartoVLWidget.layers = makeLayers(map, widgetData.layers);

    // TODO: add layers in 'makeLayers' func
    layers.forEach(layer => layer.addTo(map));

    // call methods
    widgetData.calls.forEach(call => methods[call.name].apply(map, call.args));
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
    style: properties.style || backgroundStyle("black"), // carto.basemaps.voyager,
    center: properties.center || [0, 30],
    zoom: properties.zoom || 2
  });
  return map;
};

/*
const addControls = function(map, controls) {
  controls.forEach(control => {
    map.addControl(new mapboxgl[control.name](control.props), control.position || "top-left");
  });
};
*/
