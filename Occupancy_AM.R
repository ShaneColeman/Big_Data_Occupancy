#Occupancy_AM.R

library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
AMTemperature <- count(occupancyAM,"Temperature")
AMHumidity <- count(occupancyAM,"Humidity")
AMLight <- count(occupancyAM,"Light")
AMCO2 <- count(occupancyAM,"CO2")
AMHumidityRatio <- count(occupancyAM,"HumidityRatio")

#Attribute Value Variables
temperatureAM <- occupancyAM$Temperature
humidityAM <- occupancyAM$Humidity
lightAM <- occupancyAM$Light
co2AM <- occupancyAM$CO2
humidityRatioAM <- occupancyAM$HumidityRatio
occupancyAMValue <- as.factor(occupancyAM$Occupancy)

#Summary on Variables
summary(temperatureAM)
summary(humidityAM)
summary(lightAM)
summary(co2AM)
summary(humidityRatioAM)

#Standard Deviation
sd(lightAM)

#Histogram
hist(temperatureAM, main = "AM Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityAM, main = "AM Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightAM, main = "AM Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2AM, main = "AM CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioAM, main = "AM Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureAM ~ occupancyAMValue, xlab = "Occupied", ylab = "Temperature", 
				cex = 0, col = c("green","yellow"))

boxplot(humidityAM ~ occupancyAMValue, xlab = "Occupied", ylab = "Humidity", 
				cex = 0, col = c("green","yellow"))

boxplot(co2AM ~ occupancyAMValue, xlab = "Occupied", ylab = "CO2", 
				cex = 0, col = c("green","yellow"))

boxplot(lightAM ~ occupancyAMValue, xlab = "Occupied", ylab = "Light",
				cex = 0, col = c("green","yellow"))
