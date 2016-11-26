library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


ui <- fluidPage(
  
  titlePanel("Interactive property map"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      radioButtons("radio", label = h3("Choose Map Style"),
                   choices = list("Stamen.TonerLite", "OpenStreetMap.DE", "OpenStreetMap.HOT", "OpenStreetMap.Mapnik"), 
                   selected = "Stamen.TonerLite"),
      sliderInput("slider1", label = h3("Define the price range"), min = 450, max = 1500, value = c(600, 850)),
      sliderInput("slider2", label = h3("Number of markers"), min = 1000, max = 10000, value = 5000),
      actionButton("recalc", "Apply selections"),
      h2("Documentation"),
      p("This shiny app showcases a map made with leaflet and a D3 plot made with plotly(ggplotly)"),
      p("If a lot of properties are close to each other, they will be clustered together. You can click through until 
        you reach an individual marker. Clicking on the marker shows the price of the selected property"),
      tags$b("Use the toggle buttons below to see the documentation for each section"),
      actionButton("toggle", "Choosing the map style"),
      conditionalPanel(
        condition = "input.toggle % 2 == 1",
        p("Chose one of three different styles of maps"),
        p("Your selection will be applied instantly to the map on the main panel, but might take a couple of seconds to fully load"),
        p("If you can only see the markers and not the map, please zoom out to allow for some time to load the map")
      ),
      br(),
      actionButton("toggle2", "Price Range"),
      conditionalPanel(
        condition = "input.toggle2 % 2 == 1",
        p("With this slider you can select the price range that will be associated with the marker popups on the map"),
        p("The actual numbers are generated from a uniform distribution in the selected range"),
        p("To apply your selection on the map, you need to click the 'Apply selection' button")
      ),
      br(),
      actionButton("toggle3", "Number of markers"),
      conditionalPanel(
        condition = "input.toggle3 % 2 == 1",
        p("With this slider you can select the number of markers that will be placed on the map"),
        p("The coordinates of the markers come from a uniform distribution bound around the area of the city of Edinburgh"),
        p("To apply your selection on the map, you need to click the"), tags$b("Apply selection"), ("button")
      ),
      br(),
      actionButton("toggle4", "Price Distribution plot"),
      conditionalPanel(
        condition = "input.toggle4 % 2 == 1",
        p("The plot below the map, is generated each time you apply a new selection on the prices or number of markers"),
        p("It's actually created in ggplot2, but using ggplotly the plot is enhanced into a D3 interactive visualisation,
          allowing zooming in and out and also giving some info when we hover over")
      ),
      br(),
      actionButton("toggle5", "Code"),
      conditionalPanel(
        condition = "input.toggle5 % 2 == 1",
        p("You can see the entire code and how it reacts, on the right panel"),
        p("You can chose 'show below', but be aware that the price plot might not look great until you apply selections again")
      ),
      br(),
      p("All the code can be found in this github ", a("repository.", href = "https://github.com/spymark/data_products_proj"))

          ),
    
    mainPanel(
      leafletOutput("mymap"),
      plotlyOutput("plot")
    )
  )
)