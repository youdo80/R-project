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


# 파생변수 생성하기

df_new$v3_sum <- df_new$v1 + df_new$v2
df_new





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

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total)

?mpg


summary(mpg$total)
hist(mpg$total)


#합격판정 변수 만들기
ifelse(mpg$total >= 20, "pass","fail")
dim(mpg)
table(mpg$test)
qplot(mpg$test) #값의개수를 막대의 길이로 표현



mpg$grade <- ifelse(mpg$total >=30,"A",
                    ifelse(mpg$total >=20,"B","c"))
head(mpg)
table(mpg$grade)
qplot(mpg$grade)






# ----------------



#########################################
#########################################
#########################################
#########################################
#########################################
#########################################


# 데이터 전처리

#########################################
#########################################
#########################################

install.packages("dplyr")
??dplyr

df_iris <- readRDS("iris.rds")
df_iris
head(df_iris)


library(dplyr)
df_iris %>% filter(Sepal.Length == 6.0)

# 두 단계로 조건을 순차적으로 적용합니다.
# 연속 필터링은 조건이 많거나 중간 결과를 확인하고 싶을 때 유용
# 성능차이가 있음음
df_iris %>% filter(Species == "versicolor") %>% filter(Sepal.Length == 5.0) %>% glimpse()

#논리 연산자 &를 사용해 두 조건을 동시에 적용.
df_iris %>% filter(Species =="versicolor" & Sepal.Length ==5.0)
df_iris %>% filter(Species =='versicolor' | Sepal.Length == 5.0) %>% dim()

# %in% 매칭연산자자
df_iris %>% filter(Sepal.Length %in% c(5.0, 6.0))


iris_length1 <- df_iris %>% filter(Species =='setosa')
iris_length2 <- df_iris %>% filter(Species == 'virginica')

mean(iris_length1$Sepal.Length)
mean(iris_length2$Sepal.Length)


# 산술연산자
#몫
4%/%2
#나머지
5%%2
5^2
5**2
5**3

# --------------------------
# 6-2 필요한 변수만 추출하기
# --------------------------

library(dplyr)
df_iris
head(df_iris)
df_iris %>% select(Species)
df_iris %>% select(Sepal.Length,Species)
df_iris %>% select(-Species)


df_iris %>% filter(Sepal.Length>6.5) %>% select(Species)


df_iris %>%
  filter(Sepal.Width>4.0) %>%
  select(Species)


df_iris %>%
  filter(Sepal.Width>4.0) %>%
  select(Species)


df_iris %>% filter(Sepal.Length>6.5) %>% select(Species) %>% head(10)


# ------------------------
# 6-4 순서대로 정렬하기
# -----------------------

df_iris %>% 
  arrange(Sepal.Length) %>% #오름차순정량
  head(10)

df_iris %>%
  arrange(desc(Sepal.Length)) %>%
  head(10)


df_iris %>%
  arrange(Sepal.Length,Sepal.Width) %>%
  head(10)


# ------------------------
# 6-5 파생변수 추가하기
# -----------------------

df_iris %>%
  mutate(Sepal.total = Sepal.Length * Sepal.Width) %>%
  head

# 벡터(또는 변수)의 값 빈도수를 집계해서 도수분포표를 만듭니다.
# 데이터프레임에 변수를 추가하지 않음
# mpg$test <- ifelse(mpg$total >= 20, "pass", "fail") table(mpg$test)


head(df_iris,10)


# 실제 변수에 넣어준것임임
df_iris <- mutate(df_iris, test = ifelse(Sepal.Length >5.1,"pass","fail"))
head(df_iris)
df_iris <- mutate(df_iris, Sepal.total = Sepal.Length * Sepal.Width)



# ---------------------
# 6-2 집단별로 요약하기
# ----------------------

df_iris
dim(df_iris)


library(dplyr)
df_iris %>% summarise(mean_math=mean(Sepal.Length))


df_iris %>% 
  group_by(Species) %>%
  summarise(mean_math = mean(Sepal.Length))



df_iris %>%
  group_by(Species) %>%
  summarise(mean_math = mean(Sepal.Length),
            sum_math = sum(Sepal.total),
            n = n())
#n() 행수 빈도수 구하기



df_iris %>%
  group_by(Species,test) %>%
  summarize(mean_sepal_length = mean(Sepal.Length))

