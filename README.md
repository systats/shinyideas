# shinyideas

This is a collection of learning matrials and code snippets to get your shiny app to the next levels. I will dive into 

* Semantic UI: for simpple and beatiful UI
* Shiny Modules: organize your app as many simple shiny apps. 
* reactlog: easy reactivity debugger
* Apexchart: Open source js charting library


## Semantic UI

Every homepage uses the same html tags to represent structure and embedd content. So the first decision in web development is usually which css library to use in styling your these html tags. This is done via pre-written css classes so we dont have to deal with all the complexity that makes up a porper html page. Changing pre-written classes allawys to keep all other attributes encapusalated into a css class. In this guide we entriely base these css classes on the semantic ui libraries. 

> [semantic-ui](https://semantic-ui.com)

In order to use this css and javascript (js) framework we have to load these in the html head tag at the beginning of a page. An example page structure looks like:

```
<html>
  <head>
    ... your libraries go here ...
  </head> 
  <body>
    ... your content goes here ...
  </body> 
</html>
```
No matter what libraries you can load css with

```
<head>
  <link rel="stylesheet" type="text/css" href="...css path...">
</head> 
```

Href and src can either take a local file in `www` or you can load a file dynamically from a CDN: 

In shiny this would translate to the following:

```
shiny::tags$head(
  suppressDependencies("bootstrap"),
  tags$link(rel="stylesheet", type="text/css", href="...css path...")
)
```

Why do I see this rarely in a shiny app? Because shiny provides you some tidy wrappers to insert your code dependecies. If you are working with `shinyUI()` or `semanticPage()` this header creation is taken care for you  by generating exactly the code shown above. And in the case you what to add custom css and js paths you can call shiny::tags$head() wherever you want in your app. In order to avoid css class conflicts we categorically suppress other UI frameworks with `suppressDependencies("bootstrap")`. Now you know how css and js libraries are loaded into a shiny app. 


### UI Elements

Provides beatiful css classes that are intuitavely to explore, add and remeber. Code readability is also a plus for semantic css classes. A simple header can be coded by 

```
<div class = "ui header">Hello world</div>
```
if we want to change onyl one attribute, semantic ui provides you a tone of consitent objects like "header", "image" or "segment" and adjectives like red, green, yellow etc or mini, small, big, massiv.

```
<div class = "ui massive red header">Hello world</div>
```
This is build in to semantic ui. You can always enforce your one desired design by overwritting some attributes of the classes above. This can be done also in a makro CSS script. For example

```
<div class = "ui massive red header" style = "color:#00FF00;">Hello world</div>
```

If we want to translate this into shiny code we replace html tags with shiny functions. With `shiny::tags$...` you can find all html tags implemented as function. Instead of `<tag ...>`we simply call `tag(...)`. Also instead of plain text, strings with quotation marks have to be used. Space between attributes is not white but seperated by a comma. If you plan to use special html attributes like `for` and `data-tab` we have to treat it as R attribute using tiks ````. 

```
div(class = "ui massive red header", style = "color:#00FF00;", "Hello world")
```

At this point it makes sense to go to the official documentation to see other options for the class header or explore other UI elements.

> [semantic-ui header](https://semantic-ui.com/elements/header.html)










