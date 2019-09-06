library(geojsonio)
library(cartovl)

sample_data <- geojson_json(quakes)

viz_def <- list(
  "color: green",
  "width: 5"
)

map <- cartovl() %>%
  set_view(176.9, -24.655, 2) %>%
  add_layer(sample_data, viz_def)

if (interactive()) map
