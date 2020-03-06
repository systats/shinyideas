pacman::p_load(tidyverse, shiny, shiny.semantic, semantic.dashboard)
#devtools::document()
devtools::load_all()
#devtools::install()

ui <- semantic.dashboard::dashboard_page(
  dashboard_header(inverted = T),
  dashboard_sidebar(
    side = "left", 
    size = "tiny",
    inverted = T, 
    sidebar_menu(
      div(class="ui inverted segment",
        div(class="ui inverted accordion",
          accordion_menu("My title", 
            menu_item(
              tabName = "first_tab",
              text = "My great stuff",
              icon = icon("line chart")
            ),
            menu_item(
              tabName = "second_tab",
              text = "Other teasers",
              icon = icon("chart area")
            ),
            active = T
          ),
          accordion_menu("My title 2", 
            menu_item(
              tabName = "third_tab",
              text = "Maga",
              icon = icon("user")
            ),
            active = F
          ),
          accordion_menu("My title 3", 
            menu_item(
              tabName = "fourth_tab",
              text = "Vote blue",
              icon = icon("plus")
            ),
            active = F
          )
        ),
        ### This javascript snippet drives the whole accordion functionality
        shiny::tags$script("$('.ui.accordion').accordion();")
      )
    )
  ),
  dashboard_body(
    semantic.dashboard::tab_items(
      tabItem(
        tabName = "first_tab",
        "first tab: Hello World",
         toggle_input("first"),
         toggle_input("second", class = "slider"),
         toggle_input("third", class = "toggle")
      ),
      tabItem(
        tabName = "second_tab",
        "second tab: Hello World"
      ),
      tabItem(
        tabName = "third_tab",
        "thrid tab: Hello World"
      ),
      tabItem(
        tabName = "fourth_tab",
        "fourth tab: Hello World"
      ),
      selected = 1
    )
  )
)




s <- function(input, output, session){
  
  observe({
    print(input$first)
  })
}


shiny::shinyApp(ui, s)