plot.stdiff <- 
function(matches, exposure,features,...){
	m <- matches$matched

	s1 <- m[,exposure]==1
	s2 <- m[,exposure]==0
	n <- min(length(s1),length(s2))
	
	l.features <- lapply(as.list(m[,features]),FUN=bootsdiff,s1,s2,n)
	allc <- do.call("rbind", l.features)
	allc <- allc[!is.na(allc[,1]),]
	bmax <- ceiling(max(allc[,3],na.rm=TRUE))
	bmin <- floor(min(allc[,2],na.rm=TRUE))
	
	par(bg="mistyrose1", mai=c(1,1,1,.8))
	plot(x=c(bmin,bmax),y=c(-1,1),type="n",axes=FALSE,xlab="",ylab="",...)
	abline(v=0,col="dodgerblue4",lwd=3,lty=4,ljoin=2)
	abline(v=0,col="linen",ljoin=2)
	tixn <- seq(-1,1,length=nrow(allc)) 
	axis(2,at=tixn,labels=FALSE,col="dodgerblue4")
	axis(3,at=c(bmin,bmin/2,0,bmax/2,bmax),col="dodgerblue4",labels=FALSE)
	text(x=c(bmin,bmin/2,0,bmax/2,bmax),par("usr")[2]+.04
			,labels=c(bmin,bmin/2,"",bmax/2,bmax)
			,pos=2,srt=0,xpd=TRUE,col="slategrey")
	text(y=tixn, par("usr")[1], labels = rownames(allc), srt = 0, pos = 2, xpd = TRUE, col="slategrey")
	
	points(x= allc[,1],y=seq(-1,1,length=nrow(allc)),pch=18,col="mistyrose4",cex=1.2)
	for(i in 1:nrow(allc)){
		lines(x= allc[i,-1],y=rep(tixn[i],2),lwd=2,col="mistyrose4")	
	}

}
