#' date_input
#' @export
date_input <- function(name, label = NULL, value = NULL, min = NULL, max = NULL, style = NULL, icon = uiicon("calendar")){
  class <- paste(name, "ui input")
  if (!is.null(icon)) class <- paste(class, "icon")
  shiny::tagList(
    shiny::div(class = class, style = style, label, 
      shiny.semantic::shiny_text_input(
        name, 
        shiny::tags$input(
          type = "date", 
          name = name, 
          min = min, 
          max = max
        ), 
        value = value
      ), 
      icon
    )
  )
}
