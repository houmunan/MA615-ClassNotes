

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


#nchar, 显示character或numeric变量的长度
nchar(x)
#[1] 4
nchar("hello")
#[1] 5
nchar(3)
#[1] 1
nchar(452.22)
#[1] 6  长度包含小数点和小数点后的位数



#any 和 all的判断(vector里任何一个元素满足/全部满足)
x <- 10:1
y <- -4:5
any(x < y)
#[1] TRUE
all(x < y)
#[1] FALSE 


#nchar测量character vector里的元素长度
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby",
      "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer") 
nchar(q)
#[1]  6  8  8  7  5  8 10  6  7  6


nchar(y) #此处y是前面的，y <- -4:5(负号算一个character)
#[1] 2 2 2 2 1 1 1 1 1 1


#显示x里的元素 x是前面的，x <- 10:1
x[1]
#[1] 10
x[1:2]
#[1] 10 9
x[c(1, 4)]
#[1] 10  7 


# provide a name for each element of an array using a name-value pair，使用names
c(One = "a", Two = "y", Last = "r")
#One Two Last
#"a" "y" "r"
# create a vector
w <- 1:3
# name the elements
names(w) <- c("a", "b", "c")
w
#a b c
#1 2 3


is.vector(q)
is.factor(q)


#把这一大堆破烂变成factor vector
q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse") 
q2
#[1] "Hockey"     "Football"   "Baseball"   "Curling"    "Rugby"      "Lacrosse"   "Basketball"
#[8] "Tennis"     "Cricket"    "Soccer"     "Hockey"     "Lacrosse"   "Hockey"     "Water Polo"
#[15] "Hockey"     "Lacrosse" 

q2Factor <- as.factor(q2)
q2Factor
#[1] Hockey     Football   Baseball   Curling    Rugby      Lacrosse   Basketball Tennis    
#[9] Cricket    Soccer     Hockey     Lacrosse   Hockey     Water Polo Hockey     Lacrosse  
#11 Levels: Baseball Basketball Cricket Curling Football Hockey Lacrosse Rugby Soccer ... Water Polo
#就失去节操变成factor vector了，失去节操的标志是下面标注出了奇怪的Levels，且元素双引号没有了


#用as.numeric把q2Factor里的各种元素用下面标注出的奇怪的Levels的序号表示
as.numeric(q2Factor)
#[1]  6  5  1  4  8  7  2 10  3  9  6  7  6 11  6  7 


#用完整的factor函数制造一个带着Levels标签的factor
factor(x=c("High School", "College", "Masters", "Doctorate"), 
       levels=c("High School", "College", "Masters", "Doctorate"), 
       ordered=TRUE)
#[1] High School College     Masters     Doctorate
#Levels: High School < College < Masters < Doctorate


#找想用的function，当只记得function名字的一部分时，可以用apropos函数查询
apropos("mea")
# [1] ".colMeans"          ".rowMeans"          "colMeans"           "influence.measures"
# [5] "kmeans"             "mean"               "mean.Date"          "mean.default"      
# [9] "mean.difftime"      "mean.POSIXct"       "mean.POSIXlt"       "rowMeans"          
# [13] "weighted.mean" 


#两种主要的missing data：NA和NULL
#NA是代表missing value，是留空
#NULL是代表absense，不留空直接跳过去
######使用NULL来删除一些东西，比如variable name









##Chapter 5. Advanced Data Structures


#用data.frame构筑Data表
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", 
       "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(x, y, q)
theDF
#x  y          q
#1  10 -4     Hockey
#2   9 -3   Football
#3   8 -2   Baseball
#4   7 -1    Curling
#5   6  0      Rugby
#6   5  1   Lacrosse
#7   4  2 Basketball
#8   3  3     Tennis
#9   2  4    Cricket
#10  1  5     Soccer


#让data.frame的每一个变量被赋予名称
theDF <- data.frame(First = x, Second = y, Sport = q)
theDF
#First Second      Sport
#1     10     -4     Hockey
#2      9     -3   Football
#3      8     -2   Baseball
#4      7     -1    Curling
#5      6      0      Rugby
#6      5      1   Lacrosse
#7      4      2 Basketball
#8      3      3     Tennis
#9      2      4    Cricket
#10     1      5     Soccer

#测量这个theDF的data的行列数，用nrow，ncol，dim
nrow(theDF)
#[1] 10
ncol(theDF)
#[1] 3
dim(theDF)
#[1] 10  3 

#找这个theDF的data的变量名字
names(theDF)
#[1] "First" "Second" "Sport"
names(theDF)[3]
#[1] "Sport" 


#坐标第三行第二列
theDF[3,2]
#坐标第三行的第二到三列
theDF[3, 2:3]
#坐标第三行和第五行的第二列
theDF[c(3, 5), 2]
#坐标三行五行的第二到三列
theDF[c(3, 5), 2:3]
#缺省的地方代表全部
theDF[,3]
#找名字
theDF[, c("First", "Sport"）]


#drop = FALSE 选项在一个data.frame里，防止当此data.frame只剩一个column的时候降格成vector
theDF[, "Sport", drop = FALSE]
#Sport
#1      Hockey
#2    Football
#3    Baseball
#4     Curling
#5       Rugby
#6    Lacrosse
#7  Basketball
#8      Tennis
#9     Cricket
#10     Soccer
class(theDF[, "Sport", drop = FALSE])
#[1] "data.frame"
class(theDF[, "Sport", drop = TRUE])
#[1] "factor"










