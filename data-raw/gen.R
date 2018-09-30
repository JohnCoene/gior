country_data <- jsonlite::fromJSON("https://raw.githubusercontent.com/syt123450/giojs/master/examples/data/sampleData.json")

names(country_data) <- c("from", "to", "value")

devtools::use_data(country_data, overwrite = TRUE)
