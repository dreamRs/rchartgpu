library(shiny)
library(rchartgpu)

gpu_share <- data.frame(
  label = c("Compute", "Memory", "Raster", "Upload", "Sync", "Other"),
  value = c(42, 30, 18, 12, 9, 6),
  color = c("#00E5FF", "#FF2D95", "#B026FF", "#00F5A0", "#FFD300", "#FF6B00")
)

ui <- fluidPage(
  fluidRow(
    column(
      width = 8,
      offset = 2,
      selectInput(
        inputId = "variable",
        label = "Variable:",
        choices = names(ggplot2::economics)[-1]
      ),
      chartgpuOutput(outputId = "chart",  height = "500px"),
      chartgpuOutput(outputId = "pie",    height = "350px"),
      br(),
      chartgpuOutput(outputId = "donut",  height = "350px")
    )
  )
)

server <- function(input, output, session) {
  output$chart <- renderChartgpu({
    chartgpu(ggplot2::economics[, c("date", input$variable)]) |>
      chartgpu_theme_light()
  })
  
  output$pie <- renderChartgpu({
    piegpu(gpu_share, name = "GPU budget")
  })
  
  output$donut <- renderChartgpu({
    donutgpu(gpu_share, name = "GPU budget")
  })
}

if (interactive())
  shinyApp(ui, server)