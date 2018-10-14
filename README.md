# gior

An htmlwidget for [gio.js](http://giojs.org/) build for the [Geneva R User Group](https://twitter.com/GenevaRUsers).

## About

This [htmlwidget](https://www.htmlwidgets.org/) aims at demonstrating 

1. The ease with which one can build an htmlwidget such as [plotly](https://plot.ly/r/) or [leaflet](https://rstudio.github.io/leaflet/).
2. The surprisingly little knowledge of JavaScript that is required.
3. Explain some amazing undocumented features of htmlwidgets.

**Read [walkthrough]() to build the widget along!** 

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
