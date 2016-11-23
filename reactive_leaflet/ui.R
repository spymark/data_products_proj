library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


ui <- fluidPage(
  
  titlePanel("Simple map"),
  
  sidebarLayout(
    
    sidebarPanel(
      actionButton("recalc", "Recalculate Locations and Prices")
    ),
    
    mainPanel(
      leafletOutput("mymap")
    )
  )
)