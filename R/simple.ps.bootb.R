simple.ps.bootb <- function(R, data, formula, ...){
	i <- sample.int(nrow(data), nrow(data), replace=TRUE)
	btdata <- data[i,]
	simple.ps(data=btdata, ...)$predicted
}
