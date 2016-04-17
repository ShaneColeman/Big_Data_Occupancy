#Occupancy_Wednesday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
WednesdayTemperatureTwo <- count(occupancyWednesdayTwo,"Temperature")
WednesdayHumidityTwo <- count(occupancyWednesdayTwo,"Humidity")
WednesdayLightTwo <- count(occupancyWednesdayTwo,"Light")
WednesdayCO2Two <- count(occupancyWednesdayTwo,"CO2")
WednesdayHumidityRatioTwo <- count(occupancyWednesdayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureWednesdayTwo <- occupancyWednesdayTwo$Temperature
humidityWednesdayTwo <- occupancyWednesdayTwo$Humidity
lightWednesdayTwo <- occupancyWednesdayTwo$Light
co2WednesdayTwo <- occupancyWednesdayTwo$CO2
humidityRatioWednesdayTwo <- occupancyWednesdayTwo$HumidityRatio
occupancyWednesdayValueTwo <- as.factor(occupancyWednesdayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureWednesdayTwo)
max(temperatureWednesdayTwo)
#Humidity
min(humidityWednesdayTwo)
max(humidityWednesdayTwo)
#Light
min(lightWednesdayTwo)
max(lightWednesdayTwo)
#CO2
min(co2WednesdayTwo)
max(co2WednesdayTwo)
#Humidity Ratio
min(humidityRatioWednesdayTwo)
max(humidityRatioWednesdayTwo)

#Summary on Variables
summary(temperatureWednesdayTwo)
summary(humidityWednesdayTwo)
summary(lightWednesdayTwo)
summary(co2WednesdayTwo)
summary(humidityRatioWednesdayTwo)

#Histogram
hist(temperatureWednesdayTwo, main = "Wednesday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityWednesdayTwo, main = "Wednesday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightWednesdayTwo, main = "Wednesday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2WednesdayTwo, main = "Wednesday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioWednesdayTwo, main = "Wednesday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureWednesdayTwo ~ occupancyWednesdayValueTwo, main = "Temperature due to Occupancy: \nWednesday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityWednesdayTwo ~ occupancyWednesdayValueTwo, main = "Humidity due to Occupancy: \nWednesday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightWednesdayTwo ~ occupancyWednesdayValueTwo, main = "Light due to Occupancy: \nWednesday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2WednesdayTwo ~ occupancyWednesdayValueTwo, main = "CO2 due to Occupancy: \nWednesday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioWednesdayTwo ~ occupancyWednesdayValueTwo, main = "Humidity Ratio due to Occupancy: \nWednesday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

wednesdayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
															 	Light + CO2 + HumidityRatio, data = occupancyWednesdayTwo, method = "class")

prp(wednesdayDecisionTreeTwo)

fancyRpartPlot(wednesdayDecisionTreeTwo)
