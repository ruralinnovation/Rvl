## TODO: Obsolete, remove!
add_layer_ <- function(map, data, viz_def = list(), id = "layer", ...) {
  n <- length(map$x$layers)
  map$x$layers[[n + 1]] <- list(
    data = data,
    vizDef = viz_def,
    id = id,
    props = list(..., df = inherits(data, "data.frame"))
  )
  map
}
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
  if (inherits(data, "sf")) data <- geojsonsf::sf_geojson(data)

  props <- list(
    id = id,
    vizDef = viz_def,
    df = inherits(data, "data.frame"),
    ...
  )
  invoke_method(map, "addLayer", data, props)
}

#' Add an external layer to the map
#'
#' @inheritParams add_layer
#' @param source url of the geojson data source
#' @export
add_external_geojson_layer <- function(map, source, viz_def = list(), id = "external-layer", ...) {
  props <- list(
    id = id,
    vizDef = viz_def,
    ...
  )
  invoke_method(map, "addExternalLayer", source, props)
}
