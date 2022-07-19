install.packages("foreign")
install.packages("fastDummies")
library(foreign)
library(fastDummies)

a <- read.spss("13년간참가자데이터.sav", use.value.labels = TRUE, to.data.frame = FALSE)

View(a)


a <- as.data.frame(a)

a$ID <- paste(a$h_merkey,"_",a$h_pid,"_",a$year, sep = '')


New_data <- c()

New_data$ID <- a$ID
New_data$p03_9 <- a$p03_9
New_data$p03_10 <- a$p03_10
New_data$p03_11 <- a$p03_11
New_data$p03_5 <- a$p03_5
New_data$p03_6 <- a$p03_6
New_data$p03_7 <- a$p03_7
New_data$p03_8 <- a$p03_8
New_data$h_g6 <- a$h_g6
New_data$h_reg5 <- a$h_reg5


New_data <- as.data.frame(New_data)
class(New_data)
View(New_data)

New_data <- dummy_cols(New_data, select_columns = "h_g6") ##기준변수 없어서 분석 시 1개 변수 제외하고 분서해야함
New_data <- dummy_cols(New_data, select_columns = "h_reg5") ##기준변수 없어서 분석 시 1개 변수 제외하고 분서해야함


New_data$p03_9[New_data$p03_9 == 9] <- NA
New_data$p03_9[New_data$p03_9 == 99] <- NA

New_data$p03_10[New_data$p03_10 == 9] <- NA
New_data$p03_10[New_data$p03_10 == 99] <- NA

New_data$p03_11[New_data$p03_11 == 9] <- NA
New_data$p03_11[New_data$p03_11 == 99] <- NA

New_data$p03_5[New_data$p03_5 == 9] <- NA
New_data$p03_5[New_data$p03_5 == 99] <- NA

New_data$p03_6[New_data$p03_6 == 9] <- NA
New_data$p03_6[New_data$p03_6 == 99] <- NA

New_data$p03_7[New_data$p03_7 == 9] <- NA
New_data$p03_7[New_data$p03_7 == 99] <- NA

New_data$p03_8[New_data$p03_8 == 9] <- NA
New_data$p03_8[New_data$p03_8 == 99] <- NA

#write.csv(New_data,"New_data.csv")

New_data_2 <- c()
New_data_2 <- New_data[complete.cases(New_data[,c("p03_9","p03_10","p03_11","p03_5","p03_6","p03_7","p03_8")]),]
View(New_data_2)

print(sum(is.na(New_data_2)))

str(New_data_2)


New_data_Z <- c()

New_data_Z$ID <- New_data_2$ID
New_data_Z$p03_9 <- (New_data_2$p03_9 - min(New_data_2$p03_9))/(max(New_data_2$p03_9) - min(New_data_2$p03_9))
New_data_Z$p03_10 <- (New_data_2$p03_10 - min(New_data_2$p03_10))/(max(New_data_2$p03_10) - min(New_data_2$p03_10))
New_data_Z$p03_11 <- (New_data_2$p03_11 - min(New_data_2$p03_11))/(max(New_data_2$p03_11) - min(New_data_2$p03_11))
New_data_Z$p03_5 <- (New_data_2$p03_5 - min(New_data_2$p03_5))/(max(New_data_2$p03_5) - min(New_data_2$p03_5))
New_data_Z$p03_6 <- (New_data_2$p03_6 - min(New_data_2$p03_6))/(max(New_data_2$p03_6) - min(New_data_2$p03_6))
New_data_Z$p03_7 <- (New_data_2$p03_7 - min(New_data_2$p03_7))/(max(New_data_2$p03_7) - min(New_data_2$p03_7))
New_data_Z$p03_8 <- (New_data_2$p03_8 - min(New_data_2$p03_8))/(max(New_data_2$p03_8) - min(New_data_2$p03_8))
New_data_Z$h_g6 <- (New_data_2$h_g6 - min(New_data_2$h_g6))/(max(New_data_2$h_g6) - min(New_data_2$h_g6))
New_data_Z$h_reg5 <- (New_data_2$h_reg5 - min(New_data_2$h_reg5))/(max(New_data_2$h_reg5) - min(New_data_2$h_reg5))
New_data_Z$h_g6_4 <- (New_data_2$h_g6_4 - min(New_data_2$h_g6_4))/(max(New_data_2$h_g6_4) - min(New_data_2$h_g6_4))
New_data_Z$h_g6_3 <- (New_data_2$h_g6_3 - min(New_data_2$h_g6_3))/(max(New_data_2$h_g6_3) - min(New_data_2$h_g6_3))
New_data_Z$h_g6_7 <- (New_data_2$h_g6_7 - min(New_data_2$h_g6_7))/(max(New_data_2$h_g6_7) - min(New_data_2$h_g6_7))
New_data_Z$h_g6_6 <- (New_data_2$h_g6_6 - min(New_data_2$h_g6_6))/(max(New_data_2$h_g6_6) - min(New_data_2$h_g6_6))
New_data_Z$h_g6_5 <- (New_data_2$h_g6_5 - min(New_data_2$h_g6_5))/(max(New_data_2$h_g6_5) - min(New_data_2$h_g6_5))
New_data_Z$h_g6_1 <- (New_data_2$h_g6_1 - min(New_data_2$h_g6_1))/(max(New_data_2$h_g6_1) - min(New_data_2$h_g6_1))
New_data_Z$h_g6_2 <- (New_data_2$h_g6_2 - min(New_data_2$h_g6_2))/(max(New_data_2$h_g6_2) - min(New_data_2$h_g6_2))
New_data_Z$h_g6_8 <- (New_data_2$h_g6_8 - min(New_data_2$h_g6_8))/(max(New_data_2$h_g6_8) - min(New_data_2$h_g6_8))
New_data_Z$h_g6_9 <- (New_data_2$h_g6_9 - min(New_data_2$h_g6_9))/(max(New_data_2$h_g6_9) - min(New_data_2$h_g6_9))
New_data_Z$h_reg5_1 <- (New_data_2$h_reg5_1 - min(New_data_2$h_reg5_1))/(max(New_data_2$h_reg5_1) - min(New_data_2$h_reg5_1))
New_data_Z$h_reg5_2 <- (New_data_2$h_reg5_2 - min(New_data_2$h_reg5_2))/(max(New_data_2$h_reg5_2) - min(New_data_2$h_reg5_2))
New_data_Z$h_reg5_3 <- (New_data_2$h_reg5_3 - min(New_data_2$h_reg5_3))/(max(New_data_2$h_reg5_3) - min(New_data_2$h_reg5_3))
New_data_Z$h_reg5_4 <- (New_data_2$h_reg5_4 - min(New_data_2$h_reg5_4))/(max(New_data_2$h_reg5_4) - min(New_data_2$h_reg5_4))
New_data_Z$h_reg5_5 <- (New_data_2$h_reg5_5 - min(New_data_2$h_reg5_5))/(max(New_data_2$h_reg5_5) - min(New_data_2$h_reg5_5))


New_data_Z <- as.data.frame(New_data_Z)
View(New_data_Z)

rownames(New_data_Z) = New_data_Z$ID

New_data_Z <- New_data_Z[,-c(1)]

write.csv(New_data_Z,"New_data.csv")


New_13_year <- read.csv("13년연속참여자.csv", header=T)
New_13_year_N <- NULL
New_13_year_N <- New_13_year[,c(1,4:26)]
rownames(New_13_year_N) = New_13_year$ID
View(New_13_year_N)

print(sum(is.na(New_13_year_N)))

install.packages("NbClust")
library(NbClust)

New_13_year_N <- New_13_year_N[,-c(9,10,16,20)]
New_13_year_clust <- New_13_year_N[,-c(1)]

#nc <- NbClust(New_13_year_N, min.nc=3, max.nc=5, method="kmeans")
#par(mfrow=c(1,1))
#barplot(table(nc$Best.n[1,]),
        xlab="Numer of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen")

library(cluster)

New_13_year_dist <- dist(New_13_year_clust, method = "euclidean") #데이터 간 거리 산출방법 : euclidean method

write.csv(New_13_year_clust,"New_13_year_clust.csv")
