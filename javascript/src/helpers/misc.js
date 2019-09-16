const rgbToHex = function(color) {
  return "#" + ((1 << 24) + (color.r << 16) + (color.g << 8) + color.b).toString(16).slice(1);
};

const getLayer = function(map, id) {
 return map.getLayer(id)._implementation;
};
