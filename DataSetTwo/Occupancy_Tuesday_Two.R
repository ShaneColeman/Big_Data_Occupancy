#Occupancy_Tuesday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TuesdayTemperatureTwo <- count(occupancyTuesdayTwo,"Temperature")
TuesdayHumidityTwo <- count(occupancyTuesdayTwo,"Humidity")
TuesdayLightTwo <- count(occupancyTuesdayTwo,"Light")
TuesdayCO2Two <- count(occupancyTuesdayTwo,"CO2")
TuesdayHumidityRatioTwo <- count(occupancyTuesdayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureTuesdayTwo <- occupancyTuesdayTwo$Temperature
humidityTuesdayTwo <- occupancyTuesdayTwo$Humidity
lightTuesdayTwo <- occupancyTuesdayTwo$Light
co2TuesdayTwo <- occupancyTuesdayTwo$CO2
humidityRatioTuesdayTwo <- occupancyTuesdayTwo$HumidityRatio
occupancyTuesdayValueTwo <- as.factor(occupancyTuesdayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureTuesdayTwo)
max(temperatureTuesdayTwo)
#Humidity
min(humidityTuesdayTwo)
max(humidityTuesdayTwo)
#Light
min(lightTuesdayTwo)
max(lightTuesdayTwo)
#CO2
min(co2TuesdayTwo)
max(co2TuesdayTwo)
#Humidity Ratio
min(humidityRatioTuesdayTwo)
max(humidityRatioTuesdayTwo)

#Summary on Variables
summary(temperatureTuesdayTwo)
summary(humidityTuesdayTwo)
summary(lightTuesdayTwo)
summary(co2TuesdayTwo)
summary(humidityRatioTuesdayTwo)

#Histogram
hist(temperatureTuesdayTwo, main = "Tuesday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityTuesdayTwo, main = "Tuesday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightTuesdayTwo, main = "Tuesday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2TuesdayTwo, main = "Tuesday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioTuesdayTwo, main = "Tuesday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureTuesdayTwo ~ occupancyTuesdayValueTwo, main = "Temperature due to Occupancy: \nTuesday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityTuesdayTwo ~ occupancyTuesdayValueTwo, main = "Humidity due to Occupancy: \nTuesday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightTuesdayTwo ~ occupancyTuesdayValueTwo, main = "Light due to Occupancy: \nTuesday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2TuesdayTwo ~ occupancyTuesdayValueTwo, main = "CO2 due to Occupancy: \nTuesday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioTuesdayTwo ~ occupancyTuesdayValueTwo, main = "Humidity Ratio due to Occupancy: \nTuesday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

tuesdayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
															 	Light + CO2 + HumidityRatio, data = occupancyTuesdayTwo, method = "class")

prp(tuesdayDecisionTreeTwo)

fancyRpartPlot(tuesdayDecisionTreeTwo)
