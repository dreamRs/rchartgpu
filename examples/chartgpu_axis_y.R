
# Provide name for axis
chartgpu(ggplot2::economics, aes(date, psavert)) |>
  chartgpu_axis_y(name = "personal savings rate")

# Custom labels for ticks + axis minimum/maximum
chartgpu(ggplot2::economics, aes(date, psavert)) |>
  chartgpu_axis_y(
    min = 0,
    max = 20,
    tickFormatter = JS("(v) => `${v.toFixed(0)} %`")
  )
