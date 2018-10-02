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
data("country_data")

country_data %>%
  gior() %>%
  g_data(from, to, value)
```

