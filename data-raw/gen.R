country_data <- jsonlite::fromJSON("https://raw.githubusercontent.com/syt123450/giojs/master/examples/data/sampleData.json")

names(country_data) <- c("from", "to", "value")

continents <- c(
  "Oceania",
  "North America",
  "South America",
  "Europe",
  "Asia",
  "Africa"
)

continent_data <- dplyr::tibble(
  from = sample(continents, 25, replace = TRUE),
  to = sample(continents, 25, replace = TRUE),
  value = runif(25)
)

continent_data <- continent_data %>%
  filter(from != to)

devtools::use_data(country_data,  continent_data, overwrite = TRUE)
