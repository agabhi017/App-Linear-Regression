library(shiny)
library(ggplot2)


shinyServer(function(input, output) {

    output$Plot <- renderPlot({

        x = seq(1, 100)
        y0 = input$intercept + input$slope * x
        y = input$intercept + input$slope * x + rnorm(100, input$mean, input$std)
        ggplot(NULL, aes(x = x, y = c(y0, y))) + geom_point(size = 2) 

    })

})
