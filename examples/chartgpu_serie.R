
# Modify series options
data.frame(
  x = seq(-3, 7, by = 1/8),
  sin = sin(seq(-3, 7, by = 1/8)),
  cos = cos(seq(-3, 7, by = 1/8))
) |>
  chartgpu() |>
  chartgpu_serie(
    name = "sin",
    label = "Sine",
    color = "#228B22"
  ) |>
  chartgpu_serie(
    name = "cos",
    label = "Cosine",
    color = "#b22222",
    lineStyle = list(width = 4)
  )
