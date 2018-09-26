h<-NULL
j<-NULL
int<-NULL
for(i in 1:dim(nbadata)[1]) {
    if(as.character(nbadata[i,3])==levels(nbadata$Pos)[3]) {
      h<-c(h,nbadata[i,19]) 
      int<-c(int,i)
      j<-c(j,as.character(nbadata[i,2]))}
}
k<-matrix(h,1)
colnames(k)<-as.character(j)
colnames(k)[order(k,decreasing=TRUE)][1:5]
k[order(k,decreasing=TRUE)][1:5]
l<-matrix(h,1)
colnames(l)<-int
ve<-as.numeric(colnames(l)[order(l,decreasing=TRUE)][1:5])
for(i in 1:length(ve)) {
  print(nbadata[ve[i],])
}