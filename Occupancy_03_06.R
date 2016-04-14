#Occupancy_03_06.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Attribute Value Variables
temperature03_06 <- occupancy03_06$Temperature
humidity03_06 <- occupancy03_06$Humidity
light03_06 <- occupancy03_06$Light
co203_06 <- occupancy03_06$CO2
humidityRatio03_06 <- occupancy03_06$HumidityRatio

#Summary on Variables
summary(temperature03_06)
summary(humidity03_06)
summary(light03_06)
summary(co203_06)
summary(humidityRatio03_06)

hist(temperature03_06, main = "03:00 - 05:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity03_06, main = "03:00 - 05:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light03_06, main = "03:00 - 05:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co203_06, main = "03:00 - 05:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio03_06, main = "03:00 - 05:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

