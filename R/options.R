
#' Update configuration of series
#'
#' @param chart A chart created with [chartgpu()].
#' @param name Name of the serie (name of the variable in the data used)
#' @param label Label for display.
#' @param color Color for the serie.
#' @param ... Other options.
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @importFrom utils modifyList
#'
#' @example examples/chartgpu_serie.R
chartgpu_serie <- function(chart, name, label = NULL, color = NULL, ...) {
  stopifnot("`chart` must have been created with `chartgpu`" = inherits(chart, "chartgpu"))
  stopifnot("`name` must be of length 1" = length(name) == 1)
  idx <- which(chart$x$series_names == name)
  stopifnot("Serie not found!" = length(idx) == 1)
  chart$x$options$series[[idx]] <- modifyList(
    x = chart$x$options$series[[idx]],
    val = dropNulls(list(name = label, color = color, ...))
  )
  return(chart)
}
