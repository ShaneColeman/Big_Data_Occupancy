#Occupancy_Monday.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
MondayTemperature <- count(occupancyMonday,"Temperature")
MondayHumidity <- count(occupancyMonday,"Humidity")
MondayLight <- count(occupancyMonday,"Light")
MondayCO2 <- count(occupancyMonday,"CO2")
MondayHumidityRatio <- count(occupancyMonday,"HumidityRatio")

#Attribute Value Variables
temperatureMonday <- occupancyMonday$Temperature
humidityMonday <- occupancyMonday$Humidity
lightMonday <- occupancyMonday$Light
co2Monday <- occupancyMonday$CO2
humidityRatioMonday <- occupancyMonday$HumidityRatio
occupancyMondayValue <- as.factor(occupancyMonday$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureMonday)
max(temperatureMonday)
#Humidity
min(humidityMonday)
max(humidityMonday)
#Light
min(lightMonday)
max(lightMonday)
#CO2
min(co2Monday)
max(co2Monday)
#Humidity Ratio
min(humidityRatioMonday)
max(humidityRatioMonday)

#Summary on Variables
summary(temperatureMonday)
summary(humidityMonday)
summary(lightMonday)
summary(co2Monday)
summary(humidityRatioMonday)

#Histogram
hist(temperatureMonday, main = "Monday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityMonday, main = "Monday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightMonday, main = "Monday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2Monday, main = "Monday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioMonday, main = "Monday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureMonday ~ occupancyMondayValue, main = "Temperature due to Occupancy: \nMonday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityMonday ~ occupancyMondayValue, main = "Humidity due to Occupancy: \nMonday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightMonday ~ occupancyMondayValue, main = "Light due to Occupancy: \nMonday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2Monday ~ occupancyMondayValue, main = "CO2 due to Occupancy: \nMonday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioMonday ~ occupancyMondayValue, main = "Humidity Ratio due to Occupancy: \nMonday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

mondayDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													Light + CO2 + HumidityRatio, data = occupancyMonday, method = "class")

prp(mondayDecisionTree)

fancyRpartPlot(mondayDecisionTree)
