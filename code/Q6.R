n<-rep(0,nlevels(nbadata$Tm))
for(j in 1:nlevels(nbadata$Tm)) {
  for(i in 1:dim(nbadata)[1]) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      n[j]=n[j]+1 }
  } 
}
g<-matrix(n,1)
colnames(g)=levels(nbadata$Tm)
colnames(g)[order(g,decreasing=TRUE)][1:5]