#' accordion_menu
#' This function is a Ui wrapper for a sidebar menu packed as accordion. This allows to
#' increase the complexity of the app by hiding most of the content by default. 
#' @export
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