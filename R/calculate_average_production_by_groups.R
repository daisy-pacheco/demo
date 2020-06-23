#' Calculate the average production of a dataframe
#'
#' This function computes the average production of a dataframe. Further
#' grouping variables can be passed to subsequent arguments.
#'
#' @param data A dataframe with the column `production`.
#' @param ... Variables to group by.
#'
#' @return A dataframe with the summarized column `average_production`.
#' @export
#'
#' @examples
#' data <- tibble::tribble(
#'   ~sector,  ~technology, ~production,
#'   "power", "renewables",        100L,
#'   "power",      "hydro",         10L,
#'   "automotive",        "ice",          5L
#' )
#'
#' calculate_average_production_by_groups(data)
#'
#' calculate_average_production_by_groups(data, sector)
#'
calculate_average_production_by_groups <- function(data, ...){
  stopifnot(is.data.frame(data))

  check_crucial_names(data, "production")

  data %>%
    dplyr::group_by(...) %>%
    dplyr::summarize(average_production = mean(production))
}

check_crucial_names <- function(x, expected_names) {
  stopifnot(rlang::is_named(x))
  stopifnot(is.character(expected_names))

  ok <- all(unique(expected_names) %in% names(x))
  if (!ok) {
    abort_missing_names(sort(setdiff(expected_names, names(x))))
  }

  invisible(x)
}

abort_missing_names <- function(missing_names) {
  nms <- paste0(sprintf("`%s`", missing_names), collapse = ", ")
  msg <- paste0("Must have missing names:\n", nms, ".")
  rlang::abort(msg, class = "missing_names")
}
