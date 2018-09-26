p1<-nbadata$X2P/nbadata$X2PA
p2<-nbadata$X3P/nbadata$X3PA
lm( p2~p1, data= nbadata)

plot(p2~p1,data=nbadata, xlab= "2P Success rate", ylab = "3P Success rate")


model1<-lm( p2~p1, data= nbadata)

par(mfrow=c(2,2))
plot(model1)

res_ex<-lm( p2~p1, data= nbadata)