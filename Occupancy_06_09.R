#Occupancy_06_09.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Attribute Value Variables
temperature06_09 <- occupancy06_09$Temperature
humidity06_09 <- occupancy06_09$Humidity
light06_09 <- occupancy06_09$Light
co206_09 <- occupancy06_09$CO2
humidityRatio06_09 <- occupancy06_09$HumidityRatio

#Summary on Variables
summary(temperature06_09)
summary(humidity06_09)
summary(light06_09)
summary(co206_09)
summary(humidityRatio06_09)

hist(temperature06_09, main = "06:00 - 08:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity06_09, main = "06:00 - 08:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light06_09, main = "06:00 - 08:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co206_09, main = "06:00 - 08:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio06_09, main = "06:00 - 08:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

