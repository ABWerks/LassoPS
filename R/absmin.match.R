absmin.match <- function(psdata, exposure, ...){
    if(is.null(caliper))
        caliper <- sd(psdata$.LassoPS, na.rm=TRUE)/5
	.cases <- psdata[psdata[,exposure]==1, ]
	.controls <- psdata[psdata[,exposure]==0, ]

	.matches <- NULL
	.match <- NULL
		
	if(exact){
		.matches <- absmin.outer.exact(.row=.cases, .col=.controls
										, .feature=".LassoPS"
										, .caliper=caliper)
		.match <- rbind(.cases[.matches[,1],], .controls[.matches[,2],])
		
	} else {
		
		.match.controls <- .controls[unique(
			absmin.outer.simple(.row=.cases, .col=.controls
				, .feature=".LassoPS")[,1]),]
		.match <- rbind(.cases, .match.controls)		
	}

	return(.match)
}