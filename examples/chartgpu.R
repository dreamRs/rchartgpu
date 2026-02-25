
# With a data.frame :
chartgpu(ggplot2::economics) # default to line chart

# scatter chart :
chartgpu(ggplot2::diamonds[, c("carat", "price")], type = "scatter")

# With a list passed directly to Javascript method :
chartgpu(list(
  series = list(
    list(
      type = "line",
      name = "Sine",
      data = data.frame(
        x = seq(-3, 7, by = 1/8),
        y = sin(seq(-3, 7, by = 1/8))
      )
    )
  )
))

# Two series and some options :
chartgpu(list(
  series = list(
    list(
      type = "line",
      name = "Sine",
      data = data.frame(
        x = seq(-3, 7, by = 1/8),
        y = sin(seq(-3, 7, by = 1/8))
      ),
      color = "#228B22" # forestgreen, use hex code
    ),
    list(
      type = "line",
      name = "Cosine",
      data = data.frame(
        x = seq(-3, 7, by = 1/8),
        y = cos(seq(-3, 7, by = 1/8))
      ),
      color = "#b22222" # firebrick, use hex code
    )
  ),
  xAxis = list(name = "X axis"),
  yAxis = list(name = "Y axis"),
  tooltip = list(trigger = "axis"),
  dataZoom = list(list(type = "inside"), list(type = "slider")),
  theme = "light"
))
