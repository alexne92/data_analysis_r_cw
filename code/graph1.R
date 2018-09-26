graphdata<-nbadata
posi<-NULL
for(i in 1:(dim(graphdata)[1]-1)){
  for(j in (i+1):dim(graphdata)[1]) {
    if(as.character(graphdata$Player[i])==as.character(graphdata$Player[j])) {
      posi<-c(posi,j)
    }
  }
}
for(i in 1:(length(posi))) {
  if(posi[i]==136|posi[i]==230) {
    print(i)
  }
}
posi2<-posi[-c(8,9,23,24)]
inposi<-posi2-1
graphdata[inposi,6:25]<-graphdata[inposi,6:25]+graphdata[posi2,6:25]
graphdata[134,6:25]<-graphdata[134,6:25]+graphdata[136,6:25]
graphdata[228,6:25]<-graphdata[228,6:25]+graphdata[232,6:25]
graphdata2<-graphdata[-unique(posi),]


library(plyr)
graphdata3<-arrange(graphdata2,graphdata2$PTS)
ST<-dim(graphdata3)[1]-9
EN<-dim(graphdata3)[1]
V<-NULL
for(i in ST:EN) {
  for(j in 1:dim(graphdata2)[1]) {
    if(as.character(graphdata3$Player[i])==as.character(graphdata2$Player[j])) {
      V<-c(V,j)
    }
  }
}
graphdata2[V,]

plot(graphdata2$MP[V],graphdata2$PTS[V],pch=c(1:10),col=2, xlim=c(-0.1,3200),ylim=c(-0.1,2400), main='Scatterplot MP-PTS',xlab='Minutes played',ylab='Points')
list<-graphdata2$Player[V]
legend("topleft", legend=list, pch=c(1:10))
points(graphdata2$MP[-V],graphdata2$PTS[-V])
abline( lm(graphdata2$PTS~graphdata2$MP,data=graphdata2) )

xlim=c(-0.1,1.2),ylim=c(-0.1,1.2)

plot(newdata3$X2P[vector4]/newdata3$X2PA[vector4],newdata3$X3P[vector4]/newdata3$X3PA[vector4],xlim=c(-0.1,1),ylim=c(-0.1,1.1),col=2, main='Scatterplot 2P-3P',xlab='Success rate 2P',ylab='Success rate 3P')
list<-newdata3$Player[vector4]
text(newdata3$X2P[vector4]/newdata3$X2PA[vector4],newdata3$X3P[vector4]/newdata3$X3PA[vector4],list,pos=3)
points(newdata3$X2P[-vector4]/newdata3$X2PA[-vector4],newdata3$X3P[-vector4]/newdata3$X3PA[-vector4])