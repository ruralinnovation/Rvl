
<!-- README.md is generated from README.Rmd. Please edit that file -->
An R Interace to carto-vl
=========================

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

Cartovl for R makes the open-source JavaScript library [carto-vl](https://carto.com/developers/carto-vl/) available within R via the [htmlwidgets](https://www.htmlwidgets.org/) package.

Notes
-----

-   The package development is in an early state.
-   Please check the [examples](https://github.com/crazycapivara/cartovl/tree/master/inst/examples) as a starting point.

Installation
------------

You can install the latest version of cartovl from github with:

``` r
# install.packages("devtools")
devtools::install_github("crazycapivara/cartovl")
```

Example
-------

``` r
library(sf)
library(geojsonio)

nc_geojson <- system.file("shape/nc.shp", package = "sf") %>%
  st_read() %>%
  geojson_json()

viz_def <- list(
  "color: ramp($AREA, [midnightblue, gold])"
)

map <- cartovl() %>%
  set_view(-79.89042, 35.23582, 6) %>%
  add_layer(nc_geojson, viz_def)

if (interactive()) map
```
