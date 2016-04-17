#Occupancy_Monday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
MondayTemperatureTwo <- count(occupancyMondayTwo,"Temperature")
MondayHumidityTwo <- count(occupancyMondayTwo,"Humidity")
MondayLightTwo <- count(occupancyMondayTwo,"Light")
MondayCO2Two <- count(occupancyMondayTwo,"CO2")
MondayHumidityRatioTwo <- count(occupancyMondayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureMondayTwo <- occupancyMondayTwo$Temperature
humidityMondayTwo <- occupancyMondayTwo$Humidity
lightMondayTwo <- occupancyMondayTwo$Light
co2MondayTwo <- occupancyMondayTwo$CO2
humidityRatioMondayTwo <- occupancyMondayTwo$HumidityRatio
occupancyMondayValueTwo <- as.factor(occupancyMondayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureMondayTwo)
max(temperatureMondayTwo)
#Humidity
min(humidityMondayTwo)
max(humidityMondayTwo)
#Light
min(lightMondayTwo)
max(lightMondayTwo)
#CO2
min(co2MondayTwo)
max(co2MondayTwo)
#Humidity Ratio
min(humidityRatioMondayTwo)
max(humidityRatioMondayTwo)

#Summary on Variables
summary(temperatureMondayTwo)
summary(humidityMondayTwo)
summary(lightMondayTwo)
summary(co2MondayTwo)
summary(humidityRatioMondayTwo)

#Histogram
hist(temperatureMondayTwo, main = "Monday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityMondayTwo, main = "Monday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightMondayTwo, main = "Monday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2MondayTwo, main = "Monday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioMondayTwo, main = "Monday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureMondayTwo ~ occupancyMondayValueTwo, main = "Temperature due to Occupancy: \nMonday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityMondayTwo ~ occupancyMondayValueTwo, main = "Humidity due to Occupancy: \nMonday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightMondayTwo ~ occupancyMondayValueTwo, main = "Light due to Occupancy: \nMonday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2MondayTwo ~ occupancyMondayValueTwo, main = "CO2 due to Occupancy: \nMonday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioMondayTwo ~ occupancyMondayValueTwo, main = "Humidity Ratio due to Occupancy: \nMonday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

mondayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
															 	Light + CO2 + HumidityRatio, data = occupancyMondayTwo, method = "class")

prp(mondayDecisionTreeTwo)

fancyRpartPlot(mondayDecisionTreeTwo)
