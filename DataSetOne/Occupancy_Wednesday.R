#Occupancy_Wednesday.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
WednesdayTemperature <- count(occupancyWednesday,"Temperature")
WednesdayHumidity <- count(occupancyWednesday,"Humidity")
WednesdayLight <- count(occupancyWednesday,"Light")
WednesdayCO2 <- count(occupancyWednesday,"CO2")
WednesdayHumidityRatio <- count(occupancyWednesday,"HumidityRatio")

#Attribute Value Variables
temperatureWednesday <- occupancyWednesday$Temperature
humidityWednesday <- occupancyWednesday$Humidity
lightWednesday <- occupancyWednesday$Light
co2Wednesday <- occupancyWednesday$CO2
humidityRatioWednesday <- occupancyWednesday$HumidityRatio
occupancyWednesdayValue <- as.factor(occupancyWednesday$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureWednesday)
max(temperatureWednesday)
#Humidity
min(humidityWednesday)
max(humidityWednesday)
#Light
min(lightWednesday)
max(lightWednesday)
#CO2
min(co2Wednesday)
max(co2Wednesday)
#Humidity Ratio
min(humidityRatioWednesday)
max(humidityRatioWednesday)

#Summary on Variables
summary(temperatureWednesday)
summary(humidityWednesday)
summary(lightWednesday)
summary(co2Wednesday)
summary(humidityRatioWednesday)

#Histogram
hist(temperatureWednesday, main = "Wednesday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityWednesday, main = "Wednesday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightWednesday, main = "Wednesday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2Wednesday, main = "Wednesday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioWednesday, main = "Wednesday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureWednesday ~ occupancyWednesdayValue, main = "Temperature due to Occupancy: \nWednesday", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityWednesday ~ occupancyWednesdayValue, main = "Humidity due to Occupancy: \nWednesday", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightWednesday ~ occupancyWednesdayValue, main = "Light due to Occupancy: \nWednesday", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2Wednesday ~ occupancyWednesdayValue, main = "CO2 due to Occupancy: \nWednesday" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioWednesday ~ occupancyWednesdayValue, main = "Humidity Ratio due to Occupancy: \nWednesday",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

wednesdayDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
														 	Light + CO2 + HumidityRatio, data = occupancyWednesday, method = "class")

prp(wednesdayDecisionTree)

fancyRpartPlot(wednesdayDecisionTree)
