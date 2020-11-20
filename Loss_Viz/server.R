library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Plot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x = seq(1, 100)
        y = input$intercept + input$slope * x + rnorm(100, input$mean, input$std)
        plot(x, y)

    })

})
