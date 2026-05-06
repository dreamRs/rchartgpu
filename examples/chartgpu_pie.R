library(rchartgpu)

gpu_share <- data.frame(
  label = c("Compute", "Memory", "Raster", "Upload", "Sync", "Other"),
  value = c(42, 30, 18, 12, 9, 6),
  color = c("#00E5FF", "#FF2D95", "#B026FF", "#00F5A0", "#FFD300", "#FF6B00")
)

# Pie
piegpu(gpu_share, name = "GPU budget")

# Donut
donutgpu(gpu_share, name = "GPU budget")
