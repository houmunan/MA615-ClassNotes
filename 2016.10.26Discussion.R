

                    GO TO BLACKBOARD -> CONTENT AND FIND THIS !!!




library(ggvis)
library(ggplot2)

# 1
set.seed(200)
##### Normal Distribution
# rnorm: generate random numbers from normal distribution
ns <- rnorm(n=100, mean=1, sd=3)
# dnorm: probability density function
dnorm(x=0, mean = 0, sd = 3) 
dnorm(x=0, mean = 0, sd = 3, log=TRUE) 
# pnorm: cumulative distribution function, providing cumulative probability
pnorm(q=1.96, mean=0, sd=1) 
pnorm(q=1.96, mean=0, sd=1, lower.tail=FALSE)
pnorm(q=1.96, mean=0, sd=1, log.p=TRUE)
log(pnorm(q=1.96, mean=0,sd=1))
# qnorm: inverse of pnorm, get quantile given cumulative probability
qnorm(x=0.975, mean=1, sd=1)

# 2
xvec = seq(-10,10,0.01) 
dens <- dnorm(xvec, mean=0, sd=3)
cumu <- pnorm(xvec, mean=0, sd=3)
rand <- rnorm(2001, mean=0, sd=3)
hist(rand)
hist(rand,probability = TRUE)

#par(mfrow=c(2,2), mar=c(4,4,4,2))
hist(rand, main="Random draws from Std Normal",
     cex.axis =.8, # fontsize on axis
     cex.lab = 1, # fontsize of x and y label
     cex.main=1.5,# fontsize of title
     xlim=c(-8,8))

plot(xvec, cumu, col="darkorange", xlab="", ylab="Cumulative Probability",
     type="l",lwd=2, cex=2, main="CDF of Standard Normal", cex.axis=.8)
lines(xvec, dens, col="darkgreen",xlab="", ylab="Density", 
     type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)

# plot density with quantile
plot(xvec, dens, col="darkgreen",xlab="", ylab="Density", 
     type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
abline(v=qnorm(0.95,mean=0,sd=3))
abline(v=qnorm(0.85,mean=0,sd=3))
abline(v=qnorm(0.5,mean=0,sd=3))

# plot density with 3 sigma
plot(xvec, dens, col="darkgreen",xlab="", ylab="Density", 
     type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
abline(v=0+3)
abline(v=0+2*3)
abline(v=0+3*3)

# plot cumulative probability with quantile
plot(xvec, cumu, col="darkgreen",xlab="", ylab="Density", 
     type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
abline(v=qnorm(0.95,mean=0,sd=3))
abline(v=qnorm(0.85,mean=0,sd=3))
abline(v=qnorm(0.5,mean=0,sd=3))

# plot cumulative probability with 3 sigma
plot(xvec, cumu, col="darkgreen",xlab="", ylab="Density", 
     type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
abline(v=0+sqrt(3))
abline(v=0+2*sqrt(3))
abline(v=0+3*sqrt(3))

# 3
# normal distribution interactive
library(shiny)
ui <- fluidPage(
  numericInput(inputId = "n",
               "Sample size", value=25),
  numericInput(inputId = "mean",
               "Sample size", value=1),
  numericInput(inputId = "sd",
               "Sample size", value=1),
  plotOutput(outputId="hist")
)
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$n,input$mean,input$sd),breaks=25)
  })
}
shinyApp(ui = ui, server = server)

# poisson distribution interactive
ui2 <- fluidPage(
  numericInput(inputId = "xtop",
               "Sample size", value=25),
  sliderInput(inputId = 'lambda', label="Lambda", min=1, max=200, value=3, step=0.1),
  plotOutput(outputId="dens")
)
server2 <- function(input, output) {
  output$dens <- renderPlot({
    plot(c(1:input$xtop),dpois(c(1:input$xtop),input$lambda),type="l",lwd=2,col="orange")
  })
}
shinyApp(ui = ui2, server = server2)

# 4
##### T Distribution
plot(xvec,dt(xvec,df=10),type="l",lwd=2,col="orange")
plot(xvec,pt(xvec,df=10),type="l",lwd=2,col="orange")
lines(xvec,dt(xvec,df=10),type="l",lwd=2,col="green")

# 5
# t distribution, standard normal
xvec2 = seq(-3,3,0.1)
plot(xvec2,dnorm(xvec2,0,1),type="l",lwd=2,col="orange")
lines(xvec2,dt(xvec2,df=1),type="l",lwd=2,col="yellow")
lines(xvec2,dt(xvec2,df=2),type="l",lwd=2,col="yellow")
lines(xvec2,dt(xvec2,df=10),type="l",lwd=2,col="orange")
lines(xvec2,dt(xvec2,df=15),type="l",lwd=2,col="red")
lines(xvec2,dt(xvec2,df=30),type="l",lwd=2,col="brown")
lines(xvec2,dt(xvec2,df=50),type="l",lwd=2,col="purple")
lines(xvec2,dt(xvec2,df=1000),type="l",lwd=2,col="green")
lines(xvec2,dnorm(xvec2,0,3))

# standard normal -> chi.sq
data1 <- rnorm(1000)^2 + rnorm(1000^2)^2
data2 <- rchisq(1000, 2)
ks.test(data1,data2)
hist(data1,probability = TRUE)
lines(seq(0,15,.1),dchisq(seq(0,15,.1),2),lwd=2)

# 6
# 
xseq<-seq(-4,4,.01)
y<-2*xseq + rnorm(length(xseq),0,3)
hist(y, prob=TRUE, ylim=c(0,.08), breaks=20)
curve(dnorm(x, mean(y), sd(y)), add=TRUE, col="darkblue", lwd=2)
qqnorm(y)
mean(y)
ks.test(rnorm(1000,mean(y),sd(y)),y)

# 
y2 <- 2*xseq + rt(length(xseq),4)
hist(y2,prob=TRUE,ylim=c(0,.08),breaks=25)
curve(dnorm(x, mean(y2), sd(y2)), add=TRUE, lwd=2)
qqnorm(y2)

#
# Bootstrap estimates of confidence interval
set.seed(10)
m = rnorm(200,0,3)
w = rnorm(200,3,3)
mean(m)-mean(w)

# bootstrap the difference in means
len1 <- length(m)
len2 <- length(w)
B <- 1000
th.hat <- mean(m) - mean(w)
Tboot <- c(1:1000)
for(i in 1:B){
  xx1 <- sample(m, size=len1, replace=TRUE)
  xx2 <- sample(w, size=len2, replace=TRUE)
  Tboot[i] <- mean(xx1) - mean(xx2)
}
se <- sqrt(var(Tboot))

# get three different bootstrap confidence interval
# normal
ci.nm <- c(th.hat - 2*se, th.hat + 2*se)
ci.nm
# pivotal
ci.pvt <- c(2*th.hat-quantile(Tboot,.975), 2*th.hat-quantile(Tboot,.025))
ci.pvt
# percentile
ci.pct <- c(quantile(Tboot,.025), quantile(Tboot,.975))
ci.pct











