library(geojsonio)
library(cartovl)

sample_data <- geojson_json(quakes)

map <- cartovl(properties = map_properties(center = c(175.1982, 21.1790))) %>%
  add_layer(sample_data)

if (interactive()) map
