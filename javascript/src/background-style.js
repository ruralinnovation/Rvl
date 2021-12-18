export default function(color) {
  return {
    version: 8,
    sources: { },
    layers: [
      {
        id: "background",
        type: "background",
        paint: { "background-color": color }
      }
    ]
  };
}
