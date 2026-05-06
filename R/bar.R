#' Bar Chart with ChartGPU
#'
#' @param data A `data.frame`.
#' @inheritParams chartgpu
#' @inheritParams htmlwidgets::createWidget
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @example examples/chartgpu_bar.R
bargpu <- function(data, mapping = NULL, width = NULL, height = NULL, elementId = NULL) {
  chartgpu(
    data      = data,
    mapping   = mapping,
    type      = "bar",
    width     = width,
    height    = height,
    elementId = elementId
  )
}