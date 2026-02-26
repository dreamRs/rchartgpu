
#' Scatter Plot with ChartGPU
#'
#' @param data A `data.frame`.
#' @param mapping Default list of aesthetic mappings to use for chart.
#' @inheritParams htmlwidgets::createWidget
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @example examples/scattergpu.R
scattergpu <- function(data, mapping = NULL, width = NULL, height = NULL, elementId = NULL) {
  chartgpu(
    data = data,
    mapping = mapping,
    type = "scatter",
    width = width,
    height = height,
    elementId = elementId
  )
}
