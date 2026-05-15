c1 <- chartgpu(
  ggplot2::economics[, c("date", "psavert")],
  group     = "g1",
  sync_zoom = TRUE,
  height    = "300px",
  dataZoom  = list(
    list(type = "inside"),
    list(type = "slider")
  )
)

c2 <- chartgpu(
  ggplot2::economics[, c("date", "uempmed")],
  group     = "g1",
  sync_zoom = TRUE,
  height    = "300px",
  dataZoom  = list(
    list(type = "inside"),
    list(type = "slider")
  )
)

htmltools::browsable(htmltools::tagList(c1, c2))