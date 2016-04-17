#Occupancy_Tuesday.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TuesdayTemperature <- count(occupancyTuesday,"Temperature")
TuesdayHumidity <- count(occupancyTuesday,"Humidity")
TuesdayLight <- count(occupancyTuesday,"Light")
TuesdayCO2 <- count(occupancyTuesday,"CO2")
TuesdayHumidityRatio <- count(occupancyTuesday,"HumidityRatio")

#Attribute Value Variables
temperatureTuesday <- occupancyTuesday$Temperature
humidityTuesday <- occupancyTuesday$Humidity
lightTuesday <- occupancyTuesday$Light
co2Tuesday <- occupancyTuesday$CO2
humidityRatioTuesday <- occupancyTuesday$HumidityRatio
occupancyTuesdayValue <- as.factor(occupancyTuesday$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureTuesday)
max(temperatureTuesday)
#Humidity
min(humidityTuesday)
max(humidityTuesday)
#Light
min(lightTuesday)
max(lightTuesday)
#CO2
min(co2Tuesday)
max(co2Tuesday)
#Humidity Ratio
min(humidityRatioTuesday)
max(humidityRatioTuesday)

#Summary on Variables
summary(temperatureTuesday)
summary(humidityTuesday)
summary(lightTuesday)
summary(co2Tuesday)
summary(humidityRatioTuesday)

#Histogram
hist(temperatureTuesday, main = "Tuesday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityTuesday, main = "Tuesday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightTuesday, main = "Tuesday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2Tuesday, main = "Tuesday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioTuesday, main = "Tuesday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureTuesday ~ occupancyTuesdayValue, main = "Temperature due to Occupancy: \nTuesday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityTuesday ~ occupancyTuesdayValue, main = "Humidity due to Occupancy: \nTuesday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightTuesday ~ occupancyTuesdayValue, main = "Light due to Occupancy: \nTuesday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2Tuesday ~ occupancyTuesdayValue, main = "CO2 due to Occupancy: \nTuesday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioTuesday ~ occupancyTuesdayValue, main = "Humidity Ratio due to Occupancy: \nTuesday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

tuesdayDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
															Light + CO2 + HumidityRatio, data = occupancyTuesday, method = "class")

prp(tuesdayDecisionTree)

fancyRpartPlot(tuesdayDecisionTree)
