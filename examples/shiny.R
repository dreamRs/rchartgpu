
library(shiny)
library(rchartgpu)

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
      chartgpuOutput(outputId = "chart", height = "500px")
    )
  )
)

server <- function(input, output, session) {

  output$chart <- renderChartgpu({
    chartgpu(ggplot2::economics[, c("date", input$variable)]) |>
      chartgpu_theme_light()
  })

}

if (interactive())
  shinyApp(ui, server)
