#' Add layer to map widget
#'
#' @param data data (geojson)
#' @param id unique layer id
#' @export
add_layer <- function(map, data, id = "layer") {
  n <- length(map$x$layers)
  map$x$layers[[n + 1]] <- list(
    data = data,
    id = id
  )
  map
}
