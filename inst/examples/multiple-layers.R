library(cartovl)

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

us_states <- geojsonio::geojson_json(spData::us_states)

map <- cartovl() %>%
  add_carto_basemap("darkmatter") %>%
  add_control() %>%
  add_source(us_states, "us_states") %>%
  set_view(-100, 38, 3) %>%
  add_layer(
    "us_states",
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
    "us_states", text_style, id = "labels"
  )

if (interactive()) map
