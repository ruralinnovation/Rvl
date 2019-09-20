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

map <- cartovl() %>%
  add_carto_basemap() %>%
  set_view(-73.985130, 40.758896, 11) %>%
  add_control() %>%
  add_layer(
    data = persons,
    viz_def = list("color: ramp(buckets($sex, ['male', 'female']), [red, blue])"),
    legend = TRUE # list(style = "color: white; background: #2b2d2f;")
  )

if (interactive()) map
