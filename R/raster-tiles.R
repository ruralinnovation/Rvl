#' Add raster tiles to the map
#'
#' @param tiles tile sources
#' @param attribution attribution
#' @export
add_raster_tiles <- function(map, tiles = NULL, attribution = NULL) {
  modify_map_parameters(map, rasterStyle = list(tiles = tiles, attribution = attribution))
}
