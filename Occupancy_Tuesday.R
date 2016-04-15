#Occupancy_Tuesday.R

library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TuesdayTemperature <- count(occupancyTuesday,"Temperature")
TuesdayHumidity <- count(occupancyTuesday,"Humidity")
TuesdayLight <- count(occupancyTuesday,"Light")
TuesdayCO2 <- count(occupancyTuesday,"CO2")
TuesdayHumidityRatio <- count(occupancyTuesday,"HumidityRatio")

#Attribute Value Variables
temperatureTuesday <- occupancyTuesday$Temperature
humidityTuesday <- occupancyTuesday$Humidity
lightTuesday <- occupancyTuesday$Light
co2Tuesday <- occupancyTuesday$CO2
humidityRatioTuesday <- occupancyTuesday$HumidityRatio

#Summary on Variables
summary(temperatureTuesday)
summary(humidityTuesday)
summary(lightTuesday)
summary(co2Tuesday)
summary(humidityRatioTuesday)

hist(temperatureTuesday, main = "Tuesday's Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityTuesday, main = "Tuesday's Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightTuesday, main = "Tuesday's Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2Tuesday, main = "Tuesday's CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioTuesday, main = "Tuesday's Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)
