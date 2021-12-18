library(magrittr)
library(tibble)
library(cartovl)

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/scatterplot/manhattan.json"
)

persons <- data_url %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  as_tibble() %>%
  set_names(c("lng", "lat", "sex")) %>%
  dplyr::mutate(sex = ifelse(sex == 1, "male", "female"))

# persons$sex <- ifelse(persons$sex == 1, "m", "f")

# persons_geojson <- geojsonio::geojson_json(persons)

cartovl() %>%
  set_view(-73.985130, 40.758896, 11) %>%
  add_control() %>%
  add_layer(
    # data = persons_geojson,
    data = persons,
    viz_def = list("color: ramp(buckets($sex, ['male', 'female']), [red, blue])"),
    legend = TRUE
  )
