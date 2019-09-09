#' Add a control to the map
#'
#' @inheritParams add_layer
#' @param name name of the control
#' @param position position on the map
#' @param ... options passed to the control
#' @export
add_control <- function(map, name = "NavigationControl", position = "top-left", ...) {
  n <- length(map$x$controls)
  map$x$controls[[n + 1]] <- list(
    name = name,
    props = list(...),
    position = position
  )
  map
}
