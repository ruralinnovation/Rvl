export default function(content, position, style) {
  const map = this;
  const widgetElement = map.getContainer();
  const boxElement = document.createElement("div");
  // boxElement.className = "map-overlay";
  boxElement.className = `box box-${position || "top-right"}`;
  // Object.assign(boxElement.style, style);
  boxElement.style.cssText = style || "";

  boxElement.innerHTML = content;
  widgetElement.appendChild(boxElement);
}
