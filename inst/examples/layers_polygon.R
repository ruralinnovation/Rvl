library(sf)
library(geojsonio)

nc_geojson <- system.file("shape/nc.shp", package = "sf") %>%
  st_read() %>%
  geojson_json()

viz_def <- list(
  "color: ramp($AREA, [midnightblue, gold])"
)

map <- cartovl() %>%
  set_view(-79.89042, 35.23582, 6) %>%
  add_layer(nc_geojson, viz_def)

if (interactive()) map
