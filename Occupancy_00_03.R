#Occupancy_00_03.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Attribute Value Variables
temperature00_03 <- occupancy00_03$Temperature
humidity00_03 <- occupancy00_03$Humidity
light00_03 <- occupancy00_03$Light
co200_03 <- occupancy00_03$CO2
humidityRatio00_03 <- occupancy00_03$HumidityRatio

#Summary on Variables
summary(temperature00_03)
summary(humidity00_03)
summary(light00_03)
summary(co200_03)
summary(humidityRatio00_03)

hist(temperature00_03, main = "00:00 - 02:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity00_03, main = "00:00 - 02:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light00_03, main = "00:00 - 02:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co200_03, main = "00:00 - 02:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio00_03, main = "00:00 - 02:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

