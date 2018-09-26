s<-rep(0,nlevels(nbadata$Tm))
for(i in 1:dim(nbadata)[1]) {
  for(j in 1:nlevels(nbadata$Tm)) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      s[j]=s[j]+nbadata[i,25]} 
  } 
}
a=c(levels(nbadata$Tm),"")
b=c(s,mean(s))
Data=data.frame(a,b)
library(plyr)
Data=arrange(Data,b)
Data
barplot(Data$b,horiz = TRUE,names.arg = Data$a,cex.names=0.5,col=c(rep('gray',13),'red',rep('gray',17)),las=1)
abline(v = mean(s), col = 'green')

