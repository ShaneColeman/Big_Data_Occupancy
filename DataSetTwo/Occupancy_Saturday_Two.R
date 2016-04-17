#Occupancy_Saturday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
SaturdayTemperatureTwo <- count(occupancySaturdayTwo,"Temperature")
SaturdayHumidityTwo <- count(occupancySaturdayTwo,"Humidity")
SaturdayLightTwo <- count(occupancySaturdayTwo,"Light")
SaturdayCO2Two <- count(occupancySaturdayTwo,"CO2")
SaturdayHumidityRatioTwo <- count(occupancySaturdayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureSaturdayTwo <- occupancySaturdayTwo$Temperature
humiditySaturdayTwo <- occupancySaturdayTwo$Humidity
lightSaturdayTwo <- occupancySaturdayTwo$Light
co2SaturdayTwo <- occupancySaturdayTwo$CO2
humidityRatioSaturdayTwo <- occupancySaturdayTwo$HumidityRatio
occupancySaturdayValueTwo <- as.factor(occupancySaturdayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureSaturdayTwo)
max(temperatureSaturdayTwo)
#Humidity
min(humiditySaturdayTwo)
max(humiditySaturdayTwo)
#Light
min(lightSaturdayTwo)
max(lightSaturdayTwo)
#CO2
min(co2SaturdayTwo)
max(co2SaturdayTwo)
#Humidity Ratio
min(humidityRatioSaturdayTwo)
max(humidityRatioSaturdayTwo)

#Summary on Variables
summary(temperatureSaturdayTwo)
summary(humiditySaturdayTwo)
summary(lightSaturdayTwo)
summary(co2SaturdayTwo)
summary(humidityRatioSaturdayTwo)

#Histogram
hist(temperatureSaturdayTwo, main = "Saturday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humiditySaturdayTwo, main = "Saturday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightSaturdayTwo, main = "Saturday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2SaturdayTwo, main = "Saturday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioSaturdayTwo, main = "Saturday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureSaturdayTwo ~ occupancySaturdayValueTwo, main = "Temperature due to Occupancy: \nSaturday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humiditySaturdayTwo ~ occupancySaturdayValueTwo, main = "Humidity due to Occupancy: \nSaturday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightSaturdayTwo ~ occupancySaturdayValueTwo, main = "Light due to Occupancy: \nSaturday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2SaturdayTwo ~ occupancySaturdayValueTwo, main = "CO2 due to Occupancy: \nSaturday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioSaturdayTwo ~ occupancySaturdayValueTwo, main = "Humidity Ratio due to Occupancy: \nSaturday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# saturdayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 															 	Light + CO2 + HumidityRatio, data = occupancySaturdayTwo, 
# 																 method = "class")
# 
# prp(saturdayDecisionTreeTwo)
# 
# fancyRpartPlot(saturdayDecisionTreeTwo)
