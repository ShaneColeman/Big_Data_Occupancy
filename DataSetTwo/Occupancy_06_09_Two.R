#Occupancy_06_09_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
SixToNineAMTemperatureTwo <- count(occupancy06_09Two,"Temperature")
SixToNineAMHumidityTwo <- count(occupancy06_09Two,"Humidity")
SixToNineAMLightTwo <- count(occupancy06_09Two,"Light")
SixToNineAMCO2Two <- count(occupancy06_09Two,"CO2")
SixToNineAMHumidityRatioTwo <- count(occupancy06_09Two,"HumidityRatio")

#Attribute Value Variables
temperature06_09Two <- occupancy06_09Two$Temperature
humidity06_09Two <- occupancy06_09Two$Humidity
light06_09Two <- occupancy06_09Two$Light
co206_09Two <- occupancy06_09Two$CO2
humidityRatio06_09Two <- occupancy06_09Two$HumidityRatio
occupancy06_09ValueTwo <- as.factor(occupancy06_09Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature06_09Two)
max(temperature06_09Two)
#Humidity
min(humidity06_09Two)
max(humidity06_09Two)
#Light
min(light06_09Two)
max(light06_09Two)
#CO2
min(co206_09Two)
max(co206_09Two)
#Humidity Ratio
min(humidityRatio06_09Two)
max(humidityRatio06_09Two)

#Summary on Variables
summary(temperature06_09Two)
summary(humidity06_09Two)
summary(light06_09Two)
summary(co206_09Two)
summary(humidityRatio06_09Two)

#Histogram
hist(temperature06_09Two, main = "06:00 - 08:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity06_09Two, main = "06:00 - 08:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light06_09Two, main = "06:00 - 08:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co206_09Two, main = "06:00 - 08:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio06_09Two, main = "06:00 - 08:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature06_09Two ~ occupancy06_09ValueTwo, main = "Temperature due to Occupancy: \n06:00 - 08:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity06_09Two ~ occupancy06_09ValueTwo, main = "Humidity due to Occupancy: \n06:00 - 08:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light06_09Two ~ occupancy06_09ValueTwo, main = "Light due to Occupancy: \n06:00 - 08:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co206_09Two ~ occupancy06_09ValueTwo, main = "CO2 due to Occupancy: \n06:00 - 08:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio06_09Two ~ occupancy06_09ValueTwo, main = "Humidity Ratio due to Occupancy: \n06:00 - 08:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

sixToNineAMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
																		Light + CO2 + HumidityRatio, data = occupancy06_09Two,
																 			method = "class")

prp(sixToNineAMDecisionTreeTwo)

fancyRpartPlot(sixToNineAMDecisionTreeTwo)

