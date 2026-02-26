
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
  serie <- dropNulls(list(name = label, color = color, ...))
  if (!is.null(serie$data))
    serie$data <- parse_data(unname(serie$data))
  idx <- which(chart$x$series_names == name)
  if (!is.null(serie$data) & length(idx) < 1) {
    if (is.null(serie$type))
      serie$type <- "line"
    idx <- length(chart$x$series_names) + 1
    chart$x$series_names <- c(chart$x$series_names, name)
    chart$x$options$series[[idx]] <- list()
  }
  stopifnot("Serie not found!" = length(idx) == 1)
  chart$x$options$series[[idx]] <- modifyList(
    x = chart$x$options$series[[idx]],
    val = serie
  )
  return(chart)
}


#' ChartGPU Theme
#'
#' @param chart A chart created with [chartgpu()].
#' @param palette Color palette to use.
#' @param ... Options for theme, see [https://github.com/ChartGPU/ChartGPU/blob/main/docs/api/themes.md](https://github.com/ChartGPU/ChartGPU/blob/main/docs/api/themes.md).
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @name chartgpu-theme
#'
#' @example examples/chartgpu_theme.R
chartgpu_theme <- function(chart, palette = NULL, ...) {
  stopifnot("`chart` must have been created with `chartgpu`" = inherits(chart, "chartgpu"))
  chart$x$options$theme <- list(...)
  chart$x$options$palette <- list1(palette)
  return(chart)
}

#' @export
#'
#' @rdname chartgpu-theme
chartgpu_theme_light <- function(chart, palette = NULL) {
  stopifnot("`chart` must have been created with `chartgpu`" = inherits(chart, "chartgpu"))
  chart$x$options$theme <- "light"
  chart$x$options$palette <- list1(palette)
  return(chart)
}

#' @export
#'
#' @rdname chartgpu-theme
chartgpu_theme_dark <- function(chart, palette = NULL) {
  stopifnot("`chart` must have been created with `chartgpu`" = inherits(chart, "chartgpu"))
  chart$x$options$theme <- "dark"
  chart$x$options$palette <- list1(palette)
  return(chart)
}






#' ChartGPU Data Zoom
#'
#' @param chart A chart created with [chartgpu()].
#' @param type Type of zoom between : `"inside"` (with mouse) or `"slider"` (below chart) or both.
#' @param ... Options for zoom,
#'  see [https://github.com/ChartGPU/ChartGPU/blob/main/docs/api/options.md#data-zoom-configuration](https://github.com/ChartGPU/ChartGPU/blob/main/docs/api/options.md#data-zoom-configuration).
#'
#' @returns A [chartgpu()] `htmlwidget` object.
#' @export
#'
#' @example examples/chartgpu_zoom.R
chartgpu_zoom <- function(chart, type = c("inside", "slider"), ...) {
  type <- match.arg(type, several.ok = TRUE)
  stopifnot("`chart` must have been created with `chartgpu`" = inherits(chart, "chartgpu"))
  dataZoom <- chart$x$options$dataZoom
  for (type_i in type) {
    if (length(dataZoom) < 1) {
      dataZoom <- list(list(type = type_i, ...))
    } else {
      types <- vapply(X = dataZoom, FUN = `[[`, FUN.VALUE = character(1), "type")
      idx <- which(types == type_i)
      if (length(idx) == 1) {
        dataZoom[[idx]] <- list(type = type_i, ...)
      } else {
        dataZoom <- c(
          dataZoom,
          list(list(type = type_i, ...))
        )
      }
    }
  }
  chart$x$options$dataZoom <- dataZoom
  return(chart)
}








