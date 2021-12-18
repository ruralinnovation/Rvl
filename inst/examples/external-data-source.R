library(cartovl)

source <- "https://libs.cartocdn.com/carto-vl/assets/stations.geojson"

map <- cartovl() %>%
  set_view(-77.04, 38.89, 9) %>%
  add_external_geojson_layer(source, list("@popup: $name"), popup = TRUE)

if (interactive()) map
