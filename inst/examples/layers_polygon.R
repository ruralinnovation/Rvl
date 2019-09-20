library(sf)
library(cartovl)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read()

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
  add_carto_basemap("voyager") %>%
  add_source(nc, "nc") %>%
  add_control("NavigationControl", showCompass = FALSE) %>%
  set_view(-79.89042, 35.23582, 6) %>%
  add_layer("nc", viz_def2, popup = TRUE, legend = TRUE)

if (interactive()) map
