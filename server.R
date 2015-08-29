data(mtcars)
mtcars$am <- as.character(mtcars$am)
mtcars$am[mtcars$am==0] <- 'automatic'
mtcars$am[mtcars$am==1] <- 'manual'
mtcars$am <- as.factor(mtcars$am)

library(caret)

set.seed(1337)
modFit <- train(mpg ~ wt + cyl + am,method="glm",data=mtcars)

makeFrame <- function(val1, val2, val3) {
        values <- data.frame(wt=numeric(1), cyl=numeric(1), 
                             am=factor(1, levels=c("automatic","manual")))
        values[1,1] <- val1
        values[1,2] <- val2
        values[1,3] <- val3
        values
}

library(shiny)
shinyServer(
        function(input, output) {
                myFrame <- reactive({makeFrame(input$wt, input$cyl, input$am)})
                output$inputWt <- renderPrint({input$wt})
                output$inputCyl <- renderPrint({input$cyl})
                output$inputAm <- renderPrint({input$am})
                output$prediction <- renderPrint({predict(modFit, newdata=myFrame())})
        }
        )