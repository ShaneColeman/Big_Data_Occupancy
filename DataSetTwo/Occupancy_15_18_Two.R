#Occupancy_15_18_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
ThreeToSixPMTemperatureTwo <- count(occupancy15_18Two,"Temperature")
ThreeToSixPMHumidityTwo <- count(occupancy15_18Two,"Humidity")
ThreeToSixPMLightTwo <- count(occupancy15_18Two,"Light")
ThreeToSixPMCO2Two <- count(occupancy15_18Two,"CO2")
ThreeToSixPMHumidityRatioTwo <- count(occupancy15_18Two,"HumidityRatio")

#Attribute Value Variables
temperature15_18Two <- occupancy15_18Two$Temperature
humidity15_18Two <- occupancy15_18Two$Humidity
light15_18Two <- occupancy15_18Two$Light
co215_18Two <- occupancy15_18Two$CO2
humidityRatio15_18Two <- occupancy15_18Two$HumidityRatio
occupancy15_18ValueTwo <- as.factor(occupancy15_18Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature15_18Two)
max(temperature15_18Two)
#Humidity
min(humidity15_18Two)
max(humidity15_18Two)
#Light
min(light15_18Two)
max(light15_18Two)
#CO2
min(co215_18Two)
max(co215_18Two)
#Humidity Ratio
min(humidityRatio15_18Two)
max(humidityRatio15_18Two)

#Summary on Variables
summary(temperature15_18Two)
summary(humidity15_18Two)
summary(light15_18Two)
summary(co215_18Two)
summary(humidityRatio15_18Two)

#Histogram
hist(temperature15_18Two, main = "15:00 - 17:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity15_18Two, main = "15:00 - 17:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light15_18Two, main = "15:00 - 17:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co215_18Two, main = "15:00 - 17:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio15_18Two, main = "15:00 - 17:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature15_18Two ~ occupancy15_18ValueTwo, main = "Temperature due to Occupancy: \n15:00 - 17:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity15_18Two ~ occupancy15_18ValueTwo, main = "Humidity due to Occupancy: \n15:00 - 17:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light15_18Two ~ occupancy15_18ValueTwo, main = "Light due to Occupancy: \n15:00 - 17:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co215_18Two ~ occupancy15_18ValueTwo, main = "CO2 due to Occupancy: \n15:00 - 17:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio15_18Two ~ occupancy15_18ValueTwo, main = "Humidity Ratio due to Occupancy: \n15:00 - 17:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

threeToSixPMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
															Light + CO2 + HumidityRatio, data = occupancy15_18Two,
																method = "class")

prp(threeToSixPMDecisionTreeTwo)

fancyRpartPlot(threeToSixPMDecisionTreeTwo)
