#Occupancy_Sunday_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
SundayTemperatureTwo <- count(occupancySundayTwo,"Temperature")
SundayHumidityTwo <- count(occupancySundayTwo,"Humidity")
SundayLightTwo <- count(occupancySundayTwo,"Light")
SundayCO2Two <- count(occupancySundayTwo,"CO2")
SundayHumidityRatioTwo <- count(occupancySundayTwo,"HumidityRatio")

#Attribute Value Variables
temperatureSundayTwo <- occupancySundayTwo$Temperature
humiditySundayTwo <- occupancySundayTwo$Humidity
lightSundayTwo <- occupancySundayTwo$Light
co2SundayTwo <- occupancySundayTwo$CO2
humidityRatioSundayTwo <- occupancySundayTwo$HumidityRatio
occupancySundayValueTwo <- as.factor(occupancySundayTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureSundayTwo)
max(temperatureSundayTwo)
#Humidity
min(humiditySundayTwo)
max(humiditySundayTwo)
#Light
min(lightSundayTwo)
max(lightSundayTwo)
#CO2
min(co2SundayTwo)
max(co2SundayTwo)
#Humidity Ratio
min(humidityRatioSundayTwo)
max(humidityRatioSundayTwo)

#Summary on Variables
summary(temperatureSundayTwo)
summary(humiditySundayTwo)
summary(lightSundayTwo)
summary(co2SundayTwo)
summary(humidityRatioSundayTwo)

#Histogram
hist(temperatureSundayTwo, main = "Sunday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humiditySundayTwo, main = "Sunday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightSundayTwo, main = "Sunday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2SundayTwo, main = "Sunday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioSundayTwo, main = "Sunday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureSundayTwo ~ occupancySundayValueTwo, main = "Temperature due to Occupancy: \nSunday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humiditySundayTwo ~ occupancySundayValueTwo, main = "Humidity due to Occupancy: \nSunday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightSundayTwo ~ occupancySundayValueTwo, main = "Light due to Occupancy: \nSunday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2SundayTwo ~ occupancySundayValueTwo, main = "CO2 due to Occupancy: \nSunday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioSundayTwo ~ occupancySundayValueTwo, main = "Humidity Ratio due to Occupancy: \nSunday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# sundayDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 															 	Light + CO2 + HumidityRatio, data = occupancySundayTwo, method = "class")
# 
# prp(sundayDecisionTreeTwo)
# 
# fancyRpartPlot(sundayDecisionTreeTwo)
