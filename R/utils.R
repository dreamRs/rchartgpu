
list1 <- function(x){
  if (length(x) == 1) {
    list(x)
  } else {
    x
  }
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


make_serie <- function(data, type = NULL) {
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
}
