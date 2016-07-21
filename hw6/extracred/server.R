library(ggvis)
library(readr)
library(shiny)
library(dplyr)

full_df = read_csv("cleaned_demographics.csv")





server = shinyServer(function(input, output, session) {
  input_year = reactive({input$year})
full_df %>% 
  ggvis(x = ~GDP, y = ~life_expectancy) %>% 
  filter(year == eval(input_slider(1800, 2015, label = "Year:", 
                                   animate = animationOptions(interval = 250, loop = TRUE)))) %>% 
  layer_points(fill = ~region) %>% 
  add_axis("x", title = "GDP") %>% 
  add_axis("y", title = "Life Expectancy", values = seq(0, 100, 25)) %>%
  bind_shiny("ggvis", "ggvis_ui")

 


})

