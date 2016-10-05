#Class 9.12.2016 MON

a <- 2
b <- 50
c <- 3
a+b
b/a
50%%3 #余
a_vec <- c(3, 50, 5, 6, 10, 50, 20, 2, 100, 30, 25, 80)
str(a_vec) #structure command, show structure
sum(a_vec) #和
summary(a_vec)
length(a_vec)
boxplot(a_vec)
cumsum(a_vec) #cumulative sum
is.vector(a_vec) #
data()

#rundom numbers 生成随机数
runif(20) #括号里点“Tab”显示下拉菜单
options(digits = 2)
nums <- runif(20)
nums

plot(nums)
hist(nums)

set.seed(5)
runif(30)

head(nums) #显示前五个
tail(nums) #显示后五个


#生成矩阵MATRIX

A <- matrix(data = floor(30*runif(16)),nrow = 4, byrow = TRUE)
View(A) #View大写开头

#byrow的意思是什么：
values <- 30*runif(16)
values

#floor的意思是，

A
A[3,3]

dim(A) #显示Dimension

d <- dim(A)
d[1]

b <- floor(20*runif(dim(A)[2]))

x <- solve(A,b)

A%*%x #矩阵相乘


e <- floor(20*runif(4))
f <- floor(20*runif(4))
e*f
sum(e*f)

t(e)%*%f #transport of e


e
f
outer(e,f,"*")
outer(e,f,">")
outer(e,f,">")*1



#Class 9.14.2016 Wed

#TURN IN HOMEWORK: Click"File - Compile Notebook"


a <- runif(9)
a
str(a) #structure command, show structure,显示大体结构等资料
length(a)
typeof(a)

#判断类型

is.atomic(a)
is.list(a)
is.vector(a)

a[5]
a[5] <- NA #删除a中第五个;you can decide how to modify the data

typeof(a[5])

c <- as.integer(50*a)
c
is.atomic(c)
is.list(c)
c[5]
is.na(c)
is.na(c)*1
typeof(c[5])
class(a)

d <- c(c(1,2,3),c(4,5,6))
d

#example:mtcars
dat1 <- mtcars
str(dat1)



mtcars[,1]
typeof(mtcars[,1])
model1 <- lm(mtcars$mpg~mtcars$hp,data = mtcars)
model1 <- lm(mtcars$mpg~mtcars$hp)







#Class 9.16.2016 FRI


#Exercise 1 Question 2

par(new=TRUE)
x <- seq(3,6,by=0.1)
prod <- exp(x)*cos(x)
plot(prod, col="blue", type="l")
points(cos(x),col="red")
#par(new=TRUE)
#y <- exp(x)
points(exp(x),col="green")



#Exercise 1 Question 6

set.seed(50)


xVec <- sample(0:999, size=250, replace=TRUE)
yVec <- sample(0:999, size=250, replace=TRUE)

#hehe
a <- c(10:20)
a[-3]#dropped the 3rd element of the vector
#hehe over

yVec <- yVec[-1]#delete the first element
xVec <- xVec[-length(xVec)]#dropping the last one, can also use"-250" instead of "-length"
dVec <- yVec - xVec


#Ex 1 Q 7

#a

set.seed(50)

yVec <- sample(0:999, size=250, replace=TRUE)
plot(yVec, col="red")

bVec <- yVec[yVec>600]
points(bVec, col="green")


#another way

cVec <- (yVec>600)*1
head(cVec, 20)
length(cVec)
points(yVec*cVec, col="blue")



#Ex 2 Q 4

outer(0:4,0:4,"+") #if no "+" then default is multiplication

A <- matrix(0, nrow=6, ncol=6, byrow=TRUE)
row(A)
col(A)

#abs(col(A)-row(A))==1
(abs(col(A)-row(A))==1)*1

#try not using any FOR loops cause toooooo slow













#Class 9.19.2016 MON

dir() #List the files under your repository directory location?? wtf

#> dir()
#[1] "1.Rmd"                 "Assignment 2.Rmd"      "Assignment_2.html"     "Class 2 outline.Rmd"  
#[5] "class 9.12.2016.R"     "class 9.12.2016.Rproj" "class 9.16.2016.R"     "draft.html"           
#[9] "draft.R"

data <- read.csv("blue2.csv", header = TRUE, stringsAsFactors = FALSE)

datacars <- mtcars

#clean up data 接下来











#Class 9.21.2016 WED

#sapply(some matrix) merge each row into one row
sb <- matrix(c(1,2,3,4,2,3,4,5,3,4,5,6,4,5,6,7), nrow = 4, byrow = TRUE)
sb
sapply(sb,FUN = "+")
sapply(sb,FUN = "-")

apply(sb,1,"sum") #summary by each row
apply(sb,2,"sum") #summary by each column
?apply
??apply

#class note
#data from usda website https://quickstats.nass.usda.gov/

dir()
data <- read.csv(file = "B1952F63-B856-3C48-BF5E-7F3ADF2E795D.csv")

agdata <- data
length(agdata$County[agdata$County==NA])

data <- read.csv(file = "B1952F63-B856-3C48-BF5E-7F3ADF2E795D.csv", stringsAsFactors = )


#use of "APPLY"
m <- matrix(c(1:10,11:20), nrow=10, ncol=2)
m

apply(m,1,mean) #m is data, 1 is dimension, i.e. row, mean is the function

??magrittr

library(magrittr)

m %>% apply(1, mean)
m %>% apply(1, mean) %>% sum()

m %>% apply(2, mean)


#alt-shift-k  so cntrl-shift-m


#how about lists? lappaly -- but BEWARE it returns lists

myList <- list(A = matrix(1:12,4), b = c(20,3,7), C = matrix(7,5,10))
myList

b <- myList %>% lapply(sum)
b
?lapply












#Class 9.23.2016 FRI


sum <- 0
c <- c(2,3,pi,4)
for (i in 1:24) {
  for (j in 1:4) {
    sum <- sum + (cos(i * pi * c[j]))
  }
}
sum

i <- 1:24
j <- c(2,3,pi,4)
c <- outer(1:24, c(2, 3, pi, 4), "*")
m <- cos(c*pi)
sum(m)








#Class 10.3.2016 MON class note

#ggplot2, writing functions
#ggplot2 <- <- <- <- <- <- <- <- <- 
#Wed assignments


#functions

func.name <- function(inputs){
  #-your staff goes here-
  return()
}

#example

hi <- function(){
  "hello there"
}

hii <- function(n){
  a = rep(x = "hello",n)
  print(a)
  b = runif(n)
  return(b)
}

hii(20)

#ggplot2
#this package simply start of saying 
install.packages("munsell")
install.packages("labeling")
library(ggplot2)
library(labeling)


ggplot(Orange, aes(x=circumference, y=age)) + geom_point() + geom_smooth(method = lm)

model <- lm(formula = )


p1 <- ggplot(model, aes(.fitted, .resid))+geom_point()
p1 <- p1+stat_smooth(method="loess")+geom_hline(yintercept = 0, col="red", linetype="dashed")










#Class 13 10.5.2016 WED class note

#############
#summ 1(a).R#
#############

summ = function(x){
  # Note that I have added a message to stop().  I haven't been able to reproduce
  # the message was saw in class.
  if(is.numeric(x)==F)stop("Invalid input. summ() only takes numeric vectors.")
  return(list(mean(x),median(x),var(x)))
}


## test with z and z1.  z produces values and z1 stops the program.

z <- c(1,2,3,4,5,6,7,8,9)

z1 <- "how about a mean?"


#############
#rand 1(d).R#
#############

library(ggplot2)


# random walk function
rands <- function(k){
  # check to make sure input is an integer.
  k1 = as.integer(k)
  if(k1 != k)stop('rands() requires an integer value to start.')
  
  # initialize i and x
  i=1
  x=0
  while(x[i] != k){
    if(runif(1)<.5)D = 1
    else D = -1
    i = i+1
    x[i] = x[i-1]+ D
    
  }
  return(data.frame(x))
}

## try it with 11
set.seed(10)
ser <- data.frame(rands(11))
t <- 1:length(ser$x)
qplot(t,x, data=ser, geom="line") #qplot: quick plot, simple version of qqplot


## try it with "hello"

ser <-data.frame("hello")

## try it with 3.4

ser <- data.frame(3.4)



rands(ser)



#########
# ma3.R #
#########


set.seed(10)

rand <- rnorm(20)


ma3 <- function(x)
{
  #check for size and type
  r=length(x) 
  x=c(x,0,0,0,x,0,0,0,x)
  x=matrix(x, ncol = r+2, nrow = 3, byrow = TRUE)
  
  return(as.vector(colMeans(x)))
  
}

mov <- ma3(rand)
# acf(rand)   auto correlation function
# pacf(mov)   partial acf
# pacf(rand)
# acf(mov)



##################
#exp-poi-gam(1).R#
##################


library(ggplot2)
library(qualityTools)


# create a vector of w exponential waiting times with lambda = lam

wait <- function(w,lam){
  a = NULL
  for(i in 1:w){
    a = c(a,rexp(1,rate = lam))
  }
  return(a)
}




# create a vector of exponential waiting times which total t <= Max with lambda = lam

wait.until <- function(Max,lam){
  # set.seed(50)
  time = 0
  a = NULL
  while(time < Max){
    inter = rexp(1,lam)
    a = c(a,inter)
    time = time + inter
  }
  return(a[1:(length(a)-1)])  ##test w seed ## haha use ()
}


# now simulate the number of events to show that the number of events divided by
# exponential waiting times are Poisson distributed
# (don't forget to comment out the "set.seed")

poi.test <- function(rep, Max, lam){
  a = NULL
  for(i in 1:rep){
    q = wait.until(Max,lam)
    a = c(a,length(q))
  }
  return(a)
}


# now simlate the waiting time for k events to occur with lambda = lam

wait.for <- function(k, lam){
  time = 0
  count = 0
  a = NULL
  while(count < k){
    inter=rexp(1,lam)
    count = count + 1
    time = time+inter
  }
  
  return(time)
} 



gam.test <-function(rep, max.e, lam ){
  a=NULL
  for (i in 1:rep){
    t = wait.for(max.e,lam)
    a = c(a,t)
    
  }
  
  return(a)
}





















