% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/cv.ps.R
\name{cv.ps}
\alias{cv.ps}
\title{Generate Predicted Lasso Propensity Score}
\usage{
cv.ps(formula, train, test, ...)
}
\arguments{
\item{train}{data frame for the training step of the lasso propensity score}

\item{test}{data frame for the prediction}

\item{...}{optional methods for \code{\link{cv.glmnet}}}

\item{\code{\link{formula}}}{exposure ~ match features}
}
\value{
Vector of propensity scores
}
\description{
This function uses the \code{\link{glmnet}} package of Hastie et al to
generate a predicted propensity score via cross validation.
}
\examples{
data(list=c("meps2011","meps2010"))
ps <- cv.ps(vauser ~ sex+age+racex, train=meps2010
                     , test=meps2011, nfold=5
                     , weights=meps2010$perwtf)
}

