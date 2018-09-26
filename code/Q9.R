nbanewdata<-nbadata
po<-NULL
for(i in 1:(dim(nbanewdata)[1]-1)){
  for(j in (i+1):dim(nbanewdata)[1]) {
    if(as.character(nbanewdata$Player[i])==as.character(nbanewdata$Player[j])) {
      po<-c(po,j)
    }
  }
}
for(i in 1:(length(po))) {
  if(po[i]==136|po[i]==230) {
    print(i)
  }
}
po2<-po[-c(8,9,23,24)]
inpo<-po2-1
nbanewdata[inpo,6:25]<-nbanewdata[inpo,6:25]+nbanewdata[po2,6:25]
nbanewdata[134,6:25]<-nbanewdata[134,6:25]+nbanewdata[136,6:25]
nbanewdata[228,6:25]<-nbanewdata[228,6:25]+nbanewdata[232,6:25]
nbanewdata2<-nbanewdata[-unique(po),]


v5<-NULL
for(i in 1:dim(nbanewdata2)[1]) {
  if(nbanewdata2$MP[i]/nbanewdata2$G[i]<5) {v5<-c(v5,i)}
}
gininbadata<-nbanewdata2[-v5,]
gp2<-NULL
gm2<-NULL
for(j in 1:nlevels(gininbadata$Tm)) {
  e3<-NULL
  e4<-NULL
  for(i in 1:dim(gininbadata)[1]) {
    if(as.character(gininbadata[i,5])==levels(gininbadata$Tm)[j]) {
      e3<-c(gp1,gininbadata$PTS[i])
      e4<-c(gp1,gininbadata$MP[i])
      gp2[j]<-Gini(e3)
      gm2[j]<-Gini(e4)
    }
  }
}
names(gp2)<-levels(gininbadata$Tm)
names(gm2)<-levels(gininbadata$Tm)
gp2
gm2
GP<-gp1-gp2
GM<-gm1-gm2
GP
GM