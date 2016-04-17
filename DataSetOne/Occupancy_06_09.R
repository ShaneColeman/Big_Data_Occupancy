#Occupancy_06_09.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
SixToNineAMTemperature <- count(occupancy06_09,"Temperature")
SixToNineAMHumidity <- count(occupancy06_09,"Humidity")
SixToNineAMLight <- count(occupancy06_09,"Light")
SixToNineAMCO2 <- count(occupancy06_09,"CO2")
SixToNineAMHumidityRatio <- count(occupancy06_09,"HumidityRatio")

#Attribute Value Variables
temperature06_09 <- occupancy06_09$Temperature
humidity06_09 <- occupancy06_09$Humidity
light06_09 <- occupancy06_09$Light
co206_09 <- occupancy06_09$CO2
humidityRatio06_09 <- occupancy06_09$HumidityRatio
occupancy06_09Value <- as.factor(occupancy06_09$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature06_09)
max(temperature06_09)
#Humidity
min(humidity06_09)
max(humidity06_09)
#Light
min(light06_09)
max(light06_09)
#CO2
min(co206_09)
max(co206_09)
#Humidity Ratio
min(humidityRatio06_09)
max(humidityRatio06_09)

#Summary on Variables
summary(temperature06_09)
summary(humidity06_09)
summary(light06_09)
summary(co206_09)
summary(humidityRatio06_09)

#Histogram
hist(temperature06_09, main = "06:00 - 08:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity06_09, main = "06:00 - 08:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light06_09, main = "06:00 - 08:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co206_09, main = "06:00 - 08:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio06_09, main = "06:00 - 08:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature06_09 ~ occupancy06_09Value, main = "Temperature due to Occupancy: \n06:00 - 08:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity06_09 ~ occupancy06_09Value, main = "Humidity due to Occupancy: \n06:00 - 08:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light06_09 ~ occupancy06_09Value, main = "Light due to Occupancy: \n06:00 - 08:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co206_09 ~ occupancy06_09Value, main = "CO2 due to Occupancy: \n06:00 - 08:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio06_09 ~ occupancy06_09Value, main = "Humidity Ratio due to Occupancy: \n06:00 - 08:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# sixToNineAMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																		Light + CO2 + HumidityRatio, data = occupancy06_09, 
# 																 			method = "class")
# 
# prp(sixToNineAMDecisionTree)
# 
# fancyRpartPlot(sixToNineAMDecisionTree)

