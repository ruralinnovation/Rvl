library(geojsonio)
library(cartovl)

sample_data <- geojson_json(quakes)

viz_def <- list(
  "color: green",
  "width: 5",
  "filter: $mag > 5.2",
  "@popup: $mag"
)

map <- cartovl() %>%
  add_raster_tiles() %>%
  set_view(176.9, -24.655, 2) %>%
  add_layer(sample_data, viz_def, popup = TRUE) %>%
  add_box("<h1>quakes</h1>")

if (interactive()) map
