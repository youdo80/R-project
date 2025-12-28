# 라이브러리 불러오기
# package 설치 : install.packages()
library(ggplot2)

x <- c ('a','a','a','a','b','c')
x
# 빈도막대 그래프
qplot(x)


## 예시데이터 : 미국 환경 보호국 공개자료 - 자동차 연비 자료
qplot(data = mpg, x =hwy)

qplot(data=mpg, x =cty)

qplot(data=mpg, x =drv, y=hwy)

qplot(data=mpg, x = drv, y = hwy, geom = 'line')

qplot(data=mpg, x = drv, y =hwy, geom = "boxplot")

qplot(data=mpg, x =drv, y= hwy, geom ='boxplot', color=drv)

###함수메뉴얼 출력력
?qplot

mpg
#데이터 분석의 가치는 어떤 현상이 조건에 따라 달라진다.라는점이다.
# 특정날씨에 어떤 음식이 더 많이 팔린다. 같은것이다.


# =============================
# 데이터 프레임
# =============================
english <- c(90,80,60,70)
math <- c(50,60,100,20)
df_midterm <-data.frame(english,math)

df_midterm
mean(df_midterm$english)

df_midterm2 <-data.frame(english = c(1,2,4,5),
                         math = c(44,44,2,2))
df_midterm2


# =============================
# 엑셀파일 불러오기
# =============================

install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx")
df_exam
mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

df_exam2 <- read_excel("excel_exam.xlsx", col_names=F)
df_exam2


df_exam3 <- read_excel("excel_exam.xlsx", sheet=2)
df_exam3
## csv의 경우 다름 
## read.csv("file_name.csv")
## read.csv("file_name.csv", header=F)

# ============================
# data frame to csv
# ============================

df_midterm_csv <- data.frame(english =c(1,2,4,5), math = c(3,4,5,5))
df_midterm_csv
write.csv(df_midterm_csv, file="df_midterm_csv.csv")


# ================================
# RDS : r사용하는 데이터 저장포멧
# r전용파일 데이터로 속도가 빠르고 용량이 작음
# 일반 메모장에서는 내용이 안보임
# ================================
saveRDS(df_midterm2, file="df_midterm2.rds")
rm(df_midterm2)
df_midterm2
df_midterm2 <-readRDS("df_midterm2.rds")
df_midterm2


# =======================================
# 데이터 파악하기
# =======================================
df_iris <- readRDS("iris.rds")
head(df_iris)
head(df_iris,10)
tail(df_iris)

## 엑셀과 같이 뷰어 창이 나와서 데이터 확인가능, 첫 V 대문자
View(df_iris)

dim(df_iris) #행, 열 출력

str(df_iris) #데이터 속성파악

summary(df_iris)

library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)

?mpg


# ----------------------
# 변수명 바꾸기
# ----------------------

df_raw <-data.frame(var1 = c(1,2,4), var2 = c(2,4,2))
df_raw

# 패키지 설치
install.packages("dplyr")
library(dplyr)
df_new <-df_raw        
df_new
df_new <-rename(df_new, v2  = var2) #새변수명 = 기존변수명
df_new
df_new <- rename(df_new, v1 = var1)
df_new
