const DEFAULT_TILES = [
  "http://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
  "http://b.tile.openstreetmap.org/{z}/{x}/{y}.png",
  "http://c.tile.openstreetmap.org/{z}/{x}/{y}.png"
];

// STAMEN
// [ "https://stamen-tiles.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.jpg" ]
export default function(props) {
  const tiles = props.tiles || DEFAULT_TILES;
  const attribution = props.attribution;
  return {
    "version": 8,
    "sources": {
      "simple-tiles": {
        "type": "raster",
        "tiles": tiles instanceof Array ? tiles : [ tiles ],
        "attribution": attribution || "Attribution needs to be added.",
        "tileSize": 256
      }
    },
    "layers": [
      {
        "id": "simple-tiles",
        "type": "raster",
        "source": "simple-tiles",
        "minzoom": 0,
        "maxzoom": 22
      }
    ]
  };
}
