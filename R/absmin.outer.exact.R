# Simple utility function to calculate the absolute difference between
# case and control propensity scores while ensuring matches are nearly 
# unique.
# @param .row Data Frame of the exposure group (cases).
# @param .col Data Frame of the match group (controls).
# @param .feature Name of the propensity score feature in
# @param .caliper Maximum difference between propensity scores used in
# match. Default value is 0.01.
# @return Vector of match indexi
# @examples 
# data(list=c("meps2010","meps2011"))
# meps2010$region <- factor(meps2010$region,levels=1:4
#                      , labels=c("NE","MW","S","W"))
# # Create balanced CV folds by region
# folds10 <- outer(X=1:10,Y=meps2010$region
#              , FUN=function(x,y){
#                      sample(rep(1:10
#                      , ceiling(length(y)/10)))
#                  })[sample.int(10,1),]
# # Run the CV Propensity Model
# meps2011$.LassoPS <- cv.ps(vauser ~ sex+age+racex, train=meps2010
#                          , test=meps2011, weights=meps2010$perwtf
#                          , nfold=10, foldid=folds10
#                          , type.measure="auc")    
# cases <- meps2011[meps2011$vauser==1, ]
# controls <- meps2011[meps2011$vauser==0, ]   
# # Run the function
# foo <- absmin.outer.exact(cases,controls,".LassoPS")
absmin.outer.exact <- 
    function(.row, .col, .feature, .caliper=0.01){
        # All absolute distances array	
        .outer.closest <- outer(X = .row[, .feature]
                                , Y =  .col[, .feature]
                                , FUN=function(x=X,y=Y) abs(x-y))
        # Differences within cliper distance
        .outer.caliper <- .outer.closest[.outer.closest < .caliper]
        # Case index
        .cases.i <- rep(rownames(.row),dim(.col)[1])
        .cases.i <- .cases.i[.outer.closest < .caliper]
        # Control index
        .control.i <- rep(rownames(.col), each=dim(.row)[1])
        .control.i <- .control.i[.outer.closest < .caliper]
        # Create vector from .outer.closest array
        # .bigm <- do.call("c",as.list(.outer.caliper))
        # Take only those absolute difference within caliper and find the corresponding
        # Cases and Controls
        .cases.i <- .cases.i[order(.outer.caliper)]
        .cases.i <- .cases.i[!duplicated(.cases.i)]
        .control.i <- .control.i[order(.outer.caliper)]
        .control.i <- .control.i[!duplicated(.control.i)]
        .matches <- cbind(.cases.i,.control.i[1:length(.cases.i)])
        return(.matches)
    }