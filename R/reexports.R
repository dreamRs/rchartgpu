#' Mark character strings as literal JavaScript code
#'
#' See [htmlwidgets::JS()] for details.
#'
#' @name JS
#' @keywords internal
#' @export
#' @importFrom htmlwidgets JS
#' @usage JS(...)
#' @inheritParams htmlwidgets::JS
#' @return A string that will be interpreted as JavaScript code in htmlwidgets.
htmlwidgets::JS

#' Construct aesthetic mappings
#'
#' See [ggplot2::aes()] for details.
#'
#' @name aes
#' @keywords internal
#' @export
#' @importFrom ggplot2 aes
#' @usage aes(x, y, ...)
#' @inheritParams ggplot2::aes
#' @return A list with class `uneval`. Components of the list are either quosures or constants.
ggplot2::aes
