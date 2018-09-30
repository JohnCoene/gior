#' Clear
#'
#' Clear all data
#'
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'
#'   data("country_data")
#'
#'   ui <- fluidPage(
#'     actionButton("clear", "clear"),
#'     giorOutput("gior")
#'   )
#'
#'   server <- function(input, output, session){
#'     output$gior <- renderGior({
#'       country_data %>%
#'         gior() %>%
#'         g_data(from, to, value)
#'     })
#'
#'     observeEvent(input$clear, {
#'       giorProxy("gior") %>%
#'         g_clear_p()
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#'
#' @export
g_clear_p <- function(proxy){

  if (!"giorProxy" %in% class(proxy))
    stop("must pass giorProxy object", call. = FALSE)

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("g_clear_p", data)

  return(proxy)
}

#' Add data
#'
#' Add data to visualisation.
#'
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'
#'   data("country_data")
#'
#'   ui <- fluidPage(
#'     actionButton("add", "add"),
#'     actionButton("clear", "clear"),
#'     giorOutput("gior")
#'   )
#'
#'   server <- function(input, output, session){
#'     output$gior <- renderGior({
#'       data %>%
#'         gior() %>%
#'         g_data(from, to, value)
#'     })
#'
#'     observeEvent(input$clear, {
#'       giorProxy("gior") %>%
#'         g_clear_p()
#'     })
#'
#'     observeEvent(input$add, {
#'       giorProxy("gior") %>%
#'         g_data_p(country_data, from, to, value)
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#'
#' @export
g_data_p <- function(proxy, data, from, to, value, ...){

  if (!"giorProxy" %in% class(proxy))
    stop("must pass giorProxy object", call. = FALSE)

  e <- dplyr::enquo(from)
  i <- dplyr::enquo(to)
  v <- dplyr::enquo(value)

  json <- g$x$data %>%
    dplyr::select(
      e = !!e,
      i = !!i,
      v = !!v,
      ...
    ) %>%
    apply(., 1, as.list)

  data <- list(id = proxy$id, json = json)

  proxy$session$sendCustomMessage("g_data_p", data)

  return(proxy)
}

#' Initialise
#'
#' (Re)- initialise the globe.
#'
#' @export
g_init_p <- function(proxy){

  if (!"giorProxy" %in% class(proxy))
    stop("must pass giorProxy object", call. = FALSE)

  data <- list(id = proxy$id)

  proxy$session$sendCustomMessage("g_init_p", data)

  return(proxy)
}
