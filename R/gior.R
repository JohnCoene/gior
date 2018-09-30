#' Initialise
#'
#' Initialise globe
#'
#' @import htmlwidgets
#'
#' @examples
#' data("country_data")
#'
#' country_data %>%
#'   gior() %>%
#'   g_data(from, to, value)
#'
#' @export
gior <- function(data = NULL, initCountry = "US", width = "100%", height = NULL, elementId = NULL) {

  row.names(data) <- NULL

  x = list(
    data = data,
    initCountry = initCountry,
    configs = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'gior',
    x,
    width = width,
    height = height,
    package = 'gior',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      padding = 0,
      browser.fill = TRUE,
      viewer.suppress = TRUE,
      browser.external = TRUE
    )
  )
}

#' Shiny bindings for gior
#'
#' Output and render functions for using gior within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId,id id or output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a gior
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name gior-shiny
#'
#' @export
giorOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'gior', width, height, package = 'gior')
}

#' @rdname gior-shiny
#' @export
renderGior <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, giorOutput, env, quoted = TRUE)
}

#' @rdname gior-shiny
#' @export
giorProxy <- function(id, session = shiny::getDefaultReactiveDomain()){

  proxy <- list(id = id, session = session)
  class(proxy) <- "giorProxy"

  return(proxy)
}
