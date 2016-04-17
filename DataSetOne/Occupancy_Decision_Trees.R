#Occupancy_Decision_Trees.R

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

head(occupancyPreProcessed)

sapply(occupancyPreProcessed, "class")

occupancyDecisionTree <- occupancyPreProcessed

#occupancyDecisionTree[1:9] <- sapply(occupancyDecisionTree[1:9], as.numeric)

# dayDT <- occupancyDecisionTree$Day
# timePeriodDT <- occupancyDecisionTree$TimePeriod
# timeOfDayDT <- as.numeric(occupancyDecisionTree$TimeOfDay)
# temperatureDT <- occupancyDecisionTree$Temperature
# humidityDT <- occupancyDecisionTree$Humidity
# lightDT <- occupancyDecisionTree$Light
# co2DT <- occupancyDecisionTree$CO2
# humidityRatioDT <- occupancyDecisionTree$HumidityRatio
# occupancyDT <- occupancyDecisionTree$Occupancy

occupancyAll <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity + Light +
										CO2 + HumidityRatio, data = occupancyDecisionTree, 
											method = "class")
prp(occupancyAll)
fancyRpartPlot(occupancyAll)


occupancyNoLight <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
											CO2 + HumidityRatio, data = occupancyDecisionTree, 
												method = "class")
prp(occupancyNoLight)
fancyRpartPlot(occupancyNoLight)


occupancyNoDayTime <- rpart(Occupancy ~ Temperature + Humidity +
												CO2 + HumidityRatio, data = occupancyDecisionTree, 
													method = "class")
prp(occupancyNoDayTime)
fancyRpartPlot(occupancyNoDayTime, cex = 0.5)

