#Occupancy_03_06_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
ThreeToSixAMTemperatureTwo <- count(occupancy03_06Two,"Temperature")
ThreeToSixAMHumidityTwo <- count(occupancy03_06Two,"Humidity")
ThreeToSixAMLightTwo <- count(occupancy03_06Two,"Light")
ThreeToSixAMCO2Two <- count(occupancy03_06Two,"CO2")
ThreeToSixAMHumidityRatioTwo <- count(occupancy03_06Two,"HumidityRatio")

#Attribute Value Variables
temperature03_06Two <- occupancy03_06Two$Temperature
humidity03_06Two <- occupancy03_06Two$Humidity
light03_06Two <- occupancy03_06Two$Light
co203_06Two <- occupancy03_06Two$CO2
humidityRatio03_06Two <- occupancy03_06Two$HumidityRatio
occupancy03_06ValueTwo <- as.factor(occupancy03_06Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature03_06Two)
max(temperature03_06Two)
#Humidity
min(humidity03_06Two)
max(humidity03_06Two)
#Light
min(light03_06Two)
max(light03_06Two)
#CO2
min(co203_06Two)
max(co203_06Two)
#Humidity Ratio
min(humidityRatio03_06Two)
max(humidityRatio03_06Two)

#Summary on Variables
summary(temperature03_06Two)
summary(humidity03_06Two)
summary(light03_06Two)
summary(co203_06Two)
summary(humidityRatio03_06Two)

#Histogram
hist(temperature03_06Two, main = "03:00 - 05:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity03_06Two, main = "03:00 - 05:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light03_06Two, main = "03:00 - 05:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co203_06Two, main = "03:00 - 05:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio03_06Two, main = "03:00 - 05:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature03_06Two ~ occupancy03_06ValueTwo, main = "Temperature due to Occupancy: \n03:00 - 05:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity00_03Two ~ occupancy03_06ValueTwo, main = "Humidity due to Occupancy: \n03:00 - 05:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light00_03Two ~ occupancy03_06ValueTwo, main = "Light due to Occupancy: \n03:00 - 05:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co200_03Two ~ occupancy03_06ValueTwo, main = "CO2 due to Occupancy: \n03:00 - 05:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio00_03Two ~ occupancy03_06ValueTwo, main = "Humidity Ratio due to Occupancy: \n03:00 - 05:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# threeToSixAMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																		 	Light + CO2 + HumidityRatio, data = occupancy03_06Two,
# 																				method = "class")
# 
# prp(threeToSixAMDecisionTreeTwo)
# 
# fancyRpartPlot(threeToSixAMDecisionTreeTwo)
