library(xlsx)
library(ggplot2)


index <- read.xlsx("./술,담배_전국_연별(1975~2018).xlsx", 1, colIndex = 1:6 , rowIndex = 1 : 45, header = T )
index

