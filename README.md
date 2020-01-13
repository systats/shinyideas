# shinyideas

This is a collection of learning matrials and code snippets to get your shiny app to the next levels.

## UI Frameworks

Every homepage uses the same html tags to represent structure and embedd content. So the first decision in web development is usually which css library to use in styling your these html tags. This is done via pre-written css classes so we dont have to deal with all the complexity that makes up a porper html page. Changing pre-written classes allawys to keep all other attributes encapusalated into a css class. 




## Intro Semantic UI

Provides beatiful css classes that are intuitavely to explore, add and remeber. Code readability is also a plus for semantic css classes. A simple header can be coded by 

```html
<div class = "ui header">Hello world</div>
```
if we want to change onyl one attribute, semantic ui provides you a tone of consitent objects like "header", "image" or "segment" and adjectives like red, green, yellow etc or mini, small, big, massiv.

```html
<div class = "ui massive red header">Hello world</div>
```
This is build in to semantic ui. You can always enforce your one desired design by overwritting some attributes of the classes above. This can be done also in a makro CSS script. For example

```html
<div class = "ui massive red header" style = "color:#00FF00;">Hello world</div>
```

If we want to translate this into shiny code we replace html tags with shiny functions. With `shiny::tags$...` you can find all html tags implemented as function. Instead of `<tag ...>`we simply call `r tag(...)`. Also instead of plain text, strings with quotation marks have to be used. Space between attributes is not white but seperated by a comma. If you plan to use special html attributes like `for` and `data-tab` we have to treat it as R attribute using tiks ````. 

```r
div(class = "ui massive red header", style = "color:#00FF00;", "Hello world")
```




