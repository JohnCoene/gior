.filter_list <- function(x){
  x[lapply(x, length) > 0]
}
