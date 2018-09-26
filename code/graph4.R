r<-rep(0,nlevels(nbadata$Tm))
n<-rep(0,nlevels(nbadata$Tm))
for(i in 1:dim(nbadata)[1]) {
  for(j in 1:nlevels(nbadata$Tm)) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      r[j]=r[j]+nbadata$TRB[i]
  } 
  }
}
  a1=levels(nbadata$Tm)
  b21=r
  Datar=data.frame(a1,r)
  barplot(Datar$r,names.arg = Datar$a1,cex.names=0.5,las=2,main='Total rebounds per team',ylim = c(0,4000),col=c(rep('blue',20),'red','blue', 'green', rep('blue',7)))