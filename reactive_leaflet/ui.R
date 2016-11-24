library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


ui <- fluidPage(
  
  titlePanel("Simple map"),
  
  sidebarLayout(
    
    sidebarPanel(
      radioButtons("radio", label = h3("Choose Map Style"),
                   choices = list("Stamen.TonerLite", "OpenTopoMap" ,"OpenStreetMap.Mapnik"), 
                   selected = "Stamen.TonerLite"),
      sliderInput("slider1", label = h3("Define the price range"), min = 450, max = 1500, value = c(600, 850)),
      actionButton("recalc", "Generate new data")
          ),
    
    mainPanel(
      leafletOutput("mymap"),
      plotlyOutput("plot")
    )
  )
)