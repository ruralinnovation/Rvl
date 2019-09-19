import backgroundStyle from "./background-style";
import rasterStyle from "./raster-style";
import { addMapboxSource, addMapboxLayer, addLayer, addExternalLayer, addDatasetLayer } from "./layer";
import addBox from "./box";

const _cartoVLWidget = global._cartoVLWidget = {};
_cartoVLWidget.rasterStyle = rasterStyle;

// TODO: methods do not need to global
const methods = _cartoVLWidget.methods = {
  addLayer: addLayer,
  addExternalLayer: addExternalLayer,
  addMapboxSource: addMapboxSource,
  addMapboxLayer: addMapboxLayer,
  addDatasetLayer: addDatasetLayer,
  addBox: addBox
};

methods.addControl = function(className, props, position) {
  const map = this;
  map.addControl(new mapboxgl[className](props), position || "top-left");
};

methods.setDefaultAuth = carto.setDefaultAuth;

export default function(widgetElement, width, height) {
  const widget = {};

  let map = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    logVersions();
    mapboxgl.accessToken = widgetData.mapProperties.mapboxAccessToken;
    map = _cartoVLWidget.map = makeMap(widgetElement.id, widgetData.mapProperties);
    map.on("idle", () => console.log("ready"));

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
  properties.container = elementId;
  if (properties.cartoStyle) {
    properties.style = carto.basemaps[properties.cartoStyle];
  } else if (properties.rasterStyle) {
    properties.style = rasterStyle(properties.rasterStyle);
  } else if (!properties.style) {
    properties.style = backgroundStyle(properties.background || "white");
  }

  return new mapboxgl.Map(properties);
  /*
  const map = new mapboxgl.Map({
    container: elementId,
    style: properties.style || backgroundStyle("black"), // carto.basemaps.voyager,
    center: properties.center || [0, 30],
    zoom: properties.zoom || 2
  });
  return map;
  */
};
