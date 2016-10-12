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

