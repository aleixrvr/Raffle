library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Free Strata ticket random walk raffle"),
  
  sliderInput('framePng', label = '', min = 0, max = timeHorizon, value = 0,
                          animate = animationOptions(interval = 1250, loop = FALSE, playButton = NULL, pauseButton = NULL)),

  plotOutput("trajectory")
                    
))


