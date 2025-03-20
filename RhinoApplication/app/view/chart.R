# app/view/chart.R
box::use(
  shiny[h3, moduleServer, NS, tagList, plotOutput, renderPlot, sliderInput],
  ggplot2[ggplot, aes, geom_point, geom_smooth, theme_minimal, ggtitle],
  stats[rnorm]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h3("Scatter Plot"),
    sliderInput(ns("n_points"), "Number of Data Points", min = 50, max = 200, value = 100),  # Slider for number of points
    plotOutput(ns("chart"))  # Plot output
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$chart <- renderPlot({
      # Use the slider input to determine the number of data points
      n_points <- input$n_points
      
      # Create random data
      set.seed(123)  # Consistent seed for reproducibility
      df <- data.frame(
        x = rnorm(n_points),  # Use n_points for x
        y = rnorm(n_points)   # Use n_points for y
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
