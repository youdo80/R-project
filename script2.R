val1 <- seq(1,700,by =2)
val1
# combine
val2 <- c(1,2,3,4)
val2
val2 <- c(1:6)
val2

# sequence
val2 <- seq(1,6)
val2
val2 <- seq(1,100, by = 2)
val2
val2 +2

# 변수설정
var1 <- seq(1,4)
var1
var2 <- seq(2,5)
var2
var1 + var2

# 문자변수
str1 <- "a"
str1

str2 <- c('a', 'b', 'c')
str2

# 평균구하기
var1
mean(var1)
max(var1)
min(var1)


# 문자다루는 함수 사용하기
str3 <- c("hello","world","is","good")
paste(str3, collapse = ",")
paste(str3, collapse =" ")


## 패키지 설치하기
install.packages("ggplot2")


.libPaths()
