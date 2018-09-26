gp1<-NULL
gm1<-NULL
for(j in 1:nlevels(nbadata$Tm)) {
  e1<-NULL
  e2<-NULL
  for(i in 1:dim(nbadata)[1]) {
    if(as.character(nbadata[i,5])==levels(nbadata$Tm)[j]) {
      e1<-c(gp1,nbadata$PTS[i])
      e2<-c(gp1,nbadata$MP[i])
      gp1[j]<-Gini(e1)
      gm1[j]<-Gini(e2)
    }
  }
}
names(gp1)<-levels(nbadata$Tm)
names(gm1)<-levels(nbadata$Tm)
gp1
gm1
