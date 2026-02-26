# Specify any options

chartgpu(ggplot2::economics, aes(date, psavert)) |>
  chartgpu_options(
    animation = FALSE,
    yAxis = list(name = "personal savings rate")
  )

scattergpu(cars) |>
  chartgpu_options(
    theme = "light",
    tooltip = list(trigger = "axis")
  )
