#' Initial Country
#'
#' Set initially selected country
#'
#' @param g An object of class \code{gior} as returned by \code{\link{gior}}.
#' @param country ISO code 2 of country to have initially selected.
#'
#' @export
g_init <- function(g, country){

  if(missing(country))
    stop("missing country", call. = FALSE)

  g$x$initCountry <- country

  g
}
