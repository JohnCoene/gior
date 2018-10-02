.onAttach <- function(libname, pkgname) {
  shiny::registerInputHandler("giorParseJS", function(data, ...) {
    jsonlite::fromJSON(jsonlite::toJSON(data, auto_unbox = TRUE))
  }, force = TRUE)
}

.onLoad <- function(libname, pkgname) {
  shiny::registerInputHandler("giorParseJS", function(data, ...) {
    jsonlite::fromJSON(jsonlite::toJSON(data, auto_unbox = TRUE))
  }, force = TRUE)
}
