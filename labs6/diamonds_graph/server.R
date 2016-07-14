library(ggplot2)
library(shiny)
library(dplyr)

shinyServer(function(input, output) {
  
  output$diamPlot = renderPlot({
    x = input$characteristics
    y = "price"
    
  diamonds = diamonds %>% 
    filter(cut %in% input$cut, color %in% input$color)
    
    ggplot(diamonds) + 
      geom_point(aes_string(x = x, y = y))
    
  })
})
