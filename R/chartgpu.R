#' @title ChartGPU
#'
#' @description
#' ChartGPU is a TypeScript charting library built on WebGPU for smooth, interactive rendering—especially when you have lots of data. See https://github.com/ChartGPU/ChartGPU.
#'
#' @param data Can be a `data.frame` if function used with other layers functions or a list of parameters for configuring a chart.
#' @param mapping Default list of aesthetic mappings to use for chart, only used if `data` is a `data.frame`.
#' @param ... Additional parameters.
#' @inheritParams htmlwidgets::createWidget
#'
#' @return A [chartgpu()] `htmlwidget` object.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @export
chartgpu <- function(data = NULL, mapping = NULL, type = NULL, ..., width = NULL, height = NULL, elementId = NULL) {

  x <- list(
    options = list(...)
  )

  if (inherits(data, "data.frame")) {
    x$options$series <- c(
      x$options$series,
      list(list(
        data = parse_data(data),
        type = type %||% "line"
      ))
    )
  }

  attr(x, "TOJSON_ARGS") <- list(dataframe = "rows")

  createWidget(
    name = "chartgpu",
    x = x,
    width = width,
    height = height,
    package = "rchartgpu",
    elementId = elementId,
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      knitr.figure = FALSE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = "400px",
      browser.fill = TRUE,
      viewer.suppress = FALSE,
      browser.external = TRUE,
      padding = 0
    )
  )
}

