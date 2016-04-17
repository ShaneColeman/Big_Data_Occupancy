#Occupancy_Decision_Trees_Two.R

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

head(occupancyPreProcessedTwo)

sapply(occupancyPreProcessedTwo, "class")

occupancyDecisionTreeTwo <- occupancyPreProcessedTwo

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

occupancyAllTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity + Light +
												CO2 + HumidityRatio, data = occupancyDecisionTreeTwo, 
											method = "class")
prp(occupancyAllTwo)
fancyRpartPlot(occupancyAllTwo)


occupancyNoLightTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
														CO2 + HumidityRatio, data = occupancyDecisionTreeTwo, 
													method = "class")
prp(occupancyNoLightTwo)
fancyRpartPlot(occupancyNoLightTwo)


occupancyNoDayTimeTwo <- rpart(Occupancy ~ Temperature + Humidity +
															CO2 + HumidityRatio, data = occupancyDecisionTreeTwo, 
														method = "class")
prp(occupancyNoDayTimeTwo, cex = 0.6)
fancyRpartPlot(occupancyNoDayTimeTwo, cex = 0.6)

