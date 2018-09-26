s<-rep(0,nlevels(nbadata$Tm))
for(i in 1:dim(nbadata)[1]) {
  for(j in 1:nlevels(nbadata$Tm)) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      s[j]=s[j]+nbadata[i,25]} 
  } 
}