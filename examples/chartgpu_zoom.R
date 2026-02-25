
# Activate both zoom methods: mouse and slider
chartgpu(ggplot2::economics[, c("date", "psavert")]) |>
  chartgpu_zoom()

# Only slider
chartgpu(ggplot2::economics[, c("date", "psavert")]) |>
  chartgpu_zoom(type = "slider")
