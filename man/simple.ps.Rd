% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/simple.ps.R
\name{simple.ps}
\alias{simple.ps}
\title{Generate Lasso Propensity Score}
\usage{
simple.ps(formula, data, ...)
}
\arguments{
\item{data}{data frame to use in fitting the propensity score}

\item{...}{optional methods for \code{\link{glmnet}}}

\item{\code{\link{formula}}}{exposure ~ match features}
}
\value{
A list with 2 elements. $model Contains the fitted model,
and $predicted Contains the predicted propensity score.
}
\description{
This function uses the \code{\link{glmnet}} package of Hastie et al to
generate a propensity score.
}
\examples{
data(meps2011)
ps <- simple.ps(vauser ~ sex+age+racex, data=meps2011
                         , weights=meps2011$perwtf)$predicted
}

