% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/options.R
\name{g_control}
\alias{g_control}
\alias{g_color}
\alias{g_brightness}
\title{Configure}
\usage{
g_control(g, disable.unmentioned = FALSE, lighten.mentioned = FALSE,
  in.only = FALSE, out.only = FALSE, init.country = "US",
  halo = TRUE)

g_color(g, surface = NULL, selected = NULL, inn = NULL, out = NULL,
  halo = NULL, background = NULL)

g_brightness(g, ocean = 0.5, mentioned = 0.5, related = 0.5)
}
\arguments{
\item{g}{An object of class \code{gior} as returned by \code{\link{gior}}.}

\item{disable.unmentioned}{\code{TRUE} to set unmentioned country unclickable.}

\item{lighten.mentioned}{\code{TRUE} to set mentioned country brighter than unmentioned country.}

\item{in.only, out.only}{\code{TRUE} to only display data going from or into the destination country.}

\item{init.country}{An ISO code of the country displayed at the center of the screen when the globe has been initialized.}

\item{halo}{\code{TRUE} to turn on the halo or specify color.}

\item{surface}{Color scheme of land and ocean area.}

\item{selected}{Color of selected country.}

\item{inn, out}{Color of lines going in and out of countries.}

\item{background}{Color of the background.}

\item{ocean, mentioned, related}{Brightness of the ocean, mentioned and related countries.}
}
\description{
Configure options.
}
