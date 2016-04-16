#Occupancy_Decision_Trees.R

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

head(occupancyPreProcessed)

sapply(occupancyPreProcessed, "class")

occupancyPPDT <- rpart(Occupancy ~ Day + TimePeriod + Temperature + Humidity + CO2 + 
											 	humidityRatioDT, data = occupancyPreProcessed, method = "class")

prp(occupancyPPDT)

fancyRpartPlot(occupancyPPDT)
