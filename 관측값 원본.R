library(foreign)
library(fastDummies)

a <- read.spss("koweps_hp01_13_long_beta1.sav", use.value.labels = TRUE, to.data.frame = FALSE)

head(a,10)
class(a$wv_num)
class(a)
a <- as.data.frame(a)
a13 <- a[a$wv_num == 13,]
a13N <- c()

a13N$h_merkey <- a13$h_merkey
a13N$h_pid <- a13$h_pid
a13N$year <- a13$year
a13N$p05_3aq3 <- a13$p05_3aq3 # 총흡연기간(년)
a13N$p05_3aq4 <- a13$p05_3aq4 # 총흡연기간(개월)
a13N$p05_3aq1 <- a13$p05_3aq1 # 총흡연량

a13N$p05_2 <- a13$p05_2 #1년간 평균 음주량
a13N$p05_3 <- a13$p05_3 #음주시 마시는 술잔 횟수
a13N$p05_4 <- a13$p05_4 #한자리에서 6잔이상 마시는 경우

#a13N$p05_3aq3[a13N$p05_3aq3 == 9] <- NA
#a13N$p05_3aq4[a13N$p05_3aq4 == 9] <- NA
a13N$p05_3aq1[a13N$p05_3aq1 == 9] <- NA
a13N$p05_2[a13N$p05_2 == 9] <- NA
a13N$p05_3[a13N$p05_3 == 9] <- NA

a13N$h_reg5 <- a13$h_reg5 #주거지역
a13N$p03_9 <- a13$p03_9
a13N$p03_10 <- a13$p03_10
a13N$p03_11 <- a13$p03_11
a13N$p03_5 <- a13$p03_5
a13N$p03_6 <- a13$p03_6
a13N$p03_7 <- a13$p03_7
a13N$p03_8 <- a13$p03_8
a13N$h_g6 <- a13$h_g6
a13N$h07_5aq1 <- a13$h07_5aq1 
a13N$h_g4 <- a13$h_g4
a13N$h06_1 <- a13$h06_1
a13N$h_eco4 <- a13$h_eco4

a13N$h07_9 <- a13$h07_9 #생활비
a13N$h06_6 <- a13$h06_6 #주택가격
a13N$h06_5 <- a13$h06_5 #주거면적
a13N$h06_1 <- a13$h06_1 #주거형태
a13N$h_med2 <- a13$h_med2 #건강상태
a13N$h_med9 <- a13$h_med9 #주요병명
a13N$h_g3<- a13$h_g3 #성별
a13N$h07_4 <- a13$h07_4 #세금







a13N <- as.data.frame(a13N)


#a$ID <- paste(a$h_merkey,"_",a$h_pid,"_",a$year, sep = '')
a13N$ID <- paste(a13N$h_merkey,"_",a13N$h_pid,"_",a13N$year, sep = '')

write.csv(a13N,"변수 선택후 원본.csv")

a13N$p03_9[a13N$p03_9 == 9] <- NA
a13N$p03_9[a13N$p03_9 == 99] <- NA

a13N$p03_10[a13N$p03_10 == 9] <- NA
a13N$p03_10[a13N$p03_10 == 99] <- NA

a13N$p03_11[a13N$p03_11 == 9] <- NA
a13N$p03_11[a13N$p03_11 == 99] <- NA

a13N$p03_5[a13N$p03_5 == 9] <- NA
a13N$p03_5[a13N$p03_5 == 99] <- NA

a13N$p03_6[a13N$p03_6 == 9] <- NA
a13N$p03_6[a13N$p03_6 == 99] <- NA

a13N$p03_7[a13N$p03_7 == 9] <- NA
a13N$p03_7[a13N$p03_7 == 99] <- NA

a13N$p03_8[a13N$p03_8 == 9] <- NA
a13N$p03_8[a13N$p03_8 == 99] <- NA

a13N$p03_9[a13N$p03_9 == 9] <- NA
a13N$p03_9[a13N$p03_9 == 99] <- NA

a13N$h_g6[a13N$h_g6 == 99] <- NA
a13N$h06_1[a13N$h06_1 == 99] <- NA
a13N$h_eco4[a13N$h_eco4 == 99] <- NA
a13N$h_med2[a13N$h_med2 == 9] <- NA
a13N$h_g3[a13N$h_g3 == 9] <- NA


a13N2 <- a13N[complete.cases(a13N),]
summary(a13N2)


a13N2 <- dummy_cols(a13N2, select_columns = "h_g6") ## 기준변수 1
a13N2 <- dummy_cols(a13N2, select_columns = "h_reg5") ##기준변수 5
a13N2 <- dummy_cols(a13N2, select_columns = "h_eco4") ##기준변수 8
a13N2 <- dummy_cols(a13N2, select_columns = "h06_1") ##기준변수 9

View(a13N2)

a13N3 <- a13N2[,-c(4,12,15,16,29,32)]

write.csv(a13N,"13년참여자데이터원본190708ver음주흡연관련데이터.csv")

print(sum(is.na(a13N3)))
str(a13N3)

a13N3_Z <- c()
a13N3_Z$CODE <- paste(a13N3$h_merkey,"_",a13N3$h_pid,sep = '')
a13N3_Z$ID <- a13N3$ID
a13N3_Z$p03_9 <- (a13N3$p03_9 - min(a13N3$p03_9))/(max(a13N3$p03_9) - min(a13N3$p03_9))
a13N3_Z$p03_10 <- (a13N3$p03_10 - min(a13N3$p03_10))/(max(a13N3$p03_10) - min(a13N3$p03_10))
a13N3_Z$p03_11 <- (a13N3$p03_11 - min(a13N3$p03_11))/(max(a13N3$p03_11) - min(a13N3$p03_11))
a13N3_Z$p03_5 <- (a13N3$p03_5 - min(a13N3$p03_5))/(max(a13N3$p03_5) - min(a13N3$p03_5))
a13N3_Z$p03_6 <- (a13N3$p03_6 - min(a13N3$p03_6))/(max(a13N3$p03_6) - min(a13N3$p03_6))
a13N3_Z$p03_7 <- (a13N3$p03_7 - min(a13N3$p03_7))/(max(a13N3$p03_7) - min(a13N3$p03_7))
a13N3_Z$p03_8 <- (a13N3$p03_8 - min(a13N3$p03_8))/(max(a13N3$p03_8) - min(a13N3$p03_8))
a13N3_Z$h07_5aq1 <- (a13N3$h07_5aq1 - min(a13N3$h07_5aq1))/(max(a13N3$h07_5aq1) - min(a13N3$h07_5aq1))
a13N3_Z$h_g4 <- (a13N3$h_g4 - min(a13N3$h_g4))/(max(a13N$h_g4) - min(a13N3$h_g4))
a13N3_Z$h_g6_4 <- (a13N3$h_g6_4 - min(a13N3$h_g6_4))/(max(a13N3$h_g6_4) - min(a13N3$h_g6_4))
a13N3_Z$h_g6_3 <- (a13N3$h_g6_3 - min(a13N3$h_g6_3))/(max(a13N3$h_g6_3) - min(a13N3$h_g6_3))
a13N3_Z$h_g6_7 <- (a13N3$h_g6_7 - min(a13N3$h_g6_7))/(max(a13N3$h_g6_7) - min(a13N3$h_g6_7))
a13N3_Z$h_g6_6 <- (a13N3$h_g6_6 - min(a13N3$h_g6_6))/(max(a13N3$h_g6_6) - min(a13N3$h_g6_6))
a13N3_Z$h_g6_5 <- (a13N3$h_g6_5 - min(a13N3$h_g6_5))/(max(a13N3$h_g6_5) - min(a13N3$h_g6_5))

a13N3_Z$h_g6_2 <- (a13N3$h_g6_1 - min(a13N3$h_g6_1))/(max(a13N3$h_g6_1) - min(a13N3$h_g6_1))

a13N3_Z$h_g6_2 <- (a13N3$h_g6_2 - min(a13N3$h_g6_2))/(max(a13N3$h_g6_2) - min(a13N3$h_g6_2))
a13N3_Z$h_g6_8 <- (a13N3$h_g6_8 - min(a13N3$h_g6_8))/(max(a13N3$h_g6_8) - min(a13N3$h_g6_8))
a13N3_Z$h_reg5_1 <- (a13N3$h_reg5_1 - min(a13N3$h_reg5_1))/(max(a13N3$h_reg5_1) - min(a13N3$h_reg5_1))
a13N3_Z$h_reg5_2 <- (a13N3$h_reg5_2 - min(a13N3$h_reg5_2))/(max(a13N3$h_reg5_2) - min(a13N3$h_reg5_2))
a13N3_Z$h_reg5_3 <- (a13N3$h_reg5_3 - min(a13N3$h_reg5_3))/(max(a13N3$h_reg5_3) - min(a13N3$h_reg5_3))
a13N3_Z$h_reg5_4 <- (a13N3$h_reg5_4 - min(a13N3$h_reg5_4))/(max(a13N3$h_reg5_4) - min(a13N3$h_reg5_4))
a13N3_Z$h_eco4_6 <- (a13N3$h_eco4_6 - min(a13N3$h_eco4_6))/(max(a13N3$h_eco4_6) - min(a13N3$h_eco4_6))
a13N3_Z$h_eco4_2 <- (a13N3$h_eco4_2 - min(a13N3$h_eco4_2))/(max(a13N3$h_eco4_2) - min(a13N3$h_eco4_2))
a13N3_Z$h_eco4_3 <- (a13N3$h_eco4_3 - min(a13N3$h_eco4_3))/(max(a13N3$h_eco4_3) - min(a13N3$h_eco4_3))
a13N3_Z$h_eco4_1 <- (a13N3$h_eco4_1 - min(a13N3$h_eco4_1))/(max(a13N3$h_eco4_1) - min(a13N3$h_eco4_1))
a13N3_Z$h_eco4_4 <- (a13N3$h_eco4_4 - min(a13N3$h_eco4_4))/(max(a13N3$h_eco4_4) - min(a13N3$h_eco4_4))
a13N3_Z$h_eco4_5 <- (a13N3$h_eco4_5 - min(a13N3$h_eco4_5))/(max(a13N3$h_eco4_5) - min(a13N3$h_eco4_5))
a13N3_Z$h_eco4_7 <- (a13N3$h_eco4_7 - min(a13N3$h_eco4_7))/(max(a13N3$h_eco4_7) - min(a13N3$h_eco4_7))
a13N3_Z$h06_1_2 <- (a13N3$h06_1_2 - min(a13N3$h06_1_2))/(max(a13N3$h06_1_2) - min(a13N3$h06_1_2))
a13N3_Z$h06_1_1 <- (a13N3$h06_1_1 - min(a13N3$h06_1_1))/(max(a13N3$h06_1_1) - min(a13N3$h06_1_1))
a13N3_Z$h06_1_5 <- (a13N3$h06_1_5 - min(a13N3$h06_1_5))/(max(a13N3$h06_1_5) - min(a13N3$h06_1_5))
a13N3_Z$h06_1_4 <- (a13N3$h06_1_4 - min(a13N3$h06_1_4))/(max(a13N3$h06_1_4) - min(a13N3$h06_1_4))
a13N3_Z$h06_1_3 <- (a13N3$h06_1_3 - min(a13N3$h06_1_3))/(max(a13N3$h06_1_3) - min(a13N3$h06_1_3))

a13N3_Z <- as.data.frame(a13N3_Z)
View(a13N3_Z)
summary(a13N3_Z)

rownames(a13N3_Z) = a13N3_Z$ID

write.csv(a13N3_Z,"13년간참가자정규화데이터190708ver4.csv")
write.csv(a13N3,"13년간참가자원본데이터190708.csv")


a13N3_Z <- a13N3_Z[,-c(1)]

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

#nc <- NbClust(a13N3_Z, min.nc=3, max.nc=5, method="kmeans")
#par(mfrow=c(1,1))
#barplot(table(nc$Best.n[1,]),
#        xlab="Numer of Clusters", ylab="Number of Criteria",
#        main="Number of Clusters Chosen")

library(cluster)

New_13_year_dist <- dist(New_13_year_clust, method = "euclidean") #데이터 간 거리 산출방법 : euclidean method

write.csv(New_13_year_clust,"New_13_year_clust.csv")

New_data_Z$h_reg5_5 <- (New_data_2$h_reg5_5 - min(New_data_2$h_reg5_5))/(max(New_data_2$h_reg5_5) - min(New_data_2$h_reg5_5))
