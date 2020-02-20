pacman::p_load(tidyverse, shiny.semantic, reactlog)

#options(shiny.reactlog = TRUE)

source("mods/my_mod.R")

ui <- shiny.semantic::semanticPage(
  div( class = "ui text container",
    
    div(class = "ui red header", "Hello World"),
    my_ui("my1"),
    my_ui("my2")
  )
)


server <- function(input, output, session) {
  
  callModule(my_server, "my1")
  callModule(my_server, "my2")

}

shiny::shinyApp(ui, server)


#shiny::reactlogShow()
