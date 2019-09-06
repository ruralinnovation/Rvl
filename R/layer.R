#' Add a layer to the map
#'
#' @param map map widget
#' @param data data (geojson)
#' @param viz_def visualization definition, character vector; if set to \code{NULL}
#'   a default style will be applied
#' @param id unique layer id
#' @export
add_layer <- function(map, data, viz_def = list(), id = "layer") {
  n <- length(map$x$layers)
  map$x$layers[[n + 1]] <- list(
    data = data,
    vizDef = viz_def,
    id = id
  )
  map
}
