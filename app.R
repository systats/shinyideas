pacman::p_load(tidyverse, shiny, shiny.semantic)
#devtools::document()
devtools::load_all()
devtools::install()

# dir("../R")

ui <- shiny.semantic::semanticPage(
  tagList(
    toggle_input("first"),
    toggle_input("second", class = "slider"),
    toggle_input("third", class = "toggle")
  )
)


s <- function(input, output, session){
  
  observe({
    print(input$first)
  })
}


shiny::shinyApp(ui, s)