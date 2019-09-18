#' Map properties
#'
#' @param style basemap style
#' @param center longitude, latitude
#' @param zoom zoom
#' @export
map_properties <- function(
  style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
  center = c(0, 0),
  zoom = 2) {
  list(
    style = style,
    center = center,
    zoom = zoom
  )
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
