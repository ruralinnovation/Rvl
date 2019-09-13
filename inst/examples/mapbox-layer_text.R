library(cartovl)

data_geojson <- geojsonio::geojson_json(quakes)

text_style <- list(
  type = "symbol",
  layout = list(
    "text-field" = "{mag}"
  ),
  paint = list(
    "text-color" = "white"
  )
)

map <- cartovl() %>%
  set_view(176.9, -24.655, 2) %>%
  # add_source(data_geojson, "quakes") %>%
  add_source(quakes, "quakes", latitude = "lat", longitude = "long") %>%
  # add_mapbox_layer("quakes", text_style) %>%
  add_mapbox_layer("quakes", mapbox_text_style("mag")) %>%
  add_control()

if (interactive()) map
