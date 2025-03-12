# app/view/hist.R
box::use(
  shiny[h3, moduleServer, NS, tagList, plotOutput, renderPlot],
  ggplot2[ggplot, aes, geom_histogram, theme_minimal, ggtitle],
  stats[rnorm]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Histogram"),
    plotOutput(ns("hist"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$hist <- renderPlot({
      set.seed(123)  # Consistent seed with chart.R
      df <- data.frame(x = rnorm(100))
      
      ggplot(df, aes(x)) +
        geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
        theme_minimal() +
        ggtitle("Distribution of X Values")
    })
  })
}
