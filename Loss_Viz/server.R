library(shiny)
library(ggplot2)
set.seed(2156)

shinyServer(function(input, output) {

        
    x_pop = reactive({
        x = runif(input$population, 0, 5)

    })
    y_pop = reactive({
        y = input$intercept + input$slope * x_pop() + rnorm(input$population, input$mean, input$std)

    })
    
    x_sam = reactive({
        x = sample(x_pop(), input$sample_size)
    })
    
    y_sam = reactive({
        ypop = y_pop()
        y = ypop[match(x_sam(), x_pop())]
    })
    
    output$Plot_pop = renderPlot({

        ggplot(NULL, aes(x = x_pop(), y =  y_pop())) + geom_point(size = 2) 

    })
    output$Plot_sample = renderPlot({

        ggplot(NULL, aes(x = x_sam(), y =  y_sam())) + geom_point(size = 2) 
        
    })
    

})
