#' Add a (text) box to the map
#'
#' @inheritParams add_layer
#' @param content The text which will be displayed on the map
#' @param position position on the map
#' @export
add_box <- function(map, content, position = "top-right") {
  invoke_method(map, "addBox", content, position)
}
