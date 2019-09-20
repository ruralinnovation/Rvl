## TODO: rename to 'map_options'!?
#' Map properties / options
#'
#' Properties like \code{center} or \code{zoom} are usually set via \link{set_view}.
#' The \code{style} can be set by functions like \link{add_carto_basemap} and others.
#' @param style The mapbox style of the map.
#' @param min_zoom The minimum zoom level of the map (0 - 24).
#' @param max_zoom The maximum zoom level of the map (0 - 24).
#' @param center The inital geographical centerpoint of the map (longitude, latitude coordinate order).
#' @param zoom The initial zoom level of the map.
#' @param ... more properties, see \href{https://docs.mapbox.com/mapbox-gl-js/api/}{mabox-gl API reference}
#' @export
map_properties <- function(
  style = NULL,
  min_zoom = NULL,
  max_zoom = NULL,
  center = c(0, 0),
  zoom = 2,
  ...) {
  props <- list(
    style = style,
    minZoom = min_zoom,
    maxZoom = max_zoom,
    center = center,
    zoom = zoom,
    ...
  )
  props[lengths(props) != 0]
}

#' Set the view of the map
#'
#' @inheritParams add_layer
#' @param longitude The longitude of the geographical centerpoint of the map.
#' @param latitude The latitude of the  geographical centerpoint of the map.
#' @param zoom The zoom level of the map.
#' @param pitch The pitch (tilt) of the map, measured in degrees away from the plane of the screen (0 - 60).
#' @param bearing The bearing (rotation) of the map, measured in degrees counter-clockwise from north.
#' @export
set_view <- function(map, longitude, latitude, zoom = 2, pitch = 0, bearing = 0) {
  modify_map_parameters(map, center = c(longitude, latitude), zoom = zoom, pitch = pitch, bearing = bearing)
}
