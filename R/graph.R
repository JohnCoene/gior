#' Initial Country
#'
#' Set initially selected country
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
