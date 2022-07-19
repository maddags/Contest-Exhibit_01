library(cluster)
library(NbClust)

nc <- NbClust(row_name_id, min.nc = 2, max.nc = 15, method = "kmeans")


data_kmeans <- kmeans(row_name_id, centers = 5, iter.max = 1000)
data_kmeans$centers
