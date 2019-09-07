#' Add navigation control to the map
#'
#' @inheritParams add_layer
#' @param position position on the map
#' @param ... more options passed to the navigation control
#'
#' @export
add_navigation_control <- function(map, position = "top-left", ...) {
  map$x$controls$nav <- list(
    position = position,
    props = list(...)
  )
  map
}
