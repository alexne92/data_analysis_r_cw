pg<-NULL
pf<-NULL
for(i in 1:dim(nbadata)[1]) {
  if(nbadata$Pos[i]==levels(nbadata$Pos)[3]) {pg<-c(pg,nbadata$PTS[i])}
}
for(j in 1:dim(nbadata)[1]) {
  if(nbadata$Pos[j]==levels(nbadata$Pos)[2]) {pf<-c(pg,nbadata$PTS[j])}
}
shapiro.test(pg)
shapiro.test(pf)