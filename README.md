# gior

An htmlwidget for [gio.js](http://giojs.org/) build for the [Geneva R User Group](https://twitter.com/GenevaRUsers). *Not a work in progress, rather left unfinished on purpose.* It comes with an accompanying [blog post](https://blog.john-coene.com/posts/2018-01-01-widget/) that explains its inner-working which will let you understand how to re-build or finish this package yourself.

## About

This [htmlwidget](https://www.htmlwidgets.org/) aims at demonstrating 

1. The ease with which one can build an htmlwidget such as [plotly](https://plot.ly/r/) or [leaflet](https://rstudio.github.io/leaflet/).
2. The surprisingly little knowledge of JavaScript that is required.
3. Explain some amazing undocumented features of htmlwidgets.

## Installation

Install from Github.

``` r
devtools::install_github("JohnCoene/gior")
```

## Example

This is a basic example which shows you how to solve a common problem:

```r
data("country_data")

country_data %>%
  gior() %>%
  g_data(from, to, value)
```

## [Documentation](https://gior.john-coene.com/)
