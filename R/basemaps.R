#' Add a base map from mapbox to the map widget
#'
#' @inheritParams add_layer
#' @param token mapbox api access token
#' @param style map style
#'
#' @export
add_mapbox_basemap <- function(map, token = Sys.getenv("MAPBOX_API_TOKEN"), style = "mapbox://styles/mapbox/light-v9") {
  map$x$mapProperties <- utils::modifyList(
    map$x$mapProperties,
    list(
      style = style,
      mapboxAccessToken = token
    )
  )
  map
}
