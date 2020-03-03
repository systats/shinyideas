pacman::p_load(tidyverse, shiny, shiny.semantic, semantic.dashboard)
#devtools::document()
devtools::load_all()
#devtools::install()

### This function is a Ui wrapper for a sidebar menu packed as accordion. This allows to
# increase the complexity of the app by hiding most of the content by default. 
accordion_menu <- function(title, ..., active = F, disabled = F){
  
  title_class <- "title" 
  content_class <- "content"
  if(active) {
    title_class <- paste("active", title_class) 
    content_class <- paste("active", content_class)  
  }
  tagList(
    div(class = title_class,
        HTML('<i class="dropdown icon"></i>'),
        title
    ),
    if(!disabled){
      div(class = content_class, 
        ...
      )
    } else {
      div(class = content_class)
    }
  )
}

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