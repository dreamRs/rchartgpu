library(shiny)
library(rchartgpu)


ui <- fluidPage(

    titlePanel("Test connectCharts in shiny"),

    selectInput("var1",
                "Variable 1:",
                choices = names(ggplot2::economics[-1]),
                selected = "psavert"),
    selectInput("var2",
                "Variable 2:",
                choices = names(ggplot2::economics[-1]),
                selected = "uempmed"),
    chartgpuOutput("chart1", height = "290px"),
    br(),
    chartgpuOutput("chart2", height = "290px")
    )


server <- function(input, output) {

    output$chart1 <- renderChartgpu({
        c1 <- chartgpu(
        ggplot2::economics[, c("date", input$var1)],
        group     = "g1",
        sync_zoom = TRUE,
        dataZoom  = list(
          list(type = "inside"),
          list(type = "slider")
        )
      )})
      
      output$chart2 <- renderChartgpu({
        c2 <- chartgpu(
        ggplot2::economics[, c("date", input$var2)],
        group     = "g1",
        sync_zoom = TRUE,
        dataZoom  = list(
          list(type = "inside"),
          list(type = "slider")
        )
      )
      
    })
}

if (interactive()) 
  shinyApp(ui, server)
