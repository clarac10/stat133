library(shiny)

ui = shinyUI(fluidPage(
  titlePanel("Life Expectancy and Income"),
  
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("year",
                  label = "Year:",
                  min = 1800,
                  max = 2015,
                  value = 1800,
                  step = 1,
                  animate = animationOptions(interval=500, loop=TRUE))
      
      
      
    ),
    mainPanel(plotOutput("lifeplot"))
    
    
  )
)

)