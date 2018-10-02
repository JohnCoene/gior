#' Initial Country
#'
#' Set initially selected country
#'
#' @inheritParams g_data
#' @param country An ISO code of the country displayed at the center of the screen when the globe has been initialized.
#'
#' @examples
#' data("country_data")
#'
#' country_data %>%
#'   gior() %>%
#'   g_data(from, to, value) %>%
#'   g_init("RU")
#'
#' @export
g_init <- function(g, country){

  if(missing(country))
    stop("missing country", call. = FALSE)

  g$x$initCountry <- country

  g
}

#' Configure
#'
#' Configure options.
#'
#' @inheritParams g_data
#' @param disable.unmentioned \code{TRUE} to set unmentioned country unclickable.
#' @param lighten.mentioned \code{TRUE} to set mentioned country brighter than unmentioned country.
#' @param in.only,out.only \code{TRUE} to only display data going from or into the destination country.
#' @param init.country An ISO code of the country displayed at the center of the screen when the globe has been initialized.
#' @param halo \code{TRUE} to turn on the halo or specify color.
#' @param surface Color scheme of land and ocean area.
#' @param selected Color of selected country.
#' @param inn,out Color of lines going in and out of countries.
#' @param background Color of the background.
#' @param ocean,mentioned,related Brightness of the ocean, mentioned and related countries.
#'
#' @rdname config
#' @export
g_control <- function(g, disable.unmentioned = FALSE, lighten.mentioned = FALSE, in.only = FALSE,
                      out.only = FALSE, init.country = "US", halo = TRUE){

  g$x$configs$control <- list(
    disableUnmentioned = disable.unmentioned,
    lighteMentioned = lighten.mentioned,
    inOnly = in.only,
    outOnly = out.only,
    initCountry = init.country,
    halo = halo
  )

  g

}

#' @rdname config
#' @export
g_color <- function(g, surface = "0xFFFFFF", selected = NULL, inn = NULL, out = NULL,
                    halo = NULL, background = NULL){

  g$x$configs$color <- list(
    surface = surface,
    selected = selected,
    `in` = inn,
    out = out,
    background = background
  )

  g

}

#' @rdname config
#' @export
g_brightness<- function(g, ocean = .5, mentioned = .5, related = .5){

  g$x$configs$brightness <- list(
    ocean = ocean,
    mentioned = mentioned,
    related = related
  )

  g

}
