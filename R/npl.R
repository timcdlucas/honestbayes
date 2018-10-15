#' A function for performing an npl update given a a list of data frames of simulated data and a function for fitting a model.


npl <- function(fit_function, data){

  assert_that(is.list(data))
  assert_that(all(sapply(data, is.data.frame)))
  assert_that(inherits(fit_function, 'function'))


  return(results_matrix)

}