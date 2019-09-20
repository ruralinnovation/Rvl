#' Add a source to the map
#'
#' @inheritParams add_layer
#' @param data source object
#' @param id The id of the source to add.
#' @export
add_source <- function(map, data, id = "source", ...) {
  if (inherits(data, "sf")) data <- geojsonsf::sf_geojson(data)

  props <- list(
    id = id,
    df = inherits(data, "data.frame"),
    ...
  )
  invoke_method(map, "addMapboxSource", data, props)
}

#' Add a layer using the mapbox style specification to the map
#'
#' @inheritParams add_layer
#' @param source_id The id of the source to get data from.
#' @param style style conforming to the mapbox style specification
#' @param id unique id of the style, will be added to \code{style}
#' @export
add_mapbox_layer <- function(map, source_id, style, id = "mapbox-layer") {
  style <- utils::modifyList(
    style,
    list(
      id = id,
      source = source_id
    )
  )
  invoke_method(map, "addMapboxLayer", style)
}

#' Make a mapbox text style
#'
#' @param text_field Value to use for a text label.
#' @param text_color The color with which the text will be drawn.
#' @param text_size The size with which the text will be drawn. Units are in pixels.
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
