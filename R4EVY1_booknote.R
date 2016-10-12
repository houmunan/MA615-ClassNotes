

##Chapter 4. Basics of R


#同时向多个Value赋值
a <- b <- 7
a
#[1] 7
b
#[1] 7


#assigh()也是赋值，基本相当 <- 
assign("j", 4)
j
#[1] 4


#查询variable里data的种类type：
class(x)
#[1] "numeric"
is.numeric(x)
#[1] TRUE 


#给variable赋值一个integer：
#如果不加L，则默认不是integer(但始终是numeric)
#numeric数值，包含子集integer整数
i <- 5
i
#[1] 5
is.integer(i)
#[1] FALSE
is.numeric(i)
#[1] TRUE

#后面加上L，则是integer
j <- 5L
j
#[1] 5
is.integer(j)
#[1] TRUE
is.numeric(j)
#[1] TRUE


#字符类型数据Character data
x <- "data" 
x
#[1] "data"  注意结果带“双引号”

y <- factor("data")
y
#[1] data
#Levels: data  结果不带“双引号”


#显示character或numeric变量的长度
nchar(x)
#[1] 4
nchar("hello")
#[1] 5
nchar(3)
#[1] 1
nchar(452.22)
#[1] 6  长度包含小数点和小数点后的位数
nchar(y)
#Will not work with "factor"











