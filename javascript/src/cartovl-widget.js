export default function(widgetElement, width, height) {
  var widget = {};

  widget.renderValue = function(widgetData) {
    widgetElement.innerText = widgetData.message;
  };

  widget.resize = function(width, height) { };

  return widget;
}
