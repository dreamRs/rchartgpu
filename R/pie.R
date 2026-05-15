#' Pie Chart with ChartGPU
#'
#' @param data A `data.frame`.
#' @param name Series name shown in the tooltip.
#' @param radius Length-2 vector `c(inner, outer)`, e.g. `c(0, "72%")`.
#' @param center Length-2 vector for the chart centre, e.g. `c("50%", "50%")`.
#' @param start_angle Starting angle in degrees (default 90 = top).
#' @inheritParams chartgpu
#' @inheritParams htmlwidgets::createWidget
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @example examples/chartgpu_pie.R
piegpu <- function(data,
                   mapping     = NULL,
                   name        = NULL,
                   radius      = c(0, "72%"),
                   center      = c("50%", "50%"),
                   start_angle = 90,
                   width       = NULL,
                   height      = NULL,
                   elementId   = NULL) {
  
  if (is.null(mapping)) {
    nms <- colnames(data)
    mapping <- list(
      label = nms[1],
      value = nms[2],
      color = if (length(nms) >= 3) nms[3] else NULL
    )
  }
  
  slices <- lapply(seq_len(nrow(data)), function(i) {
    s <- list(name  = as.character(data[[mapping$label]][i]),
              value = data[[mapping$value]][i])
    if (!is.null(mapping$color) && !is.na(data[[mapping$color]][i]))
      s$color <- data[[mapping$color]][i]
    s
  })
  
  serie <- dropNulls(list(
    type       = "pie",
    name       = name,
    data       = slices,
    radius     = as.list(radius),
    center     = as.list(center),
    startAngle = start_angle
  ))
  
  chartgpu(
    data = list(
      series = list(serie),
      xAxis  = list(type = "value", min = 0, max = 1, tickLength = 0, name = ""),
      yAxis  = list(type = "value", min = 0, max = 1, tickLength = 0, name = "")
    ),
    width     = width,
    height    = height,
    elementId = elementId
  )
}

#' Donut Chart with ChartGPU
#'
#' @param data A `data.frame`.
#' @param name Series name shown in the tooltip.
#' @param radius Length-2 vector `c(inner, outer)`, e.g. `c("40%", "72%")`.
#' @param center Length-2 vector for the chart centre, e.g. `c("50%", "50%")`.
#' @param start_angle Starting angle in degrees (default 90 = top).
#' @inheritParams chartgpu
#' @inheritParams htmlwidgets::createWidget
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @example examples/chartgpu_pie.R
donutgpu <- function(data,
                     mapping     = NULL,
                     name        = NULL,
                     radius      = c("40%", "72%"),
                     center      = c("50%", "50%"),
                     start_angle = 90,
                     width       = NULL,
                     height      = NULL,
                     elementId   = NULL) {
  piegpu(
    data        = data,
    mapping     = mapping,
    name        = name,
    radius      = radius,
    center      = center,
    start_angle = start_angle,
    width       = width,
    height      = height,
    elementId   = elementId
  )
}