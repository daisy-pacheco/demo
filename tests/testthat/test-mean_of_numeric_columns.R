test_that("outputs a data.frame", {
  data <- tibble::tibble(a = "a", x = c(1, 1), y = c(2, 2))
  expect_is(mean_of_numeric_columns(data), "data.frame")
})

test_that("outputs expected names", {
  data <- tibble::tibble(a = "a", x = c(1, 1), y = c(2, 2))
  expect_named(mean_of_numeric_columns(data), names(data))
})

test_that("outputs known value", {
  data <- tibble::tibble(a = "a", x = c(1, 1), y = c(2, 2))
  out <- mean_of_numeric_columns(data)
  expect_known_value(out, "ref-mean_of_numeric_columns")
})

test_that("outputs known output", {
  data <- tibble::tibble(a = "a", x = c(1, 1), y = c(2, 2))
  out <- mean_of_numeric_columns(data)
  expect_known_output(out, "ref-mean_of_numeric_columns-output", print = TRUE)
})
