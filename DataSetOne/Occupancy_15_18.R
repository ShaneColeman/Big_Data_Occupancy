#Occupancy_15_18.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
ThreeToSixPMTemperature <- count(occupancy15_18,"Temperature")
ThreeToSixPMHumidity <- count(occupancy15_18,"Humidity")
ThreeToSixPMLight <- count(occupancy15_18,"Light")
ThreeToSixPMCO2 <- count(occupancy15_18,"CO2")
ThreeToSixPMHumidityRatio <- count(occupancy15_18,"HumidityRatio")

#Attribute Value Variables
temperature15_18 <- occupancy15_18$Temperature
humidity15_18 <- occupancy15_18$Humidity
light15_18 <- occupancy15_18$Light
co215_18 <- occupancy15_18$CO2
humidityRatio15_18 <- occupancy15_18$HumidityRatio
occupancy15_18Value <- as.factor(occupancy15_18$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature15_18)
max(temperature15_18)
#Humidity
min(humidity15_18)
max(humidity15_18)
#Light
min(light15_18)
max(light15_18)
#CO2
min(co215_18)
max(co215_18)
#Humidity Ratio
min(humidityRatio15_18)
max(humidityRatio15_18)

#Summary on Variables
summary(temperature15_18)
summary(humidity15_18)
summary(light15_18)
summary(co215_18)
summary(humidityRatio15_18)

#Histogram
hist(temperature15_18, main = "15:00 - 17:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity15_18, main = "15:00 - 17:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light15_18, main = "15:00 - 17:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co215_18, main = "15:00 - 17:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio15_18, main = "15:00 - 17:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature15_18 ~ occupancy15_18Value, main = "Temperature due to Occupancy: \n15:00 - 17:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity15_18 ~ occupancy15_18Value, main = "Humidity due to Occupancy: \n15:00 - 17:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light15_18 ~ occupancy15_18Value, main = "Light due to Occupancy: \n15:00 - 17:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co215_18 ~ occupancy15_18Value, main = "CO2 due to Occupancy: \n15:00 - 17:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio15_18 ~ occupancy15_18Value, main = "Humidity Ratio due to Occupancy: \n15:00 - 17:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# threeToSixPMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 															Light + CO2 + HumidityRatio, data = occupancy15_18, 
# 																method = "class")
# 
# prp(threeToSixPMDecisionTree)
# 
# fancyRpartPlot(threeToSixPMDecisionTree)
