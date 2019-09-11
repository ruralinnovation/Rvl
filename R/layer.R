### TODO: Rename to 'add_carto_layer'
#' Add a layer to the map
#'
#' @param map map widget created by \link{cartovl}
#' @param data data (geojson)
#' @param viz_def visualization definition, character vector; if set to \code{NULL}
#'   a default style will be applied
#' @param id unique layer id
#' @param ... more props
#' @export
add_layer <- function(map, data, viz_def = list(), id = "layer", ...) {
  n <- length(map$x$layers)
  map$x$layers[[n + 1]] <- list(
    data = data,
    vizDef = viz_def,
    id = id,
    props = list(..., df = inherits(data, "data.frame"))
  )
  map
}

#' @export
add_carto_layer <- function(map, data, viz_def = list(), id = "layer", ...) {
  invoke_method(map, "addLayer", data, viz_def, id, list(...))
}
