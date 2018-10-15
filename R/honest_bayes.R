#' A top level function for performing non parametric learning.
#'
#'@param centre_model A previously fitted Bayesian model to act as a centering model.
#'@param new_model_function A function that fits a new model given a dataset and a weight vector and returns the parameters or predicted values as required.
#'@param simulate_function A function that takes centremodel and returns a simulated dataset for one draw of the posterior from centremodel
#'@param c The mixing parameter (length one positive) that governs the strength of the centering model.
#'@param T How many samples to draw for each simulated dataset.
#'@param N how many bootstrap iterations to run.
#'@param original_data A data frame containing the original data.
#'@param How many cores to use.
#'@export

honest_bayes <- function (centre_model,  new_model_function, simulate_function, c, T, N, original_data, ncores, ...){
  UseMethod("honest_bayes", model)

}


honest_bayes.default <- function (centre_model,  new_model_function, simulate_function, c, T, N, original_data, ncores, ...){

  data <- simulate_data(centre_model, simulate_function, c, T, N, original_data, ncores)

  out <- npl(new_model_function, data$data, data$weights, N, ncores)
}


honest_bayes.stanfit <- function (centre_model,  new_model_function = NULL, simulate_function = NULL, c, T, N = NULL, original_data, ncores, ...){

  if(is.null(new_model_function)){
    new_model_function <- create_stan_mle(centre_model)
  }

  if(is.null(simulate_function)){
    simulate_function <- create_stan_sim(centre_model)
  }

  if(is.null(N)){
    # however you get samples out of a Stan model
    N <- length(centre_model$parameters)
    if(N > 1000){
      stop('Stan model has over 1000 parameter samples. Please set N explicitly if you want too run this many bootstrap iterations')
    }
  }

  results <- honest_bayes.default(centre_model,  new_model_function, simulate_function, c, T, N, original_data, ncores, ...)

}



honest_bayes.brms <- function(centre_model,  new_model_function = NULL, simulate_function = NULL, c, T, N = NULL, original_data, ncores, ...){

 stan_model <- as.stan_model(centre_model)

  results <- honest_bayes.stanfit(centre_model,  new_model_function = NULL, simulate_function = NULL, c, T, N = NULL, original_data, ncores, ...)



}
