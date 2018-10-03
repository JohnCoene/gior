# gior

An htmlwidget for [gio.js](http://giojs.org/).

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
