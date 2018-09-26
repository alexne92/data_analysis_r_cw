a1=levels(nbadata$Tm)
b2=n
Datan=data.frame(a1,b2)
barplot(Datan$b2,names.arg = Datan$a1,cex.names=0.5,las=2)