export default function(html) {
  let map = this;
  let widgetElement = map.getContainer();
  let boxElement = document.createElement("div");
  boxElement.className = "map-overlay";
  boxElement.innerHTML = html;
  widgetElement.appendChild(boxElement);
}
