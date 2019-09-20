#' Add raster tiles to the map
#'
#' @inheritParams add_layer
#' @param tiles A vector of one or more tile source URLs,
#'   e. g. \code{https://stamen-tiles.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.jpg}
#' @param attribution The attribution which will be displayed on the map.
#' @export
add_raster_tiles <- function(map, tiles = NULL, attribution = NULL) {
  modify_map_parameters(map, rasterStyle = list(tiles = tiles, attribution = attribution))
}
