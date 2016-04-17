#Occupancy_09_12.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
NineToTwelveAMTemperature <- count(occupancy09_12,"Temperature")
NineToTwelveAMHumidity <- count(occupancy09_12,"Humidity")
NineToTwelveAMLight <- count(occupancy09_12,"Light")
NineToTwelveAMCO2 <- count(occupancy09_12,"CO2")
NineToTwelveAMHumidityRatio <- count(occupancy09_12,"HumidityRatio")

#Attribute Value Variables
temperature09_12 <- occupancy09_12$Temperature
humidity09_12 <- occupancy09_12$Humidity
light09_12 <- occupancy09_12$Light
co209_12 <- occupancy09_12$CO2
humidityRatio09_12 <- occupancy09_12$HumidityRatio
occupancy09_12Value <- as.factor(occupancy09_12$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature09_12)
max(temperature09_12)
#Humidity
min(humidity09_12)
max(humidity09_12)
#Light
min(light09_12)
max(light09_12)
#CO2
min(co209_12)
max(co209_12)
#Humidity Ratio
min(humidityRatio09_12)
max(humidityRatio09_12)

#Summary on Variables
summary(temperature09_12)
summary(humidity09_12)
summary(light09_12)
summary(co209_12)
summary(humidityRatio09_12)

#Histogram
hist(temperature09_12, main = "09:00 - 11:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity09_12, main = "09:00 - 11:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light09_12, main = "09:00 - 11:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co209_12, main = "09:00 - 11:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio09_12, main = "09:00 - 11:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature09_12 ~ occupancy09_12Value, main = "Temperature due to Occupancy: \n09:00 - 11:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity09_12 ~ occupancy09_12Value, main = "Humidity due to Occupancy: \n09:00 - 11:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light09_12 ~ occupancy09_12Value, main = "Light due to Occupancy: \n09:00 - 11:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co209_12 ~ occupancy09_12Value, main = "CO2 due to Occupancy: \n09:00 - 11:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio09_12 ~ occupancy09_12Value, main = "Humidity Ratio due to Occupancy: \n09:00 - 11:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# nineToTwelveAMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																 	Light + CO2 + HumidityRatio, data = occupancy09_12, 
# 																 		method = "class")
# 
# prp(nineToTwelveAMDecisionTree)
# 
# fancyRpartPlot(nineToTwelveAMDecisionTree)
