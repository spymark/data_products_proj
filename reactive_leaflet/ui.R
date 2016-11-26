library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


ui <- fluidPage(
  
  titlePanel("Shiny reactive map"),
  
  sidebarLayout(
    
    sidebarPanel(
      h3("Documentation"),
      actionButton("toggle", "Toggle the following text"),
      conditionalPanel(
        condition = "input.toggle % 2 == 1",
        "This text gets toggled on and off" ,
        code('install.packages(c("shiny", "leaflet", "tidyverse", "plotly"))')
      ),
      p("This shiny app showcases a map made with leaflet and a D3 plot made with plotly(ggplotly"),
      p("These are all the packages needed"),
      
      radioButtons("radio", label = h2("Choose Map Style"),
                   choices = list("Stamen.TonerLite", "OpenTopoMap" ,"OpenStreetMap.Mapnik"), 
                   selected = "Stamen.TonerLite"),
      sliderInput("slider1", label = h2("Define the price range"), min = 450, max = 1500, value = c(600, 850)),
      sliderInput("slider2", label = h2("Number of markers"), min = 1000, max = 10000, value = 5000),
      actionButton("recalc", "Generate new data")
      
          ),
    
    mainPanel(
      leafletOutput("mymap"),
      plotlyOutput("plot")
    )
  )
)