
double_colon_calls <- function(func) {
  calls <- find_double_colon_calls(body(func))
  match_to_parse_data(calls, func, mode = "::")
}

find_double_colon_calls <- function(expr) {
  L <- character()

  get_dc <- function(expr) {
    if (is.call(expr) && is.call(expr[[1]]) &&
        identical(expr[[1]][[1]], quote(`::`))) {
      L <<- c(L, paste(expr[[1]][[2]], sep = "::", expr[[1]][[3]]))
    }
  }

  walk_lang(expr, get_dc)
  L
}
