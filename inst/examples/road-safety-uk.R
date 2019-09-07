library(cartovl)

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/3d-heatmap/heatmap-data.csv"
)
sample_data <- data.table::fread(data_url) %>%
  na.omit()

viz_def <- list(
  "width: 5"
)

map <- cartovl() %>%
  set_view(-1.4157267858730052, 52.232395363869415, 4) %>%
  add_layer(sample_data, viz_def)

if (interactive()) map
