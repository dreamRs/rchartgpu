
#' Shiny bindings for chartgpu
#'
#' Output and render functions for using [chartgpu()] within Shiny
#' applications and interactive Rmd documents.
#'
#' @inheritParams htmlwidgets::shinyWidgetOutput
#' @inheritParams htmlwidgets::shinyRenderWidget
#'
#' @name chartgpu-shiny
#'
#' @export
chartgpuOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "chartgpu", width, height, package = "rchartgpu")
}

#' @rdname chartgpu-shiny
#' @export
renderChartgpu <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, chartgpuOutput, env, quoted = TRUE)
}
