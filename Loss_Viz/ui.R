library(shiny)


shinyUI(fluidPage(


    titlePanel("Visualizing the impact of different parametes on linear regression"),
    br(),

    fluidRow(
        column(3,
        wellPanel(
            h3("Let's prepare some data first"),
            br(),
            h4("For the line Y = A + B*X, enter the intercept 'A' and slope 'B'"),
            splitLayout(
                numericInput("slope", "Slope", 2), 
                numericInput("intercept", "Intercept", 2)),
            splitLayout(
                numericInput("std", "Std of epsilon", 1),
                numericInput("mean", "Mean of epsilon", 0))
                )
            ),
        column(4, 
               plotOutput('Plot'))
        )
))
