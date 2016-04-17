#Occupancy_03_06.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
ThreeToSixAMTemperature <- count(occupancy03_06,"Temperature")
ThreeToSixAMHumidity <- count(occupancy03_06,"Humidity")
ThreeToSixAMLight <- count(occupancy03_06,"Light")
ThreeToSixAMCO2 <- count(occupancy03_06,"CO2")
ThreeToSixAMHumidityRatio <- count(occupancy03_06,"HumidityRatio")

#Attribute Value Variables
temperature03_06 <- occupancy03_06$Temperature
humidity03_06 <- occupancy03_06$Humidity
light03_06 <- occupancy03_06$Light
co203_06 <- occupancy03_06$CO2
humidityRatio03_06 <- occupancy03_06$HumidityRatio
occupancy03_06Value <- as.factor(occupancy03_06$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature03_06)
max(temperature03_06)
#Humidity
min(humidity03_06)
max(humidity03_06)
#Light
min(light03_06)
max(light03_06)
#CO2
min(co203_06)
max(co203_06)
#Humidity Ratio
min(humidityRatio03_06)
max(humidityRatio03_06)

#Summary on Variables
summary(temperature03_06)
summary(humidity03_06)
summary(light03_06)
summary(co203_06)
summary(humidityRatio03_06)

#Histogram
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

#Box Plot
boxplot(temperature03_06 ~ occupancy03_06Value, main = "Temperature due to Occupancy: \n03:00 - 05:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity00_03 ~ occupancy03_06Value, main = "Humidity due to Occupancy: \n03:00 - 05:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light00_03 ~ occupancy03_06Value, main = "Light due to Occupancy: \n03:00 - 05:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co200_03 ~ occupancy03_06Value, main = "CO2 due to Occupancy: \n03:00 - 05:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio00_03 ~ occupancy03_06Value, main = "Humidity Ratio due to Occupancy: \n03:00 - 05:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# threeToSixAMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																		 	Light + CO2 + HumidityRatio, data = occupancy03_06,
# 																				method = "class")
# 
# prp(threeToSixAMDecisionTree)
# 
# fancyRpartPlot(threeToSixAMDecisionTree)
