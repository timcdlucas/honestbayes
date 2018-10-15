predict. honest_Bayes <- function (x, newdata, ...){


  has_predict_method <- 'predict' %in% methods(class(x))
  has_newdata_arg <- 'newdata' %in% args()


  if(has_predict_method & has_newdata_arg){
    predictions <- lapply(x$boots, function (b) predict(b, newdata)
  } else if(!is.null(x$predict)){
      predictions <- lapply(x, function (b) x$predict(b, newdata)
  } else {
    stop('new_model needs either a predict method with a newdata argument or a user defined predict function')
  }

  return (predictions)
}