# shinyideas

This is a collection of learning materials and code snippets to get your shiny app to the next levels. I will dive into 

* [Semantic UI](https://semantic-ui.com) For simpple and beatiful UI
    + [shiny.semantic]() Shiny support for powerful Semantic UI library.
    + [semantic.dashboard](https://github.com/Appsilon/semantic.dashboard) Dashboard with Semantic UI Support for Shiny
* Shiny Modules: organize your app as many simple shiny apps. 
* [reactlog](https://github.com/rstudio/reactlog) easy reactivity debugger
* [Apexchart](https://apexcharts.com/) A modern JS charting library to build interactive charts with a simple and open source API.
    + [apexcharter](https://github.com/dreamRs/apexcharter) Apexchart R wrapper

<!---Provides beatiful css classes that are intuitavely to explore, add and remeber. Code readability is also a plus for semantic css classes.--->


## Semantic UI

Every homepage uses the same html tags to represent structure and embed content. So the first decision in web development is usually which css library to use in styling your these html tags. This is done via pre-written css classes so we dont have to deal with all the complexity that makes up a proper html page. Changing pre-written classes always to keep all other attributes encapsulated into a css class. In this guide we entirely base these css classes on the semantic ui libraries. 

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
  <link rel="stylesheet" type="text/css" href="...css path..."></link>
  <script src = "...js pasth..." ></script>
</head> 
```

href and src can either take a local file in `www` or you can load a file dynamically from a CDN: 

In shiny this would translate to the following:

```
shiny::tags$head(
  suppressDependencies("bootstrap"),
  tags$link(rel="stylesheet", type="text/css", href="...css path...")
)
```

Why do I see this rarely in a shiny app? Because shiny provides you some tidy wrappers to insert your code dependencies. If you are working with `shinyUI()` or `semanticPage()` this header creation is taken care for you  by generating exactly the code shown above. dashboardPage() is a wrapper to semanticPage that standardizes the input as header, sidebar and footer + adds css and js dependencies. And in the case you want to add custom css and js paths you can call shiny::tags$head() wherever you want in your app. In order to avoid css class conflicts we categorically suppress other UI frameworks with `suppressDependencies("bootstrap")`. Now you know how css and js libraries are loaded into a shiny app. 


### UI Elements

This section gives three short examples how to implement semantic ui classes, starting simple with a header, followed by a more complex card and finally an accordion that involves minimal javascript. Sometimes we can use shortcuts to make our life easier like dropdowns, tabsets or boxes which are provided by shiny.semantic. 


#### Header


A simple [ui header](https://semantic-ui.com/elements/header.html) can be coded by 

```
<div class = "ui header">Hello world</div>
```
if we want to change only one attribute, semantic ui provides you a tone of consistent objects like "header", "image" or "segment" and adjectives like red, green, yellow etc or mini, small, big, massive.

```
<div class = "ui massive red header">Hello world</div>
```
This is build in to semantic ui. You can always enforce your one desired design by overwriting some attributes of the classes above. This can be done also in a macro CSS script. For example

```
<div class = "ui massive red header" style = "color:#00FF00;">Hello world</div>
```

If we want to translate this into shiny code we replace html tags with shiny functions. With `shiny::tags$...` you can find all html tags implemented as function. Instead of `<tag ...>`we simply call `tag(...)`. Also instead of plain text, strings with quotation marks have to be used. Space between attributes is not white but separated by a comma. If you plan to use special html attributes like `for` and `data-tab` we have to treat it as R attribute using ticks ````. 

```
div(class = "ui massive red header", style = "color:#00FF00;", "Hello world")
```

At this point it makes sense to go to the official documentation to see other options for the class header or explore other UI elements.


### Card

[ui card](https://semantic-ui.com/elements/card.html)



## Accordion

[ui accordion](https://semantic-ui.com/elements/accordion.html)






