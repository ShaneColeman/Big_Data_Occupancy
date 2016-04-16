#Occupancy_18_21.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
SixToNinePMTemperature <- count(occupancy18_21,"Temperature")
SixToNinePMHumidity <- count(occupancy18_21,"Humidity")
SixToNinePMLight <- count(occupancy18_21,"Light")
SixToNinePMCO2 <- count(occupancy18_21,"CO2")
SixToNinePMHumidityRatio <- count(occupancy18_21,"HumidityRatio")

#Attribute Value Variables
temperature18_21 <- occupancy18_21$Temperature
humidity18_21 <- occupancy18_21$Humidity
light18_21 <- occupancy18_21$Light
co218_21 <- occupancy18_21$CO2
humidityRatio18_21 <- occupancy18_21$HumidityRatio
occupancy18_21Value <- as.factor(occupancy18_21$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature18_21)
max(temperature18_21)
#Humidity
min(humidity18_21)
max(humidity18_21)
#Light
min(light18_21)
max(light18_21)
#CO2
min(co218_21)
max(co218_21)
#Humidity Ratio
min(humidityRatio18_21)
max(humidityRatio18_21)

#Summary on Variables
summary(temperature18_21)
summary(humidity18_21)
summary(light18_21)
summary(co218_21)
summary(humidityRatio18_21)

#Histogram
hist(temperature18_21, main = "18:00 - 20:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity18_21, main = "18:00 - 20:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light18_21, main = "18:00 - 20:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co218_21, main = "18:00 - 20:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio18_21, main = "18:00 - 20:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature18_21 ~ occupancy18_21Value, main = "Temperature due to Occupancy: \n18:00 - 20:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity18_21 ~ occupancy18_21Value, main = "Humidity due to Occupancy: \n18:00 - 20:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light18_21 ~ occupancy18_21Value, main = "Light due to Occupancy: \n18:00 - 20:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co218_21 ~ occupancy18_21Value, main = "CO2 due to Occupancy: \n18:00 - 20:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio18_21 ~ occupancy18_21Value, main = "Humidity Ratio due to Occupancy: \n18:00 - 20:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# sixToNinePMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 													 		Light + CO2 + HumidityRatio, data = occupancy18_21, 
# 																method = "class")
# 
# prp(sixToNinePMDecisionTree)
# 
# fancyRpartPlot(sixToNinePMDecisionTree)
