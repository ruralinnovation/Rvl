import backgroundStyle from "./background-style";
import makeLayers from "./make-layers";

const _cartoVLWidget = global._cartoVLWidget = {};

export default function(widgetElement, width, height) {
  const widget = {};

  var map = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    logVersions();
    mapboxgl.accessToken = widgetData.mapProperties.mapboxAccessToken;
    map = _cartoVLWidget.map = makeMap(widgetElement.id, widgetData.mapProperties);
    addControls(map, widgetData.controls);
    const layers = _cartoVLWidget.layers = makeLayers(map, widgetData.layers);

    // TODO: add layers in 'makeLayers' func
    layers.forEach(layer => layer.addTo(map));
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

const addControls = function(map, controls) {
  controls.forEach(control => {
    map.addControl(new mapboxgl[control.name](control.props), control.position || "top-left");
  });
};
