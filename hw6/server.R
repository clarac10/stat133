library(shiny)
library(dplyr)
library(ggplot2)
library(scales)

server = shinyServer(function(input, output) {
  
  output$lifeplot = renderPlot ({
    x = "GDP"
    y = "life_expectancy"
    size = "pop"
    fill = "region"
    colour = "black"
    
  full_df = full_df %>% 
    filter(year %in% input$year)
    
  ggplot(full_df) +
    geom_point(aes_string(x = x, y = y, fill = fill, size = size), alpha = 0.7, colour = colour, pch = 21) +
    scale_shape(solid = FALSE) +
    labs(title = input$year,
         x = "GDP Per Capita (Inflation-Adjusted)",
         y = "Life Expectancy at Birth") +
    scale_x_log10(limits = c(500,50000), breaks = c(500, 5000, 50000), labels = dollar_format(prefix = "$")) +
    scale_y_continuous(limits = c(25, 75), breaks = seq(25,75,25), labels = c("25 years", "50 years", "75 years"))+
    guides(size = FALSE) +
    scale_size_area(max_size = 25) +
    #coord_cartesian(expand = TRUE) + 
    #scale_fill_manual(values = region)
           
    
  })
})