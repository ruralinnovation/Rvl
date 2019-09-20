## TODO: Maybe use 'cssText' instead of list
#' Add a (text) box to the map
#'
#' @inheritParams add_layer
#' @param content The text which will be displayed on the map.
#' @param position The position on the map.
#' @param style CSS options in the form of \emph{cssText} applied to the element.
#' @export
add_box <- function(map, content, position = "top-right", style = "") {
  invoke_method(map, "addBox", content, position, style)
}
