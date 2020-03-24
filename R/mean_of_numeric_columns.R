#' Compute the mean of numeric columns in a data frame
#'
#' @param data A data.frame.
#'
#' @return A data.frame.
#' @export
#'
#' @examples
#' data <- tibble::tibble(x = 2, y = 4, z = 8)
#' mean_of_numeric_columns(data)


## dplyr 1.0.0
## https://dplyr.tidyverse.org/dev/articles/colwise.html#how-do-you-convert-existing-code
mean_of_numeric_columns <- function(data) {
  data %>%
    dplyr::mutate(dplyr::across(is.numeric, mean, na.rm = TRUE))
}

