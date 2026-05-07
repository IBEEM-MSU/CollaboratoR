test_that("errorSaver returns plain result without conditions", {
  wrapped <- CollaboratoR::errorSaver(function(x) x * 2)

  expect_equal(wrapped(3), 6)
})

test_that("errorSaver captures warnings", {
  wrapped <- CollaboratoR::errorSaver(function(x) {
    warning("careful")
    x + 1
  })

  out <- wrapped(2)

  expect_type(out, "list")
  expect_equal(out[[1]], 3)
  expect_equal(out$warnings, "careful")
  expect_null(out$errors)
})

test_that("errorSaver captures errors", {
  wrapped <- CollaboratoR::errorSaver(function() stop("boom"))

  out <- wrapped()

  expect_type(out, "list")
  expect_null(out[[1]])
  expect_null(out$warnings)
  expect_equal(out$errors, "boom")
})

test_that("get_col_type_from_spec returns types in requested column order", {
  spec <- data.frame(
    col_name = c("a", "b", "c"),
    data_str = c("numeric", "character", "Date"),
    stringsAsFactors = FALSE
  )

  out <- CollaboratoR::get_col_type_from_spec(c("c", "a", "b"), spec)

  expect_equal(unname(out), c("Date", "numeric", "character"))
})

test_that("as.Date.flexible parses supported formats and blank values", {
  date_fun <- get("as.Date.flexible", asNamespace("CollaboratoR"))
  out <- date_fun(c("31/12/2020", ""))

  expect_s3_class(out, "Date")
  expect_equal(out[1], as.Date("2020-12-31"))
  expect_true(is.na(out[2]))
})

test_that("type_converter_fun maps known and unknown type labels", {
  date_fun <- get("as.Date.flexible", asNamespace("CollaboratoR"))

  expect_identical(CollaboratoR::type_converter_fun("factor"), as.factor)
  expect_identical(CollaboratoR::type_converter_fun("f"), as.factor)

  expect_identical(CollaboratoR::type_converter_fun("double"), as.numeric)
  expect_identical(CollaboratoR::type_converter_fun("d"), as.numeric)
  expect_identical(CollaboratoR::type_converter_fun("numeric"), as.numeric)
  expect_identical(CollaboratoR::type_converter_fun("n"), as.numeric)

  expect_identical(CollaboratoR::type_converter_fun("Date"), date_fun)
  expect_identical(CollaboratoR::type_converter_fun("D"), date_fun)

  expect_identical(CollaboratoR::type_converter_fun("something_else"), as.character)
})

test_that("type_code_to_readr_code normalizes full names", {
  expect_equal(CollaboratoR:::type_code_to_readr_code("character"), "c")
  expect_equal(CollaboratoR:::type_code_to_readr_code("INTEGER"), "i")
  expect_equal(CollaboratoR:::type_code_to_readr_code("factor"), "f")
  expect_equal(CollaboratoR:::type_code_to_readr_code("numeric"), "d")
  expect_equal(CollaboratoR:::type_code_to_readr_code("Date"), "D")
  expect_equal(CollaboratoR:::type_code_to_readr_code("x"), "x")
})

test_that("spec_to_readr_col_types builds named readr type list", {
  spec <- data.frame(
    col_name = c("plot_id", "mass", "sample_date", "grp"),
    data_str = c("character", "numeric", "Date", "f"),
    stringsAsFactors = FALSE
  )

  out <- CollaboratoR::spec_to_readr_col_types(spec)

  expect_type(out, "list")
  expect_named(out, c("plot_id", "mass", "sample_date", "grp"))
  expect_equal(unname(unlist(out)), c("c", "d", "D", "f"))
})