library(rchartgpu)

bargpu(
  ggplot2::economics[, c("date", "unemploy")],
  height = "400px"
)