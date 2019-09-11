library(sf)
library(geojsonio)
library(cartovl)

nc_geojson <- system.file("shape/nc.shp", package = "sf") %>%
  st_read() %>%
  geojson_json()

viz_def <- list(
  "color: ramp($AREA, [midnightblue, gold])",
  "filter: $AREA > 0.16",
  "@name: $NAME"
)

map <- cartovl() %>%
  add_source(nc_geojson) %>%
  add_control("NavigationControl", showCompass = FALSE) %>%
  set_view(-79.89042, 35.23582, 6) %>%
  add_layer(nc_geojson, viz_def, popup = TRUE)
  # add_layer(nc_geojson, viz_def, popup = TRUE)

if (interactive()) map
