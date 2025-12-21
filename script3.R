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
