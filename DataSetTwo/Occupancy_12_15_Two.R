#Occupancy_12_15_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TwelveToThreePMTemperatureTwo <- count(occupancy12_15Two,"Temperature")
TwelveToThreePMHumidityTwo <- count(occupancy12_15Two,"Humidity")
TwelveToThreePMLightTwo <- count(occupancy12_15Two,"Light")
TwelveToThreePMCO2Two <- count(occupancy12_15Two,"CO2")
TwelveToThreePMHumidityRatioTwo <- count(occupancy12_15Two,"HumidityRatio")

#Attribute Value Variables
temperature12_15Two <- occupancy12_15Two$Temperature
humidity12_15Two <- occupancy12_15Two$Humidity
light12_15Two <- occupancy12_15Two$Light
co212_15Two <- occupancy12_15Two$CO2
humidityRatio12_15Two <- occupancy12_15Two$HumidityRatio
occupancy12_15ValueTwo <- as.factor(occupancy12_15Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature12_15Two)
max(temperature12_15Two)
#Humidity
min(humidity12_15Two)
max(humidity12_15Two)
#Light
min(light12_15Two)
max(light12_15Two)
#CO2
min(co212_15Two)
max(co212_15Two)
#Humidity Ratio
min(humidityRatio12_15Two)
max(humidityRatio12_15Two)

#Summary on Variables
summary(temperature12_15Two)
summary(humidity12_15Two)
summary(light12_15Two)
summary(co212_15Two)
summary(humidityRatio12_15Two)

#Histogram
hist(temperature12_15Two, main = "12:00 - 14:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity12_15Two, main = "12:00 - 14:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light12_15Two, main = "12:00 - 14:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co212_15Two, main = "12:00 - 14:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio12_15Two, main = "12:00 - 14:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature12_15Two ~ occupancy12_15ValueTwo, main = "Temperature due to Occupancy: \n12:00 - 14:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity12_15Two ~ occupancy12_15ValueTwo, main = "Humidity due to Occupancy: \n12:00 - 14:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light12_15Two ~ occupancy12_15ValueTwo, main = "Light due to Occupancy: \n12:00 - 14:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co212_15Two ~ occupancy12_15ValueTwo, main = "CO2 due to Occupancy: \n12:00 - 14:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio12_15Two ~ occupancy12_15ValueTwo, main = "Humidity Ratio due to Occupancy: \n12:00 - 14:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

twelveToThreePMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
																	Light + CO2 + HumidityRatio, data = occupancy12_15Two,
																		method = "class")

prp(twelveToThreePMDecisionTreeTwo)

fancyRpartPlot(twelveToThreePMDecisionTreeTwo)
