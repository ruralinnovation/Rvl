#' Create a mapbox-gl / carto-vl (map) widget
#'
#' @param properties properties passed to \code{mapboxgl.Map}
#' @param width styled width of the widget
#' @param height styled height of the widget
#' @param minWidth minimum width
#' @param minHeight minimum height
#' @param element_id explicit element id (usually not needed)
#' @import htmlwidgets
#' @export
cartovl <- function(properties = map_properties(), width = NULL, height = NULL, minWidth = "480px", minHeight = "360px", element_id = NULL) {

  # forward options using x
  x <- list(
    mapProperties = properties,
    calls = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = "cartovl",
    x,
    width = width,
    height = height,
    package = "Rvl",
    elementId = element_id,
    sizingPolicy = htmlwidgets::sizingPolicy(
        defaultWidth = minWidth, 
        defaultHeight = minHeight, 
        browser.defaultWidth = width,
        browser.defaultHeight = height, 
        fill = TRUE
    )
  )
}

#' Shiny bindings for carto-vl
#'
#' Output and render functions for using cartovl within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a carto-vl
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rvlOutput
#' @rdname rvlOutput
#'
#' @export
rvlOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "cartovl", width, height, package = "Rvl")
}

#' @rdname renderVL
#' @export
renderVL <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rvlOutput, env, quoted = TRUE)
}
