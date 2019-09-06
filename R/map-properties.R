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
#' @param longitude longitude
#' @param latitude latitude
#' @param zoom zoom
#' @export
set_view <- function(map, longitude, latitude, zoom = 2) {
  #map$x$mapProperties <- utils::modifyList(
  #  map$x$mapProperties,
  #  list(
  #    center = c(longitude, latitude),
  #    zoom = zoom
  #  )
  #)
  #map
  modify_map_parameters(map, center = c(longitude, latitude), zoom = zoom)
}
