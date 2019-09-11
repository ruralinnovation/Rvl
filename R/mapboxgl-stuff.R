#' @export
add_source <- function(map, data, id = "source") {
  invoke_method(map, "addMapboxSource", data, id)
}

#' @export
add_mapbox_layer <- function(map, source_name, style, id = "mapbox-layer") {
  style <- utils::modifyList(
    style,
    list(
      id = id,
      source = source_name
    )
  )
  invoke_method(map, "addMapboxLayer", style)
}

#' @export
add_control2 <- function(map, name = "NavigationControl", position = "top-left", ...) {
  invoke_method(map, "addControl", name, list(...), position)
}
