#' Process data
#'
#' Process data previously passed to \code{\link{gior}}.
#'
#' @param g An object of class \code{gior} as returned by \code{\link{gior}}.
#' @param from,to Source and target of edges.
#' @param value Numerical value of edges.
#' @param ... Any other columns to select from the data, i.e.: \code{inColor} or \code{outColor}
#'
#' @examples
#' data("country_data")
#'
#' country_data %>%
#'   gior(init.country = "CN") %>%
#'   g_data(from, to, value)
#'
#' @export
g_data <- function(g, from, to, value, ...){

  if(missing(g))
    stop("missing g", call. = FALSE)

  if(!inherits(g, "gior"))
    stop("g must be of class gior", call. = FALSE)

  if(missing(from) || missing(to) || missing(value))
    stop("missing from, to, or value", call. = FALSE)

  e <- dplyr::enquo(from)
  i <- dplyr::enquo(to)
  v <- dplyr::enquo(value)

  data <- g$x$data %>%
    dplyr::select(
      e = !!e,
      i = !!i,
      v = !!v,
      ...
    ) %>%
    apply(., 1, as.list)

  g$x$data <- data

  return(g)
}
