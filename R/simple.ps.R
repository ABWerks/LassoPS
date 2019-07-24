#' Generate Lasso Propensity Score
#' 
#' This function uses the \code{\link{glmnet}} package of Hastie et al to 
#' generate a propensity score.  
#'
#' @param \code{\link{formula}} exposure ~ match features
#' @param data data frame to use in fitting the propensity score
#' @param ... optional methods for \code{\link{glmnet}}
#' @return A list with 2 elements. $model Contains the fitted model, 
#' and $predicted Contains the predicted propensity score.
#' @examples
#' data(meps2011)
#' ps <- simple.ps(vauser ~ sex+age+racex, data=meps2011
#'                          , weights=meps2011$perwtf)$predicted
#' 
simple.ps <- function(formula, data, ...) {
    ff <- as.formula(formula)
	mm <- model.matrix(ff, data)
	outcome <- as.character(ff[[2]])
    lasso.mm <- glmnet(x=mm, y=data[,outcome], intercept=FALSE
		, family="binomial", ...)
	.LassoPS <- predict(lasso.mm, newx=mm,s=min(lasso.mm$lambda)
		, type="response", ...)
	return(list(model=lasso.mm, predicted=.LassoPS))
}
