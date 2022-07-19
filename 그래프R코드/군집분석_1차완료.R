#엑셀로 군집분석 돌린 것
library(xlsx)
library(readxl)
install.packages("dplyr")
library(dplyr)
excel_data <- read_excel("~/동아리/공모전/시각화/R코드/1stmatrix_ID_NUM.xlsx",
                         sheet = 4)

excel_data <- excel_data[,1:2]

cluster_data <- bind_cols(excel_data,row_name_id)

