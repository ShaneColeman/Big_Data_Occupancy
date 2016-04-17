#Occupancy_PM.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
PMTemperature <- count(occupancyPM,"Temperature")
PMHumidity <- count(occupancyPM,"Humidity")
PMLight <- count(occupancyPM,"Light")
PMCO2 <- count(occupancyPM,"CO2")
PMHumidityRatio <- count(occupancyPM,"HumidityRatio")

#Attribute Value Variables
temperaturePM <- occupancyPM$Temperature
humidityPM <- occupancyPM$Humidity
lightPM <- occupancyPM$Light
co2PM <- occupancyPM$CO2
humidityRatioPM <- occupancyPM$HumidityRatio
occupancyPMValue <- as.factor(occupancyPM$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperaturePM)
max(temperaturePM)
#Humidity
min(humidityPM)
max(humidityPM)
#Light
min(lightPM)
max(lightPM)
#CO2
min(co2PM)
max(co2PM)
#Humidity Ratio
min(humidityRatioPM)
max(humidityRatioPM)

#Summary on Variables
summary(temperaturePM)
summary(humidityPM)
summary(lightPM)
summary(co2PM)
summary(humidityRatioPM)

#Standard Deviation
sd(lightPM)

#Histogram
hist(temperaturePM, main = "PM Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityPM, main = "PM Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightPM, main = "PM Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2PM, main = "PM CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioPM, main = "PM Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperaturePM ~ occupancyPMValue, main = "Temperature due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityPM ~ occupancyPMValue, main = "Humidity due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightPM ~ occupancyPMValue, main = "Light due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2PM ~ occupancyPMValue, main = "CO2 due to Occupancy: PM" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioPM ~ occupancyPMValue, main = "Humidity Ratio due to Occupancy: PM",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

pmDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													Light + CO2 + HumidityRatio, data = occupancyPM, method = "class")

prp(pmDecisionTree)

fancyRpartPlot(pmDecisionTree)
