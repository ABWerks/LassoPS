# Simple utility function to calculate the absolute difference between
# case and control propensity scores
# @param .row Data Frame of the exposure group (cases).
# @param .col Data Frame of the match group (controls).
# @param .feature Name of the propensity score feature in 
# the above data frames.
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
# foo <- absmin.outer.simple(cases,controls,".LassoPS")
# 
absmin.outer.simple <-
function(.row, .col, .feature){
    .outer.closest <- outer(X = .row[, .feature]
                            , Y =  .col[, .feature]
                            , FUN=function(x,y) abs(x-y))
    .matches.index <- apply(.outer.closest, 1, which.min)
    .matches.ps <- .col[.matches.index, .feature]
    .matches <- cbind(.matches.index, .matches.ps)
    return(.matches)
}
