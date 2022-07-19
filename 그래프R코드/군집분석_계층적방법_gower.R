library(cluster)
order <- c(1:115492)
new_data <- cbind(order,new_data)
View(new_data)
data_13 <- new_data[new_data$order%%13 == 0,]

data_13_non_na <- na.omit(data_13)
data_13_binom_region <- data_13_non_na[,21:25]

gower_d <- daisy(row_name_id, metric = "gower")


gower_dist <- daisy(data_13_binom_region,metric = c("gower"))
class(gower_dist)

agg_clust <- hclust(gower_dist, method = "complete")
plot(agg_clust)


