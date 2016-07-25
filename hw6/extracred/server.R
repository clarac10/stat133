library(ggvis)
library(readr)
library(shiny)
library(dplyr)

full_df = read_csv("cleaned_demographics.csv")

server = shinyServer(function(input, output, session) {
  
  full_df = na.omit(full_df)
  
  all_values = function(x) {
    if(is.null(x)) return(NULL)
    paste0(x[4])
  }
  
  full_df %>% 
    ggvis(x = ~GDP, 
          y = ~life_expectancy, 
          key := ~country, 
          stroke := "black", 
          size = ~pop, 
          fill = ~region,
          opacity := 0.6) %>%
    filter(year == eval(input_slider(1800, 
                                     2015, 
                                     1800,
                                     label = "Year:", 
                                     animate = animationOptions(
                                       interval = 250, loop = TRUE)))) %>%
    add_axis("x", 
             title = "GDP Per Capita (Inflation-Adjusted)",
             value = c(500, 5000, 50000), 
             format = "d",
             properties = axis_props(title = list(fontSize = 15))) %>% 
    scale_numeric("x", domain = c(300, 100000), trans = "log", expand = 0) %>% 
    add_axis("y", 
             title = "Life Expectancy", 
             values = seq(0,75,25), 
             properties = axis_props(title = list(fontSize = 15))) %>% 
    scale_numeric("y", domain = c(0, 80)) %>%
    scale_numeric("size", range = c(40, 1800)) %>%
    set_options(height = 400, width = 800) %>% 
    hide_legend("size") %>% 
    add_legend("fill", 
               title = "Region", 
               values = c('America', 
                          'East Asia & Pacific', 
                          'Europe & Central Asia', 
                          'Middle East & North Africa', 
                          'South Asia', 
                          'Sub-Saharan Africa')) %>% 
    scale_nominal("fill", 
                  range = c("black", 
                            "yellow", 
                            "purple", 
                            "blue", 
                            "green", 
                            "red")) %>% 
    layer_points() %>% 
    #add_axis("x", 
             #orient = "top", 
             #title = "Life Expectancy and Income", 
             #properties = axis_props(axis = list(stroke = "white"), 
                                     #labels = list(fontSize =0))) %>% 
    add_tooltip(all_values, "hover") %>%
    bind_shiny("ggvis", "ggvis_ui")
})