#Occupancy_Friday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
FridayTemperatureTwo <- count(occupancyFridayTwo,"Temperature")
FridayHumidityTwo <- count(occupancyFridayTwo,"Humidity")
FridayLightTwo <- count(occupancyFridayTwo,"Light")
FridayCO2Two <- count(occupancyFridayTwo,"CO2")
FridayHumidityRatioTwo <- count(occupancyFridayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureFridayTwo <- occupancyFridayTwo$Temperature
humidityFridayTwo <- occupancyFridayTwo$Humidity
lightFridayTwo <- occupancyFridayTwo$Light
co2FridayTwo <- occupancyFridayTwo$CO2
humidityRatioFridayTwo <- occupancyFridayTwo$HumidityRatio
occupancyFridayValueTwo <- as.factor(occupancyFridayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureFridayTwo)
max(temperatureFridayTwo)
#Humidity
min(humidityFridayTwo)
max(humidityFridayTwo)
#Light
min(lightFridayTwo)
max(lightFridayTwo)
#CO2
min(co2FridayTwo)
max(co2FridayTwo)
#Humidity Ratio
min(humidityRatioFridayTwo)
max(humidityRatioFridayTwo)

#Summary on Variables
summary(temperatureFridayTwo)
summary(humidityFridayTwo)
summary(lightFridayTwo)
summary(co2FridayTwo)
summary(humidityRatioFridayTwo)

#Histogram
hist(temperatureFridayTwo, main = "Friday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityFridayTwo, main = "Friday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightFridayTwo, main = "Friday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2FridayTwo, main = "Friday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioFridayTwo, main = "Friday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureFridayTwo ~ occupancyFridayValueTwo, main = "Temperature due to Occupancy: \nFriday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityFridayTwo ~ occupancyFridayValueTwo, main = "Humidity due to Occupancy: \nFriday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightFridayTwo ~ occupancyFridayValueTwo, main = "Light due to Occupancy: \nFriday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2FridayTwo ~ occupancyFridayValueTwo, main = "CO2 due to Occupancy: \nFriday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioFridayTwo ~ occupancyFridayValueTwo, main = "Humidity Ratio due to Occupancy: \nFriday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

fridayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
																 	Light + CO2 + HumidityRatio, data = occupancyFridayTwo, method = "class")

prp(fridayDecisionTreeTwo)

fancyRpartPlot(fridayDecisionTreeTwo)
