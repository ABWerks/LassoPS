#' Generate Predicted Lasso Propensity Score
#' 
#' This function uses the \code{\link{glmnet}} package of Hastie et al to 
#' generate a predicted propensity score via cross validation.  
#'
#' @param \code{\link{formula}} exposure ~ match features
#' @param train data frame for the training step of the lasso propensity score
#' @param test data frame for the prediction
#' @param ... optional methods for \code{\link{cv.glmnet}}
#' @return Vector of propensity scores
#' @examples
#' data(list=c("meps2011","meps2010"))
#' ps <- cv.ps(vauser ~ sex+age+racex, train=meps2010
#'                      , test=meps2011, nfold=5
#'                      , weights=meps2010$perwtf)
#'  
cv.ps <- function(formula, train, test, ...) {
    ff <- as.formula(formula)
    mm.train <- model.matrix(ff, train)
    mm.test <- model.matrix(ff, test)
    outcome <- as.character(ff[[2]])
    lasso.mm <- cv.glmnet(x=mm.train, y=train[,outcome]
                          , intercept=FALSE, family="binomial", ...)
    .LassoPS <- predict(lasso.mm, newx=mm.test,s="lambda.min"
                        , type="response", ...)
    return(.LassoPS)	
}
