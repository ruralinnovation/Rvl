#' Add a box to the map
#'
#' @inheritParams add_layer
#' @param html The text which will be displayed on the map
#' @export
add_box <- function(map, html) {
  invoke_method(map, "addBox", html)
}
