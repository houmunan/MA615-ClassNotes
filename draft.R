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
