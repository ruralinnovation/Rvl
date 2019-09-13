polygon_style <- list(
  type = "fill",
  paint = list(
    "fill-color" = "white",
    "fill-outline-color" = "red"
  ),
  filter = list(">", "AREA", 0.2)
)

cartovl() %>%
  set_view(-79.89042, 35.23582, 6) %>%
  add_source(nc_geojson, "nc") %>%
  add_mapbox_layer("nc", polygon_style)
