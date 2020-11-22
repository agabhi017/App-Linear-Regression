library(shiny)
library(ggplot2)
set.seed(2156)
theme_update(text = element_text(size = 20))
x_start = 0
x_end = 5

shinyServer(function(input, output) {

        
    x_pop = reactive({
        x = runif(input$population, x_start, x_end)

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
    
    y_break_start = reactive({
        y = input$intercept + input$slope * x_start
    })
    
    y_break_end = reactive({
        y = input$intercept + input$slope * x_end
    })
    
    output$Plot_pop = renderPlot({
        ggplot(NULL, aes(x = x_pop(), y =  y_pop())) + 
            geom_point(size = 3) +
            labs(title = 'Population Distribution',
                 x = 'x',
                 y = 'y') +
            scale_x_continuous(breaks = seq(x_start, x_end, by = 1)) 

    })
    output$Plot_sample = renderPlot({

        ggplot(NULL, aes(x = x_sam(), y =  y_sam())) + 
            geom_point(size = 3) +
            labs(title = 'Selected Sample Distribution',
                 x = 'x',
                 y = 'y') +
            scale_x_continuous(breaks = seq(x_start, x_end, by = 1)) + 
            scale_y_continuous(breaks = seq(y_break_start(), y_break_end(), by = 1))
        
    })
    

})
