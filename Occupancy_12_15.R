#Occupancy_12_15.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TwelveToThreePMTemperature <- count(occupancy12_15,"Temperature")
TwelveToThreePMHumidity <- count(occupancy12_15,"Humidity")
TwelveToThreePMLight <- count(occupancy12_15,"Light")
TwelveToThreePMCO2 <- count(occupancy12_15,"CO2")
TwelveToThreePMHumidityRatio <- count(occupancy12_15,"HumidityRatio")

#Attribute Value Variables
temperature12_15 <- occupancy12_15$Temperature
humidity12_15 <- occupancy12_15$Humidity
light12_15 <- occupancy12_15$Light
co212_15 <- occupancy12_15$CO2
humidityRatio12_15 <- occupancy12_15$HumidityRatio
occupancy12_15Value <- as.factor(occupancy12_15$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature12_15)
max(temperature12_15)
#Humidity
min(humidity12_15)
max(humidity12_15)
#Light
min(light12_15)
max(light12_15)
#CO2
min(co212_15)
max(co212_15)
#Humidity Ratio
min(humidityRatio12_15)
max(humidityRatio12_15)

#Summary on Variables
summary(temperature12_15)
summary(humidity12_15)
summary(light12_15)
summary(co212_15)
summary(humidityRatio12_15)

#Histogram
hist(temperature12_15, main = "12:00 - 14:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity12_15, main = "12:00 - 14:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light12_15, main = "12:00 - 14:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co212_15, main = "12:00 - 14:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio12_15, main = "12:00 - 14:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature12_15 ~ occupancy12_15Value, main = "Temperature due to Occupancy: \n12:00 - 14:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity12_15 ~ occupancy12_15Value, main = "Humidity due to Occupancy: \n12:00 - 14:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light12_15 ~ occupancy12_15Value, main = "Light due to Occupancy: \n12:00 - 14:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co212_15 ~ occupancy12_15Value, main = "CO2 due to Occupancy: \n12:00 - 14:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio12_15 ~ occupancy12_15Value, main = "Humidity Ratio due to Occupancy: \n12:00 - 14:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# twelveToThreePMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																	Light + CO2 + HumidityRatio, data = occupancy12_15, 
# 																		method = "class")
# 
# prp(twelveToThreePMDecisionTree)
# 
# fancyRpartPlot(amDecisionTree)
