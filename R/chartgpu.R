#' @title ChartGPU
#'
#' @description
#' ChartGPU is a TypeScript charting library built on WebGPU for smooth, interactive rendering—especially when you have lots of data. See https://github.com/ChartGPU/ChartGPU.
#'
#' @param data Can be a `data.frame` if function used with other layers functions or a list of parameters for configuring a chart.
#' @param ... Additional parameters.
#' @inheritParams htmlwidgets::createWidget
#'
#' @return A [chartgpu()] `htmlwidget` object.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @export
chartgpu <- function(data = NULL, type = NULL, ..., width = NULL, height = NULL, elementId = NULL) {

  x <- list(
    options = list(...)
  )

  if (inherits(data, "data.frame")) {
    x$options$series <- c(
      x$options$series,
      make_serie(data, type = type)
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

