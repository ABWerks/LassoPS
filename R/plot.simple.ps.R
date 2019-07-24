# Plot the bootstrap prediction ROC curves from a simple.ps model
# @param preds. A list of the bootstrap predictions
# @param target. The exposure variable
# @examples
# library(LassoPS)
# data(meps2011)
# ps <- simple.ps(vauser ~ sex+age+racex, data=meps2011
#                  , weights=meps2011$perwtf)$predicted
#                  
plot.simple.ps <- 
function(preds, target, ...){
	n <- length(preds)
	l.target <- lapply(1:n, FUN= function(x) target)
	pred <- prediction( predictions=preds, labels=l.target, ...)
	perf <- performance(pred,"tpr","fpr", ...)
	foo <- heat.colors(n, alpha=.6)
	par(bg="mistyrose1", mai=c(1.2,1,.8,.8))
	plot(perf,main="ROCR Bootstrap Prediction Curve",type="n"
	, xlab="False Positive Rate", ylab="True Positive Rate", box.lty=7
	, box.lwd=5
	, box.col="mistyrose2", lty=4, col=foo[1]
	, xaxis.col="blue", xaxis.col.axis="blue", yaxis.col="mistyrose4"
	, yaxis.at=c(0,0.5,0.8,0.85,0.9,1), yaxis.las=1)
	for(i in 1:n){
		pred <- prediction( preds[[i]], l.target[[i]])
		perf <- performance(pred,"tpr","fpr")
		plot(perf, col=foo[i],add=TRUE)
	}
	plot(perf, avg="horizontal", col=4, spread.estimate="boxplot", add=TRUE)
	auc <- performance(pred,"auc")
	auc <- round(unlist(slot(auc,"y.values")),2)
	text(0.8,0.1,paste0("AUC=",auc),cex=1.4,col="mistyrose4")
}
