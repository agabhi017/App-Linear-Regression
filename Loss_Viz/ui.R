library(shiny)


shinyUI(fluidPage(


    titlePanel("Visualizing the impact of different parameters on linear regression"),
    br(),

    fluidRow(
        column(3,
        wellPanel(
            strong(h3("Let's prepare some data first")),
            br(),
            em(h4("For y = a + b*x, enter the intercept 'a' and slope 'b'")),
            splitLayout(
                numericInput("slope", "Slope", 2), 
                numericInput("intercept", "Intercept", 2)),
            splitLayout(
                numericInput("std", "Std of epsilon", 1),
                numericInput("mean", "Mean of epsilon", 0)),
            splitLayout(
                numericInput("population", "Population Size", 1000), 
                numericInput("sample_size", "Sample Size", 100))
                )
            ),
            
        column(3, 
               plotOutput('Plot_pop')),
        column(3, 
               plotOutput('Plot_sample'))
        )
))
