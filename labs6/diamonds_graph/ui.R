library(shiny)

shinyUI(fluidPage(
  titlePanel("Diamonds Graph"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("characteristics",
                  label = "Choose a characteristic",
                  choices = list("carat", "table", "depth"),
                  selected = "carat"),
      
      checkboxGroupInput("color",
                         label = "Choose the color",
                         choices = list("D", 
                                        "E", 
                                        "F", 
                                        "G", 
                                        "H", 
                                        "I", 
                                        "J"),
                         selected = "D"),
      checkboxGroupInput("cut",
                         label = "Choose the cut",
                         choices = list("Fair", 
                                        "Good", 
                                        "Very Good", 
                                        "Premium", 
                                        "Ideal"),
                         selected = "Fair")
    ), 
    mainPanel(
      plotOutput("diamPlot")
    )
  )
))