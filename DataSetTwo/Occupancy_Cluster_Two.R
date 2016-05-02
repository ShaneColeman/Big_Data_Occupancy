#Occupancy_Cluster_Two.R

#K Means Clustering
occupancyClusterTwo <- occupancyPreProcessedTwo

head(occupancyClusterTwo)

str(occupancyClusterTwo)

occupancyClusterTwo$Day <- as.numeric(occupancyClusterTwo$Day)
occupancyClusterTwo$TimePeriod <- as.numeric(occupancyClusterTwo$TimePeriod)
occupancyClusterTwo$TimeOfDay <- as.numeric(occupancyClusterTwo$TimeOfDay)
occupancyClusterTwo$Temperature <- as.numeric(occupancyClusterTwo$Temperature)
occupancyClusterTwo$Humidity <- as.numeric(occupancyClusterTwo$Humidity)
occupancyClusterTwo$Light <- as.numeric(occupancyClusterTwo$Light)
occupancyClusterTwo$CO2 <- as.numeric(occupancyClusterTwo$CO2)
occupancyClusterTwo$HumidityRatio <- as.numeric(occupancyClusterTwo$HumidityRatio)
occupancyClusterTwo$Occupancy <- as.numeric(occupancyClusterTwo$Occupancy)

str(occupancyClusterTwo)
names(occupancyClusterTwo)

inputsTwo <- occupancyClusterTwo[c(1:8)]
str(inputsTwo)
outputTwo <- occupancyClusterTwo$Occupancy
str(outputTwo)

occupancyKMeansTwo <- kmeans(inputsTwo, 2)
occupancyKMeansTwo

table(occupancyKMeansTwo$cluster, outputTwo)
occupancyKMeansTwo$centers

plot(inputsTwo[c(1:8)], col = 1:2)
points(occupancyKMeansTwo$centers[,c(1:8)], col = 1:2, pch = 4, cex = 2)

#Unsupervised Clustering
set.seed(28)
occupancyKMeans2Two <- kmeans(occupancyClusterTwo[,1:8], 2, nstart = 28)
occupancyKMeans2Two
table(occupancyKMeans2Two$cluster, occupancyClusterTwo$Occupancy)

#Time of Day & Temperature
plot(inputsTwo[c("Light","CO2")], col = 1:2)
points(occupancyClusterTwo$centers[c("Light","CO2")], col = 1:2,
			 pch = 4, cex = 2)

#https://rstudio-pubs-static.s3.amazonaws.com/33876_1d7794d9a86647ca90c4f182df93f0e8.html
#Cluster Library
head(occupancyClusterTwo)
occupancyCluster.standTwo <- scale(occupancyClusterTwo[-1])
head(occupancyCluster.standTwo)
summary(occupancyCluster.standTwo)

kMeansOccupancyFitTwo <- kmeans(occupancyCluster.standTwo,2)
head(kMeansOccupancyFitTwo)
summary(kMeansOccupancyFitTwo)

attributes(kMeansOccupancyFitTwo)

kMeansOccupancyFitTwo$centers
kMeansOccupancyFitTwo$cluster
kMeansOccupancyFitTwo$size

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

wssplot(occupancyCluster.standTwo, nc=5) 

library(cluster)
clusplot(occupancyCluster.standTwo, kMeansOccupancyFitTwo$cluster, main = "Occupancy Cluster Two",
				 color = TRUE, shade = TRUE, labels = 2, lines = 0)

#Hierarchical Clustering Occupancy
occupancyEuclideanTwo <- dist(occupancyCluster.standTwo, method = "euclidean")
euclideanOccupancyFitTwo <- hclust(occupancyEuclideanTwo, method = "ward.D")
plot(euclideanOccupancyFitTwo)
occupancyGroupsTwo <- cutree(euclideanOccupancyFitTwo, k = 2)
rect.hclust(euclideanOccupancyFitTwo, k = 2, border = "red")
table(occupancyClusterTwo[,1],occupancyGroupsTwo)
