#Occupancy_Monday_Histogram.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Attribute Value Variables
temperatureMonday <- occupancyMonday$Temperature
humidityMonday <- occupancyMonday$Humidity
lightMonday <- occupancyMonday$Light
co2Monday <- occupancyMonday$CO2
humidityRatioMonday <- occupancyMonday$HumidityRatio

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
