#' @export
map_properties <- function(style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json", center = c(0, 0), zoom = 2) {
  list(
    style = style,
    center = center,
    zoom = zoom
  )
}

#' @export
set_view <- function(map, longitude, latitude, zoom) {
  map$x$mapProperties <- modifyList(
    map$x$mapProperties,
    list(
      center = c(longitude, latitude),
      zoom = zoom
      )
    )
  map
}
