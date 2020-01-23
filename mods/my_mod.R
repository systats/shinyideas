my_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::actionButton(ns("my_button"), label = "MY", class = "ui vertical animated button"),
    uiOutput(ns("dev"))
  )
}


my_server <- function(input, output, session){
  
  observeEvent(input$my_button, {print(session$ns("Nice"))})

}