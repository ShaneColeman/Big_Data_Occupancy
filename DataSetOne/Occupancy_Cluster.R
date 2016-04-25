#Occupancy_Cluster.R

#K Means Clustering
occupancyCluster <- occupancyPreProcessed

head(occupancyCluster)

str(occupancyCluster)

occupancyCluster$Day <- as.numeric(occupancyCluster$Day)
occupancyCluster$TimePeriod <- as.numeric(occupancyCluster$TimePeriod)
occupancyCluster$TimeOfDay <- as.numeric(occupancyCluster$TimeOfDay)
occupancyCluster$Temperature <- as.numeric(occupancyCluster$Temperature)
occupancyCluster$Humidity <- as.numeric(occupancyCluster$Humidity)
occupancyCluster$Light <- as.numeric(occupancyCluster$Light)
occupancyCluster$CO2 <- as.numeric(occupancyCluster$CO2)
occupancyCluster$HumidityRatio <- as.numeric(occupancyCluster$HumidityRatio)
occupancyCluster$Occupancy <- as.factor(occupancyCluster$Occupancy)

str(occupancyCluster)
names(occupancyCluster)

inputs <- occupancyCluster[c(1:8)]
str(inputs)
output <- occupancyCluster$Occupancy
str(output)

occupancyKMeans <- kmeans(inputs, 2)
occupancyKMeans

table(occupancyKMeans$cluster, output)
occupancyKMeans$centers

plot(inputs[c(1:8)], col = 1:2)
points(occupancyKMeans$centers[,c(1:8)], col = 1:2, pch = 4, cex = 2)

#Unsupervised Clustering
set.seed(21)
occupancyKMeans2 <- kmeans(occupancyCluster[,1:8], 2, nstart = 21)
occupancyKMeans2
table(occupancyKMeans2$cluster, occupancyCluster$Occupancy)

#Time of Day & Temperature
plot(inputs[c("Light","CO2")], col = 1:2)
points(occupancyCluster$centers[c("Light","CO2")], col = 1:2,
			 pch = 4, cex = 2)

#https://rstudio-pubs-static.s3.amazonaws.com/33876_1d7794d9a86647ca90c4f182df93f0e8.html
#Cluster Library
head(occupancyCluster)

occupancyCluster$Occupancy <- as.numeric(occupancyCluster$Occupancy)
occupancyCluster.stand <- scale(occupancyCluster[-1])
head(occupancyCluster.stand)
summary(occupancyCluster.stand)

kMeansOccupancyFit <- kmeans(occupancyCluster.stand,2)
head(kMeansOccupancyFit)
summary(kMeansOccupancyFit)

attributes(kMeansOccupancyFit)

kMeansOccupancyFit$centers
kMeansOccupancyFit$cluster
kMeansOccupancyFit$size

wssplot <- function(data, nc = 8, seed=1234)
	{
		wss <- (nrow(data)-1)*sum(apply(data,2,var))
		
		for (i in 2:nc)
			{
				set.seed(seed)
				wss[i] <- sum(kmeans(data, centers=i)$withinss)
			}
	
		plot(1:nc, wss, type="b", xlab="Number of Clusters",
			 ylab="Within groups sum of squares")
	}

wssplot(occupancyCluster.stand, nc=4) 

library(cluster)
clusplot(occupancyCluster.stand, kMeansOccupancyFit$cluster, main = "Occupancy Cluster",
				 color = TRUE, shade = TRUE, labels = 2, lines = 0)

#Hierarchical Clustering Occupancy
occupancyEuclidean <- dist(occupancyCluster.stand, method = "euclidean")
euclideanOccupancyFit <- hclust(occupancyEuclidean, method = "ward.D")
plot(euclideanOccupancyFit)
occupancyGroups <- cutree(euclideanOccupancyFit, k = 2)
rect.hclust(euclideanOccupancyFit, k = 2, border = "red")
table(occupancyCluster[,1],occupancyGroups)
