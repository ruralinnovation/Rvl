import df2geojson from "./helpers/df2geojson";

const makePopupContent = function(feature) {
  const keys = Object.keys(feature.variables);
  return keys.map(key => `<h1>${key}</h1><p>${feature.variables[key].value}</p>`);
};

export function addMapboxSource(data, props) {
  let map = this;
  if (props.df) data = df2geojson(data, props);

  map.on("load", () => map.addSource(props.id, { type: "geojson", data: data }));
}

export function addMapboxLayer(style) {
  let map = this;
  map.on("load", () => map.addLayer(style));
}

// TODO: Maybe rename to 'addCartoLayer'
export function addLayer(data, props) {
  let map = this;
  map.on("load", () => {
    if (props.df) {
      data = df2geojson(data, props);
    } else if (typeof data === "string") {
      data = map.getSource(data)._data;
    }

    const layer = makeLayer(map, data, props);
    layer.addTo(map);
  });
}

export function addExternalLayer(source, props) {
  let map = this;
  fetch(source)
    .then(response => response.json())
    .then(data => {
      makeLayer(map, data, props).addTo(map);
    });
}

const makeLayer = function(map, data, props) {
  const source = new carto.source.GeoJSON(data);
  const viz = new carto.Viz(props.vizDef.join("\n"));
  const cartoLayer = new carto.Layer(props.id, source, viz);

  // Interactivity
  if (props.popup) {
    const interactivity = new carto.Interactivity(cartoLayer);
    interactivity.on("featureClick", e => {
      const feature = e.features[0];
      if (!feature) return;

      const html = feature.variables.popup ? [feature.variables.popup.value] : makePopupContent(feature);
      console.log(html);

      // create popup
      const coords = e.coordinates;
      new mapboxgl.Popup()
        .setLngLat([coords.lng, coords.lat])
        .setHTML(html.join("\n"))
        .addTo(map);
    });
  }

  return cartoLayer;
};
