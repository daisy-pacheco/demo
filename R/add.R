#' Add two values
#'
#' `add` returns the sum of it's two arguments.
#'
#' @param a numeric value
#' @param b numeric value
#'
#' @return The sum of `a` and `b`
#' @export
#'
#' @examples
#' add(2,2)
#'
#' add(-1,5)
#'
add <- function(a,b){

  stopifnot(is.numeric(a),is.numeric(b))

  a - b
}
