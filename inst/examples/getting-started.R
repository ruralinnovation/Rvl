library(geojsonio)
library(cartovl)

sample_data <- geojson_json(quakes)
viz_def <- c(
  "color: green",
  "width: 15"
)

map <- cartovl(properties = map_properties(center = c(175.1982, 21.1790))) %>%
  add_layer(sample_data, viz_def)

if (interactive()) map
