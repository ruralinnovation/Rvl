library(sf)
library(geojsonio)
library(Rvl)

nc_geojson <- system.file("shape/nc.shp", package = "sf") %>%
  st_read() %>%
  geojson_json()

viz_def <- list(
  "color: ramp($AREA, [midnightblue, gold])",
  "filter: $AREA > 0.16",
  "@name: $NAME"
)

viz_def2 <- list(
  "color: ramp(globalQuantiles($AREA, 3), [midnightblue, gold])",
  "@name: $NAME"
)

map <- cartovl() %>%
  add_source(nc_geojson, "nc") %>%
  add_control("NavigationControl", showCompass = FALSE) %>%
  set_view(-79.89042, 35.23582, 6) %>%
  add_layer("nc", viz_def2, popup = TRUE, legend = TRUE)
  # add_layer(nc_geojson, viz_def, popup = TRUE)

if (interactive()) map
