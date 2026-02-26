
list1 <- function(x){
  if (length(x) == 1) {
    list(x)
  } else {
    x
  }
}

dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}


parse_data <- function(data) {
  data[] <- lapply(
    X = data,
    FUN = function(x) {
      if (inherits(x, c("Date")))
        x <- as.numeric(x) * 24 * 60 * 60 * 1000
      if (inherits(x, c("POSIXct")))
        x <- as.numeric(x) * 1000
      return(x)
    }
  )
  return(data)
}

#' @importFrom rlang eval_tidy as_name
make_serie <- function(data, mapping = NULL, type = NULL) {
  if (is.null(mapping)) {
    series <- lapply(
      X = colnames(data)[-1],
      FUN = function(nm) {
        c(colnames(data)[1], nm)
      }
    )
    data <- parse_data(data)
    lapply(
      X = series,
      FUN = function(nms) {
        list(
          data = unname(data[, nms]),
          type = type %||% "line",
          name = nms[2]
        )
      }
    )
  } else {
    mapdata <- lapply(mapping, rlang::eval_tidy, data = data)
    seriesdata <- as.data.frame(mapdata)
    if (is.null(seriesdata$colour)) {
      list(
        list(
          data = parse_data(unname(seriesdata)),
          type = type %||% "line",
          name = rlang::as_name(mapping$y)
        )
      )
    } else {
      colour <- seriesdata$colour
      seriesdata$colour <- NULL
      seriesdata <- split(x = seriesdata, f = colour)
      lapply(
        X = names(seriesdata),
        FUN = function(nm) {
          list(
            data = parse_data(unname(seriesdata[[nm]])),
            type = type %||% "line",
            name = nm
          )
        }
      )
    }
  }
}
