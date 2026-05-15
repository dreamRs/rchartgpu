#' @title ChartGPU
#'
#' @description
#' ChartGPU is a TypeScript charting library built on WebGPU for smooth, interactive rendering—especially when you have lots of data.
#'  See [https://github.com/ChartGPU/ChartGPU](https://github.com/ChartGPU/ChartGPU).
#'
#' @param data Can be a `data.frame` (first column is used on x-axis, the others on y-axis) or a list of parameters for configuring a chart.
#' @param mapping Optional mapping of variables to use if `data` is a `data.frame`
#' @param type Type of chart, if `data` is a `data.frame`.
#' @param ... Additional parameters.
#' @param group Group ID to link multiple charts together.
#' @param sync_zoom Whether to sync zoom/pan across charts in the same group.
#' @inheritParams htmlwidgets::createWidget
#'
#' @return A [chartgpu()] `htmlwidget` object.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @export
#' @example examples/chartgpu.R
chartgpu <- function(data = NULL, mapping = NULL, type = NULL, ..., group = NULL, sync_zoom = FALSE, width = NULL, height = NULL, elementId = NULL) {

  if (inherits(data, "data.frame")) {
    x <- list(
      options = list(...)
    )
    x$options$series <- c(
      x$options$series,
      make_serie(data, mapping = mapping, type = type)
    )
    x$series_names <- colnames(data)[-1]
    if (inherits(data[[1]][1], c("Date", "POSIXct")) && is.null(x$options$xAxis$type)) {
      x$options$xAxis$type <- "time"
    }
  } else {
    x <- list(
      options = c(data, list(...))
    )
  }
  
  if (!is.null(group)) {
    x$syncGroup <- group
    x$syncZoom  <- isTRUE(sync_zoom)
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

