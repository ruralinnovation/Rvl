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

#' Make a mapbox text style
#'
#' @param text_field Value to use for a text label.
#' @param text_color The color with which the text will be drawn.
#' @param text-size The size with which the text will be drawn. Units are in pixels.
#' @export
mapbox_text_style <- function(text_field, text_color = "white", text_size = 10) {
  list(
    type = "symbol",
    layout = list(
      "text-field" = sprintf("{%s}", text_field),
      "text-size" = text_size
    ),
    paint = list(
      "text-color" = "white"
    )
  )
}
