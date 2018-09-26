par(mfrow=c(1,2))
x17<-rstudent(model1)
mt <- 'Residuals'
hist(x17, probability=T, main=mt)
x0<-seq( min(x17), max(x17), length.out=100)
y0<-dnorm( x0, mean(x17), sd(x17) )
lines(x0,y0, col=2, lty=2)
qqnorm(x17, main=mt)
qqline(x17)

shapiro.test(rstudent(model1))

library(lmtest)
dwtest(model1)