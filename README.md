# gior

An htmlwidget for [gio.js](http://giojs.org/).

This widget was built for as support for the [How to build an htmlwidget blogpost](), **it works but is incomplete, feel free to read the [blogpost]() and finish it yourself.**

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
