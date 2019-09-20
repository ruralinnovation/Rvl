import df2geojson from "./helpers/df2geojson";
import addBox from "./box";

const makePopupContent = function(feature) {
  const keys = Object.keys(feature.variables);
  return keys.map(key => `<h1>${key}</h1><p>${feature.variables[key].value}</p>`);
};

export function addMapboxSource(data, props) {
  const map = this;
  if (props.df) data = df2geojson(data, props);

  map.on("load", () => map.addSource(props.id, { type: "geojson", data: data }));
}

export function addMapboxLayer(style) {
  const map = this;
  map.on("load", () => map.addLayer(style));
}

// TODO: Maybe rename to 'addCartoLayer'
export function addLayer(data, props) {
  const map = this;
  map.on("load", () => {
    if (props.df) {
      data = df2geojson(data, props);
    } else if (typeof data === "string") {
      data = map.getSource(data)._data;
    }

    const source = new carto.source.GeoJSON(data);
    const layer = makeLayer(map, source, props);
    layer.addTo(map);
  });
}

export function addExternalLayer(url, props) {
  const map = this;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      const source = new carto.source.GeoJSON(data);
      makeLayer(map, source, props).addTo(map);
      // map.on("load", () => map.addLayer(makeLayer(map, source, props)));
    });
}

export function addDatasetLayer(name, props) {
  const map = this;
  const source = new carto.source.Dataset(name);
  makeLayer(map, source, props).addTo(map);
}

const makeLayer = function(map, source, props) {
  // const source = new carto.source.GeoJSON(data);
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

  if (props.legend) {
    cartoLayer.on("loaded", () => {
      const legendData = cartoLayer.viz.color.getLegendData();
      const items = legendData.data.map(item => {
        const color = item.value;
        const rgba = `rgba(${color.r}, ${color.g}, ${color.b}, ${color.a})`;
        const key = (item.key instanceof Array) ? `${item.key[0]} - ${item.key[1]}` : item.key;
        return `<li><span class="point-mark" style="background-color:${rgba};border: 1px solid black;"></span> <span>${key}</span></li>`;
    });
    const legendTitle = props.legend.title ? `<h1>${props.legend.title}</h1>` : "";
    const legendContent = legendTitle + `<ul>${items.join("\n")}</ul>`;
    addBox.call(map, legendContent, props.legend.position, props.legend.style);
    });
  }

  return cartoLayer;
};
