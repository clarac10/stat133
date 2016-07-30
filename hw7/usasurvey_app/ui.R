library(shiny)
library(readr)

usa_survey = read_csv("usa_survey.csv")

shinyUI(fluidPage(
  titlePanel("Most Common Answer to Survey Question for Each State"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("question",
                  label = "Choose a question:",
                  choices = na.omit(unique(usa_survey$quest)))
    ),
    mainPanel(plotOutput("usa"))
  )
))