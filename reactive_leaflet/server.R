library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


server <- function(input, output, session) {

  points <- eventReactive(input$recalc, {
    
    df <- data.frame(lat = runif(5000, min = 55.95, max = 55.96), lng = runif(5000, min = -3.19, max = -3.15))
    
  }, ignoreNULL = FALSE)
  
  
  price <- eventReactive(input$recalc, {
        (round(runif(5000, min = input$slider1[1], max = input$slider1[2] ), digits = 2))
  }, ignoreNULL = FALSE)
  
  #here we receive the map style selections
  map_style <- reactive({input$radio})


  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles( map_style(),options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points(), clusterOptions = markerClusterOptions(), popup = as.character(price()))
    
  })
  
  output$plot <- renderPlotly({
    dat <- price()
    dat <- data.frame(dat)
    p <- ggplot(data = dat, aes(x=dat, fill = ..count..))+geom_histogram()+ggtitle("Distribution of prices")
    ggplotly(p)
    
  })
  
  
}