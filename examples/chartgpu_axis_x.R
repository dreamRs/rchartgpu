
# Provide name for axis
chartgpu(ggplot2::economics, aes(date, psavert)) |>
  chartgpu_axis_x(name = "Date")

# Custom date locale for axis labels
chartgpu(ggplot2::economics, aes(date, psavert)) |>
  chartgpu_axis_x(
    tickFormatter = JS("(ms) => new Date(ms).toLocaleDateString('de-DE')")
  )

