
# Use built-in light theme
chartgpu(ggplot2::economics[, c("date", "psavert")]) |>
  chartgpu_theme_light()

# Use built-in light theme
chartgpu(ggplot2::economics[, c("date", "psavert")]) |>
  chartgpu_theme_dark()

# Custom theme
chartgpu(ggplot2::economics[, c("date", "psavert")]) |>
  chartgpu_theme(
    backgroundColor = "#002240",
    textColor = "#ed7e1b",
    axisLineColor = "#ed7e1b",
    axisTickColor = "#ed7e1b",
    gridLineColor = "#ed7e1b",
    colorPalette = list("#FFFFFF")
  )
