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

  if(missing(country) || missing(g))
    stop("missing g, or country", call. = FALSE)

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

  if(missing(g))
    stop("missing g", call. = FALSE)

  cntrl <- list(
    disableUnmentioned = disable.unmentioned,
    lighteMentioned = lighten.mentioned,
    inOnly = in.only,
    outOnly = out.only,
    initCountry = init.country,
    halo = halo
  )

  cntrl <- .filter_list(cntrl)

  g$x$configs$control <- cntrl

  g

}

#' @rdname config
#' @export
g_color <- function(g, surface = NULL, selected = NULL, inn = NULL, out = NULL,
                    halo = NULL, background = NULL){

  if(missing(g))
    stop("missing g", call. = FALSE)

  col <- list(
    surface = surface,
    selected = selected,
    `in` = inn,
    out = out,
    background = background
  )

  col <- .filter_list(col)

  g$x$configs$color <- col

  g

}

#' @rdname config
#' @export
g_brightness <- function(g, ocean = .5, mentioned = .5, related = .5){

  if(missing(g))
    stop("missing g", call. = FALSE)

  bright <- list(
    ocean = ocean,
    mentioned = mentioned,
    related = related
  )

  bright <- .filter_list(bright)

  g$x$configs$brightness <- bright

  g

}


#' Style
#'
#' Set globe style.
#'
#' @inheritParams g_data
#' @param style Style, see details.
#'
#' @details Valid \code{style} include:
#'
#' \itemize{
#'   \item{\code{blueInk}}
#'   \item{\code{earlySpring}}
#'   \item{\code{frozenBerry}}
#'   \item{\code{gorgeousDream}}
#'   \item{\code{juicyCake}}
#'   \item{\code{lemonGate}}
#'   \item{\code{magic}}
#'   \item{\code{mint}}
#'   \item{\code{nearMoon}}
#'   \item{\code{octoberParty}}
#'   \item{\code{redBlue}}
#'   \item{\code{strawberry}}
#'   \item{\code{sunset}}
#' }
#'
#' @examples
#' data("country_data")
#'
#' globe <- country_data %>%
#'   gior(init.country = "CN") %>%
#'   g_data(from, to, value)
#'
#' g_style(globe, "strawberry")
#' g_style(globe, "magic")
#'
#' @export
g_style <- function(g, style){

  if(missing(style) || missing(g))
    stop("missing g, or style", call. = FALSE)

  g$x$style <- style

  g

}
