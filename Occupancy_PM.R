#Occupancy_PM.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Attribute Value Variables
temperaturePM <- occupancyPM$Temperature
humidityPM <- occupancyPM$Humidity
lightPM <- occupancyPM$Light
co2PM <- occupancyPM$CO2
humidityRatioPM <- occupancyPM$HumidityRatio

#Summary on Variables
summary(temperaturePM)
summary(humidityPM)
summary(lightPM)
summary(co2PM)
summary(humidityRatioPM)

#Standard Deviation
sd(lightPM)

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

