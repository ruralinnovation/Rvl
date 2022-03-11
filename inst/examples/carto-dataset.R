library(Rvl)

viz_def <- list(
  "width: 7",
  "color: ramp($weather,[darkorange,darkviolet,darkturquoise])",
  "strokeWidth: 0.2",
  "strokeColor: black"
)

map <- cartovl() %>%
  set_view(-96, 41, 4) %>%
  add_box("<b>Rail Accidents by Weather</b>") %>%
  set_default_auth() %>%
  add_dataset_layer("railroad_accidents", viz_def, legend = list(position = "bottom-left"))

if (interactive()) map

