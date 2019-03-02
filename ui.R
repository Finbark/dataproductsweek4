library(shiny)
library(tidyverse)

shinyUI(fluidPage(
  titlePanel("Influences on Diamond Price"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("x_var", 
                   "select variable",
                   list("Carat" = "carat", 
                        "X Axis" = "x", 
                        "Y Axis" = "y", 
                        "Z Axis" = "z", 
                        "Depth" = "depth"),
                   multiple = FALSE),
                    p("To use, select the variable you want to explore.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("diamondPlot"),
       h3("Mean variable value"),
       textOutput("meanVar")
    )
  )
))
