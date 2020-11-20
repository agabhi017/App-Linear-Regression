
library(shiny)


shinyUI(fluidPage(


    titlePanel("Lets visualize how different parameters impact linear regression"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("slope", "Slope", 2), 
            numericInput("intercept", "Intercept", 2),
            numericInput("std", "Std of epsilon", 1),
            numericInput("mean", "Mean of epsilon", 0),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot")
        )
    )
))
