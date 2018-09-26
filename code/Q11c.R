newdata<-nbadata
pos<-NULL
for(i in 1:(dim(newdata)[1]-1)){
  for(j in (i+1):dim(newdata)[1]) {
    if(as.character(newdata$Player[i])==as.character(newdata$Player[j])) {
      pos<-c(pos,j)
    }
  }
}
for(i in 1:(length(pos))) {
  if(pos[i]==136|pos[i]==230) {
    print(i)
  }
}
pos2<-pos[-c(8,9,23,24)]
inpos<-pos2-1
newdata[inpos,6:25]<-newdata[inpos,6:25]+newdata[pos2,6:25]
newdata[134,6:25]<-newdata[134,6:25]+newdata[136,6:25]
newdata[228,6:25]<-newdata[228,6:25]+newdata[232,6:25]
newdata2<-newdata[-unique(pos),]
vector1<-NULL
vector2<-NULL
for(i in 1:dim(newdata2)[1]) {
  if(newdata2$MP[i]/newdata2$G[i]<5) {vector1<-c(vector1,i)}
}
for(j in 1:dim(newdata2)[1]) {
  if(newdata2$X3PA[j]>=20) {vector2<-c(vector2,j)}
}
newdata3<-newdata2[-c(vector1,vector2),]
vector3<-newdata3$X3P/newdata3$X3PA
vector3[is.nan(vector3)]<-0
newdata4<-cbind(newdata3,vector3)
library(plyr)
newdata5<-arrange(newdata4,vector3)
st<-dim(newdata5)[1]-9
en<-dim(newdata5)[1]
vector4<-NULL
for(i in st:en) {
  for(j in 1:dim(newdata3)[1]) {
    if(as.character(newdata5$Player[i])==as.character(newdata3$Player[j])) {
      vector4<-c(vector4,j)
    }
  }
}
newdata3[vector4,]

plot(newdata3$X2P[vector4]/newdata3$X2PA[vector4],newdata3$X3P[vector4]/newdata3$X3PA[vector4],pch=c(1:10),xlim=c(-0.1,1.2),ylim=c(-0.1,1.2),col=2, main='Scatterplot 2P-3P',xlab='Success rate 2P',ylab='Success rate 3P')
list<-newdata3$Player[vector4]
legend("topright", legend=list, pch=c(1:10))
points(newdata3$X2P[-vector4]/newdata3$X2PA[-vector4],newdata3$X3P[-vector4]/newdata3$X3PA[-vector4])

plot(newdata3$X2P[vector4]/newdata3$X2PA[vector4],newdata3$X3P[vector4]/newdata3$X3PA[vector4],xlim=c(-0.1,1),ylim=c(-0.1,1.1),col=2, main='Scatterplot 2P-3P',xlab='Success rate 2P',ylab='Success rate 3P')
list<-newdata3$Player[vector4]
text(newdata3$X2P[vector4]/newdata3$X2PA[vector4],newdata3$X3P[vector4]/newdata3$X3PA[vector4],list,pos=3)
points(newdata3$X2P[-vector4]/newdata3$X2PA[-vector4],newdata3$X3P[-vector4]/newdata3$X3PA[-vector4])