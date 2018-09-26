Gini<-function(x) {
  s<-0
  for(i in 1:length(x)){
    for(j in 1:length(x)) {
      s=s+abs(x[i]-x[j])
    }
  }
  g=s/(2*length(x)*sum(x))
  return(g)
}