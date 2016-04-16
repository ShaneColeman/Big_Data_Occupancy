#Occupancy_00_03.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TwelveToThreeAMTemperature <- count(occupancy00_03,"Temperature")
TwelveToThreeAMHumidity <- count(occupancy00_03,"Humidity")
TwelveToThreeAMLight <- count(occupancy00_03,"Light")
TwelveToThreeAMCO2 <- count(occupancy00_03,"CO2")
TwelveToThreeAMHumidityRatio <- count(occupancy00_03,"HumidityRatio")

#Attribute Value Variables
temperature00_03 <- occupancy00_03$Temperature
humidity00_03 <- occupancy00_03$Humidity
light00_03 <- occupancy00_03$Light
co200_03 <- occupancy00_03$CO2
humidityRatio00_03 <- occupancy00_03$HumidityRatio
occupancy00_03Value <- as.factor(occupancy00_03$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature00_03)
max(temperature00_03)
#Humidity
min(humidity00_03)
max(humidity00_03)
#Light
min(light00_03)
max(light00_03)
#CO2
min(co200_03)
max(co200_03)
#Humidity Ratio
min(humidityRatio00_03)
max(humidityRatio00_03)

#Summary on Variables
summary(temperature00_03)
summary(humidity00_03)
summary(light00_03)
summary(co200_03)
summary(humidityRatio00_03)

#Histogram
hist(temperature00_03, main = "00:00 - 02:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity00_03, main = "00:00 - 02:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light00_03, main = "00:00 - 02:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co200_03, main = "00:00 - 02:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio00_03, main = "00:00 - 02:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature00_03 ~ occupancy00_03Value, main = "Temperature due to Occupancy: \n00:00 - 02:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity00_03 ~ occupancy00_03Value, main = "Humidity due to Occupancy: \n00:00 - 02:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light00_03 ~ occupancy00_03Value, main = "Light due to Occupancy: \n00:00 - 02:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co200_03 ~ occupancy00_03Value, main = "CO2 due to Occupancy: \n00:00 - 02:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio00_03 ~ occupancy00_03Value, main = "Humidity Ratio due to Occupancy: \n00:00 - 02:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# twelveToThreeAMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																		 	Light + CO2 + HumidityRatio, data = occupancy00_03, 
# 																		 		method = "class")
# 
# prp(twelveToThreeAMDecisionTree)
# 
# fancyRpartPlot(twelveToThreeAMDecisionTree)
