library(shiny)
library(tidyverse)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    meanPrice <- reactive({
        meanPrice <- mean(diamonds[[input$x_var]], na.rm = TRUE)
    })    
    
    
  output$diamondPlot <- renderPlot({
      if (input$x_var == "carat") {
          x_min = 0
          x_max = 5
          y_max = 20000
          y_min = 0
      } else if (input$x_var == "x") {
          x_min = 0
          x_max = 10
          y_max = 20000
          y_min = 0
      } else if (input$x_var == "y") {
          x_min = 0
          x_max = 10
          y_max = 20000
          y_min = 0
      } else if (input$x_var == "z") {
          x_min = 0
          x_max = 10
          y_max = 20000
          y_min = 0
      } else {
          x_min = 40
          x_max = 80
          y_max = 20000
          y_min = 0
      }
      xvar <- input$x_var
      ggplot(diamonds, aes_string(x = xvar, y = "price")) +
        geom_point() +
        geom_smooth(method = "lm") +
        coord_cartesian(xlim = c(x_min, x_max), ylim = c(y_min, y_max))
  })
  
  output$meanVar <- renderText({
      meanPrice()
  })
})
