library(magrittr)
library(tibble)

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/scatterplot/manhattan.json"
)

persons <- data_url %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  as_tibble() %>%
  set_names(c("lng", "lat", "sex"))

# persons_geojson <- geojsonio::geojson_json(persons)

cartovl() %>%
  set_view(-73.985130, 40.758896, 11) %>%
  add_layer(
    # data = persons_geojson,
    data = persons,
    viz_def = list("color: ramp($sex, [red, blue])")
  )
