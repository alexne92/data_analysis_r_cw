c<-0
for(i in 1:dim(nbadata)[1]) {
  if((nbadata[i,25])>1000) {
    c<-c+1
  }
}
print(c)