#' Set default authentication parameters: user and API key
#'
#' @inheritParams add_layer
#' @param user_name name of the user
#' @param api_key API key used to authenticate against CARTO.
#' @export
set_default_auth <- function(map, user_name = "cartovl", api_key = "default_public") {
  props <- list(
    username = user_name,
    apiKey = api_key
  )
  invoke_method(map, "setDefaultAuth", props)
}

#' Add a (CARTO) dataset layer to the map
#'
#' @inheritParams add_layer
#' @param dataset_name name of the dataset which will be add to the map
#' @export
add_dataset_layer <- function(map, dataset_name, viz_def = list(), id = "dataset-layer", ...) {
  props <- list(
    dataset = dataset_name,
    id = id,
    vizDef = viz_def,
    ...
  )
  invoke_method(map, "addDatasetLayer", dataset_name, props)
}
