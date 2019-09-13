modify_map_parameters <- function(map, ...) {
  map$x$mapProperties <- utils::modifyList(map$x$mapProperties, list(...))
  map
}

invoke_method <- function(map, method_name, ...) {
  n <- length(map$x$calls)
  map$x$calls[[n + 1]] <- list(
    name = method_name,
    args = list(...)
  )
  map
}
