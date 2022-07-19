rank_data <- row_name_id[,1:7]
binom_data_region <- row_name_id[,17:21]
binom_data_education <- row_name_id[,8:16]

View(binom_data_region)

#install.packages("proxy"), 자카드거리/자카드계수 계산
library(proxy)
View(data_13_binom_region)
dist <- dist(data_13_binom_region,data_13_binom_region, method = "Jaccard")
plot(dist)

aaa <- data_13_binom_region[1:5,]
aaa_dist <- dist(aaa, method = "Jaccard")
aaa_dist
