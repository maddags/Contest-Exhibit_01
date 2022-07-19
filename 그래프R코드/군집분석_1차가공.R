#install.packages("foreign")
library(foreign)
spss_2nd <- read.spss("변수_결측값처리.sav", use.value.labels = TRUE, to.data.frame = FALSE)
View(spss_2nd)

spss_2nd <- as.data.frame(spss_2nd)

spss_2nd$ID <- paste(spss_2nd$h_merkey,"_",spss_2nd$year, sep = '')

new_data <- spss_2nd[,c(83,12,14,17,56,6:8,81,4)]
new_data

#install.packages("fastDummies")
library(fastDummies)
new_data <- dummy_cols(new_data,select_columns = "h_g6")
new_data <- dummy_cols(new_data,select_columns = "h_reg5")
new_data

new_data$p03_5[new_data$p03_5 == 9] <- NA
new_data$p03_5[new_data$p03_5 == 99] <- NA

new_data$p03_6[new_data$p03_6 == 9] <- NA
new_data$p03_6[new_data$p03_6 == 99] <- NA

new_data$p03_7[new_data$p03_7 == 9] <- NA
new_data$p03_7[new_data$p03_7 == 99] <- NA

new_data$p03_8[new_data$p03_8 == 9] <- NA
new_data$p03_8[new_data$p03_8 == 99] <- NA

new_data$p03_9[new_data$p03_9 == 9] <- NA
new_data$p03_9[new_data$p03_9 == 99] <- NA

new_data$p03_10[new_data$p03_10 == 9] <- NA
new_data$p03_10[new_data$p03_10 == 99] <- NA

new_data$p03_11[new_data$p03_11 == 9] <- NA
new_data$p03_11[new_data$p03_11 == 99] <- NA

#write.csv(new_data,"new_data.csv")
