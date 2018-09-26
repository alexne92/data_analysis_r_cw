sh<-rep(0,nlevels(nbadata$Tm))
na<-rep(0,nlevels(nbadata$Tm))
for(j in 1:nlevels(nbadata$Tm)) {
  for(i in 1:dim(nbadata)[1]) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      an=nbadata$X2P[i]/nbadata$X2PA[i]
      if(is.nan(an)) {an=0}
      sh[j]=sh[j]+an
      na[j]=na[j]+1} 
  } 
}
sh=sh/na
a11=c(levels(nbadata$Tm),"")
b11=c(sh,mean(sh))
Data11=data.frame(a11,b11)
library(plyr)
Data11=arrange(Data11,b11)
Data11
barplot(Data11$b11,names.arg = Data11$a11,main="Success rate of 2p shots",cex.names=0.5,col=c(rep('gray',15),'red',rep('gray',15)),las=2,ylim = c(0,0.6))



abline(h = mean(sh), col = 'green')

