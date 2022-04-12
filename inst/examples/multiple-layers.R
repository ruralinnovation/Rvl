library(sf)
library(geojsonio)
library(Rvl)

text_style <- list(
  type = "symbol",
  layout = list(
    "text-field" = "{NAME}"
  ),
  paint = list(
    "text-color" = "white"
  )
)

data_url <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/highway/roads.json"

nc_state <- system.file("shape/nc.shp", package = "sf") %>%
  st_read() %>%
  geojson_json()

map <- cartovl() %>%
  add_control() %>%
  add_source(nc_state, "north_carolina") %>%
  set_view(-100, 38, 3) %>%
  add_layer(
    "north_carolina",
    list(
      "color: opacity(ramp($NAME, vivid), 0.4)"
    ),
    id = "state-polygons"
  ) %>%
  add_external_geojson_layer(
    data_url,
    list(
      "color: ramp($state, vivid)",
      "width: 5",
      "@popup: $state"
    ),
    id = "roads",
    popup = TRUE
  ) %>%
  add_mapbox_layer(
    "north_carolina", text_style, id = "labels"
  )

if (interactive()) map
