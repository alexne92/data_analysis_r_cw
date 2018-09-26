gdata<-nbadata
posit<-NULL
for(i in 1:(dim(gdata)[1]-1)){
  for(j in (i+1):dim(gdata)[1]) {
    if(as.character(gdata$Player[i])==as.character(gdata$Player[j])) {
      posit<-c(posit,j)
    }
  }
}

posit2<-posit[-c(8,9,23,24)]
inposit<-posit2-1
gdata[inposit,6:25]<-gdata[inposit,6:25]+gdata[posit2,6:25]
gdata[134,6:25]<-gdata[134,6:25]+gdata[136,6:25]
gdata[228,6:25]<-gdata[228,6:25]+gdata[232,6:25]
gdata2<-gdata[-unique(posit),]

scatterplot3d(gdata2$FT/gdata2$FTA,gdata2$X2P/gdata2$X2PA,gdata2$X3P/gdata2$X3PA, main="3D Scatterplot",highlight.3d=TRUE,zlab='3P shots success rate',ylab='2P shots success rate',xlab='Free throw success rate')

V1<-gdata2$X3P/gdata2$X3PA
V1[is.nan(V1)]<-0
gd<-cbind(gdata2,V1)
library(plyr)
gd<-arrange(gd,V1)
arxi<-dim(gd)[1]-9
telos<-dim(gd)[1]
V2<-NULL
for(i in arxi:telos) {
  for(j in 1:dim(gdata2)[1]) {
    if(as.character(gd$Player[i])==as.character(gdata2$Player[j])) {
      V2<-c(V2,j)
    }
  }
}
  gdata2[V2,]