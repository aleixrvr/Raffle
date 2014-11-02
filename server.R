

shinyServer(function(input, output) {
  
  output$trajectory = renderImage({
    list(src = paste('C:\\Users\\Aleix\\Google Drive\\Archivos\\RugBcn\\Raffle\\figures\\traj',
                     input$framePng, '.png', sep =""),
         alt = "This is alternate text", 
         width = 2000
         )
  }, deleteFile = FALSE)
})