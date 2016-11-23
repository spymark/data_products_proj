library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


server <- function(input, output, session) {

  points <- eventReactive(input$recalc, {
    
    df <- data.frame(lat = runif(50, min = 55.95, max = 55.96), lng = runif(50, min = -3.19, max = -3.15))
    
  }, ignoreNULL = FALSE)
  
  
  price <- eventReactive(input$recalc, {
    
    as.character(round(runif(50, min = 350, max = 780 ), digits = 2))
  }, ignoreNULL = FALSE)
  
  

  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Stamen.TonerLite",
        options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points(), popup = price())
    
  })
}