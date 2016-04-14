#Occupancy_Wednesday.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Attribute Value Variables
temperatureWednesday <- occupancyWednesday$Temperature
humidityWednesday <- occupancyWednesday$Humidity
lightWednesday <- occupancyWednesday$Light
co2Wednesday <- occupancyWednesday$CO2
humidityRatioWednesday <- occupancyWednesday$HumidityRatio

#Summary on Variables
summary(temperatureWednesday)
summary(humidityWednesday)
summary(lightWednesday)
summary(co2Wednesday)
summary(humidityRatioWednesday)

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
