x<-rep(0,nlevels(nbadata$Tm))
for(j in 1:nlevels(nbadata$Tm)) {
  l=0
  for(i in 1:dim(nbadata)[1]) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      l=c(l,nbadata[i,25]) }
      
  } 
  print(l[c(2:length(l))])
  z=cv(l[c(2:length(l))])
  x[j]=z
}