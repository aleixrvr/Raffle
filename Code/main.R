library(shiny)
library( ggplot2 )

timeHorizon <- 15
set.seed(509914)

workingFolder <- 'C:\\Users\\Aleix\\Google Drive\\Archivos\\RugBcn\\Raffle\\'
setwd(workingFolder)

source('Code\\CandidatesSets.R')
source('Code\\sorteig.R')

candidates <- DataScienceSet
# candidates <- MLRugBcnSet

# podium <- createTrajectories(candidates, workingFolder, timeHorizon)

runApp()
