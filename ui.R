library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("MPG Predictor Tool"),
        sidebarPanel(
                h3('About this tool'),
                helpText('Select a weight, number of cylinders and transmission type,',
                        'and we will predict the mpg of the car when you press Submit.',
                        'Predictions are based on the mtcars dataset and trained using GLM.'),
                sliderInput('wt', 'Weight (lb/1000)', value=3.5, min=1.5, max=5.5, step=.25),
                sliderInput('cyl', 'Cylinders', value=4, min=4, max=8, step=2),
                selectInput('am', 'Transmission', c("Automatic" = "automatic", 
                                                    "Manual" = "manual")),
                submitButton('Submit')
                ),
        mainPanel(
                h3('Results'),
                h4('For a car with...'),
                h5('Weight (lb/1000)'),
                verbatimTextOutput('inputWt'),
                h5('Cylinders'),
                verbatimTextOutput('inputCyl'),
                h5('Transmission'),
                verbatimTextOutput('inputAm'),
                h4('...we predict the mpg is:'),
                verbatimTextOutput('prediction')
                )
        ))