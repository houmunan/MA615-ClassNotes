w <- seq(0,max(re)*1.01,by=.01)
Femp <- numeric(length(w))
Qs <- re[order(re)]
for (i in 1:length(w)){
  Femp[i] <- sum(Qs<=w[i])/length(Qs)
  }
plot(Femp,1-exp(-w),type = "l",lwd=2)
abline(0,1,col="red")
abline(1.36/sqrt(nrow(M2)),1,lty=2,col="red")
abline(-1.36/sqrt(nrow(M2)),1,lty=2,col="red")

?ks
?ggplot



qgamma(c(0.025,0.975), length(sb$counts)/2, scale = 2/length(sb$counts))