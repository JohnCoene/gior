# gior

## Installation

Install from Github.

``` r
devtools::install_github("JohnCoene/gior")
```

**Supports Continents**

- Oceania
- North America
- South America
- Europe
- Asia
- Africa

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DT)
library(gior)
library(shiny)

ui <- fluidPage(
  fluidRow(
    column(
      10,
      h3("Map"),
      giorOutput("gior")
    ),
    column(
      2,
      h3("Selected"),
      verbatimTextOutput("sel")
    )
  ),
  fluidRow(
    column(
      12,
      h3("Related countries"),
      DTOutput("rel")
    )
  )
)

server <- function(input, output, session) {
  data("country_data")

  output$gior <- renderGior({
    country_data %>%
      gior() %>%
      g_data(from, to, value)
  })

  output$sel <- renderPrint({
    input$gior_selected
  })

  output$rel <- renderDT({
    DT::datatable(input$gior_related)
  })
}

shinyApp(ui, server)
```

