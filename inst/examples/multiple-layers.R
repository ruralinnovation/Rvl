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
# centers <- sf::st_centroid(spData::us_states) %>% sf::st_as_sf() %>% geojsonio::geojson_json()

map <- cartovl() %>%
  add_control() %>%
  add_source(us_states, "us_states") %>%
  set_view(-100, 38, 3) %>%
  add_external_geojson_layer(
    data_url,
    list(
      "color: ramp($state, vivid)",
      "width: 5",
      "@popup: $state"
    ),
    popup = TRUE
  ) %>%
  add_layer(
    "us_states",
    list(
      "color: opacity(ramp($NAME, vivid), 0.4)"
    ),
    id = "state-polygons"
  ) %>%
  add_mapbox_layer(
    "us_states", text_style, id = "labels"
  )

if (interactive()) map
