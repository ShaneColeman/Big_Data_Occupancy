#Occupancy_Cluster.R

#K Means Clustering
occupancyCluster <- occupancyPreProcessed

head(occupancyCluster)

str(occupancyCluster)

occupancyCluster$Day <- as.numeric(occupancyCluster$Day)
occupancyCluster$TimePeriod <- as.numeric(occupancyCluster$TimePeriod)
occupancyCluster$TimeOfDay<- as.numeric(occupancyCluster$TimeOfDay)
occupancyCluster$Occupancy <- as.numeric(occupancyCluster$Occupancy)

str(occupancyCluster)

names(occupancyCluster)

inputs <- occupancyCluster[c(1:8)]
str(inputs)
output <- occupancyCluster$Occupancy
str(output)

occupancyKMeans <- kmeans(inputs, 2)

occupancyKMeans

table(output, occupancyKMeans$cluster)

occupancyKMeans$centers

plot(inputs[c(1:8)], col = 1:2)
points(occupancyKMeans$centers[,c(1:8)], col = 1:2, pch = 4, cex = 2)

#Time of Day & Temperature
plot(inputs[c("TimeOfDay","Temperature")], col = 1:4)
points(occupancyCluster$centers[c("TimeOfDay","Humidity")], col = 1:4,
			 pch = 4, cex = 2)