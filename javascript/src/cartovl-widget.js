export default function(widgetElement, width, height) {
  var widget = {};

  var map = null;

  widget.renderValue = function(widgetData) {
    // widgetElement.innerText = widgetData.message;

    map = makeMap(widgetElement.id);
  };

  widget.resize = function(width, height) { };

  return widget;
}

var makeMap = function(elementId) {
  const map = new mapboxgl.Map({
    container: elementId,
    style: carto.basemaps.voyager,
    center: [0, 30],
    zoom: 2
  });
  return map;
};
