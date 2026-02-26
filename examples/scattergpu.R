
# With a data.frame, 1st variable on X-axis, 2nd on Y-axis
scattergpu(cars)

# Provide mapping to select variable to plot
scattergpu(ggplot2::mpg, aes(cty, hwy))

# Color point based on variable
scattergpu(
  data = ggplot2::diamonds,
  mapping = aes(x = carat, y = price, color = clarity)
) |>
  chartgpu_theme_light(palette = scales::viridis_pal(option = "viridis")(8))
