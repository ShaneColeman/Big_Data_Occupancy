#Occupancy_Thursday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
ThursdayTemperatureTwo <- count(occupancyThursdayTwo,"Temperature")
ThursdayHumidityTwo <- count(occupancyThursdayTwo,"Humidity")
ThursdayLightTwo <- count(occupancyThursdayTwo,"Light")
ThursdayCO2Two <- count(occupancyThursdayTwo,"CO2")
ThursdayHumidityRatioTwo <- count(occupancyThursdayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureThursdayTwo <- occupancyThursdayTwo$Temperature
humidityThursdayTwo <- occupancyThursdayTwo$Humidity
lightThursdayTwo <- occupancyThursdayTwo$Light
co2ThursdayTwo <- occupancyThursdayTwo$CO2
humidityRatioThursdayTwo <- occupancyThursdayTwo$HumidityRatio
occupancyThursdayValueTwo <- as.factor(occupancyThursdayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureThursdayTwo)
max(temperatureThursdayTwo)
#Humidity
min(humidityThursdayTwo)
max(humidityThursdayTwo)
#Light
min(lightThursdayTwo)
max(lightThursdayTwo)
#CO2
min(co2ThursdayTwo)
max(co2ThursdayTwo)
#Humidity Ratio
min(humidityRatioThursdayTwo)
max(humidityRatioThursdayTwo)

#Summary on Variables
summary(temperatureThursdayTwo)
summary(humidityThursdayTwo)
summary(lightThursdayTwo)
summary(co2ThursdayTwo)
summary(humidityRatioThursdayTwo)

#Histogram
hist(temperatureThursdayTwo, main = "Thursday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityThursdayTwo, main = "Thursday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightThursdayTwo, main = "Thursday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2ThursdayTwo, main = "Thursday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioThursdayTwo, main = "Thursday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureThursdayTwo ~ occupancyThursdayValueTwo, main = "Temperature due to Occupancy: \nThursday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityThursdayTwo ~ occupancyThursdayValueTwo, main = "Humidity due to Occupancy: \nThursday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightThursdayTwo ~ occupancyThursdayValueTwo, main = "Light due to Occupancy: \nThursday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2ThursdayTwo ~ occupancyThursdayValueTwo, main = "CO2 due to Occupancy: \nThursday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioThursdayTwo ~ occupancyThursdayValueTwo, main = "Humidity Ratio due to Occupancy: \nThursday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

thursdayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
																		Light + CO2 + HumidityRatio, data = occupancyThursdayTwo, method = "class")

prp(thursdayDecisionTreeTwo)

fancyRpartPlot(thursdayDecisionTreeTwo)
