export default function(content, position) {
  const map = this;
  const widgetElement = map.getContainer();
  const boxElement = document.createElement("div");
  // boxElement.className = "map-overlay";
  boxElement.className = `box box-${position || "top-right"}`;
  boxElement.innerHTML = content;
  widgetElement.appendChild(boxElement);
}
