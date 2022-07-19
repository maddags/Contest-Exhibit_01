library(readxl)
library(xlsx)
library(foreign)
library(fastDummies)

abs <- read_excel("~/동아리/공모전/시각화/excel/New_dummy_군집/cluster_analistic/12/데이터최종본inSPSS.xlsx")

#13년간 변화한 군집 추이 데이터
abs_13 <-matrix(abs$QCL_1,ncol = 13, nrow = 5737, byrow = T)
abs_13 <- as.data.frame(abs_13)
colnames(abs_13) <- c(2005:2017)
b <- c(0:5736)

code <- abs[13*b+1,2]

abs_13 <- cbind(code,abs_13)

write.csv(abs_13,"13년간 변화추이 데이터.csv")

#####################

