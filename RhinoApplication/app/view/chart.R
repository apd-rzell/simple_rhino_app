# app/view/chart.R
box::use(
  shiny[h3, moduleServer, NS, tagList, plotOutput, renderPlot],
  ggplot2[ggplot, aes, geom_point, geom_smooth, theme_minimal, ggtitle],
  stats[rnorm]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Scatter Plot"),
    plotOutput(ns("chart"))  # Changed from echarts4rOutput
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$chart <- renderPlot({
      # Create random data
      set.seed(123)
      df <- data.frame(
        x = rnorm(100),
        y = rnorm(100)
      )
      
      # Create ggplot
      ggplot(df, aes(x, y)) +
        geom_point() +
        geom_smooth(method = "loess") +
        theme_minimal() +
        ggtitle("Scatter Plot with Smooth Line")
    })
  })
}
