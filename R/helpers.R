modify_map_parameters <- function(map, ...) {
  map$x$mapProperties <- utils::modifyList(map$x$mapProperties, list(...))
  map
}
