# app/main.R
library(ggplot2)

box::use(
  shiny[bootstrapPage, moduleServer, NS],
)
box::use(
  view/chart,
  view/hist,  # Add new hist module
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    chart$ui(ns("chart")),
    hist$ui(ns("hist"))  # Add histogram UI
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    chart$server("chart")  # Original chart
    hist$server("hist")    # New histogram
  })
}
