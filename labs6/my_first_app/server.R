library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
  
  # Note the curly braces in addition to the parentheses
  output$text1 <- renderText({ 
    "You have selected this"
  })
  
})