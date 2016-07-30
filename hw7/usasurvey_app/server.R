library(shiny)
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)
library(ggmap)
library(mapdata)
library(stringr)
usa_survey = read_csv("usa_survey.csv")

shinyServer(function(input, output) {
  output$usa = renderPlot({
    
    usa_survey = usa_survey %>% 
      filter(quest %in% input$question)
    
    
    ggplot(usa_survey) +
      geom_polygon(aes(x = long, y = lat, fill = ans, group = group), 
                   color = "black") +
      coord_fixed(1.3) +
      labs(title = str_wrap(input$question),
           x = "",
           y = "") +
      scale_x_discrete(labels = "") +
      scale_y_discrete(labels = "") +
      theme_void() + 
      scale_fill_discrete(name = "Answer",
                          labels = str_wrap(levels(factor(usa_survey$ans)), width = 20)) 
      
      
  })
})