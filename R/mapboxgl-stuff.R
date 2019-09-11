#' @export
add_source <- function(map, data, id = "source", ...) {
  props <- list(
    id = id,
    df = inherits(data, "data.frame"),
    ...
  )
  invoke_method(map, "addMapboxSource", data, props)
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
