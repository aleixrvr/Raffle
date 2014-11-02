createTrajectories <- function(candidates, workingFolder, timeHorizon){
  
  candidatesN <- length( candidates )
  
  nextStep <- function( n ){
    sapply(1:n, function( tpN ){
      rnorm(1, 0, sd = tpN^2)  
    })
  }
  
  indexTimeStep <- function( timeStep ){
    sapply( dataPlot$timeStep, function( candTimeStep ){
      candTimeStep %in% 0:timeStep
    })
  }
  
  randTraj <- lapply(candidates, function(candName){
    steps <- nextStep( timeHorizon ) 
    traj <- c(0, cumsum( steps ) )
    candTrajectory <- data.frame( candidate = candName, timeStep = 0:timeHorizon, trajectory = traj)
  })
  dataPlot <- do.call(rbind, randTraj)
  
  maxHorizon <- max(abs(dataPlot$trajectory))
  lineDataPlot <- data.frame(timeStep = c(timeHorizon, timeHorizon), 
                             trajectory = c(maxHorizon, -maxHorizon),
                             candidate = "line")
  
  
  trajPlots <- lapply( 0:timeHorizon, function(timeStepN){
    print( paste( floor(100*timeStepN / timeHorizon ), "%" ) )
    ind <- indexTimeStep( timeStepN )
    indLast <- dataPlot$timeStep == timeStepN
    textDataPlot <- dataPlot[indLast, ]
    
    plotTraj <- ggplot( dataPlot[ind, ], aes(timeStep, trajectory, group = candidate, color = candidate ) ) + 
      geom_line() + geom_point() + 
      xlim( c(0, timeHorizon) ) + ylim( c( -maxHorizon, maxHorizon) ) + 
      geom_text(data = textDataPlot, 
                aes(x = timeStep, y = trajectory, label = candidate),
                size = 4, hjust = 0) +
      geom_line(data = lineDataPlot , colour = "black")
    
    ggsave( filename = paste(workingFolder, "figures\\traj", timeStepN, ".png", sep = ""), 
            plotTraj, width = 20, height =10)
    return( invisible( ) )  
  })
  
  indLast <- dataPlot$timeStep == timeHorizon
  podium <- dataPlot[indLast, ]
  indOrder <- order( podium$trajectory, decreasing = TRUE )
  podium <- podium[indOrder, ]
  return( podium )
}


