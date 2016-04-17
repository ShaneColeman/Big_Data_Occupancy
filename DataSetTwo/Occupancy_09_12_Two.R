#Occupancy_09_12_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
NineToTwelveAMTemperatureTwo <- count(occupancy09_12Two,"Temperature")
NineToTwelveAMHumidityTwo <- count(occupancy09_12Two,"Humidity")
NineToTwelveAMLightTwo <- count(occupancy09_12Two,"Light")
NineToTwelveAMCO2Two <- count(occupancy09_12Two,"CO2")
NineToTwelveAMHumidityRatioTwo <- count(occupancy09_12Two,"HumidityRatio")

#Attribute Value Variables
temperature09_12Two <- occupancy09_12Two$Temperature
humidity09_12Two <- occupancy09_12Two$Humidity
light09_12Two <- occupancy09_12Two$Light
co209_12Two <- occupancy09_12Two$CO2
humidityRatio09_12Two <- occupancy09_12Two$HumidityRatio
occupancy09_12ValueTwo <- as.factor(occupancy09_12Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature09_12Two)
max(temperature09_12Two)
#Humidity
min(humidity09_12Two)
max(humidity09_12Two)
#Light
min(light09_12Two)
max(light09_12Two)
#CO2
min(co209_12Two)
max(co209_12Two)
#Humidity Ratio
min(humidityRatio09_12Two)
max(humidityRatio09_12Two)

#Summary on Variables
summary(temperature09_12Two)
summary(humidity09_12Two)
summary(light09_12Two)
summary(co209_12Two)
summary(humidityRatio09_12Two)

#Histogram
hist(temperature09_12Two, main = "09:00 - 11:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity09_12Two, main = "09:00 - 11:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light09_12Two, main = "09:00 - 11:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co209_12Two, main = "09:00 - 11:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio09_12Two, main = "09:00 - 11:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature09_12Two ~ occupancy09_12ValueTwo, main = "Temperature due to Occupancy: \n09:00 - 11:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity09_12Two ~ occupancy09_12ValueTwo, main = "Humidity due to Occupancy: \n09:00 - 11:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light09_12Two ~ occupancy09_12ValueTwo, main = "Light due to Occupancy: \n09:00 - 11:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co209_12Two ~ occupancy09_12ValueTwo, main = "CO2 due to Occupancy: \n09:00 - 11:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio09_12Two ~ occupancy09_12ValueTwo, main = "Humidity Ratio due to Occupancy: \n09:00 - 11:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

nineToTwelveAMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
																 	Light + CO2 + HumidityRatio, data = occupancy09_12Two,
																 		method = "class")

prp(nineToTwelveAMDecisionTreeTwo)

fancyRpartPlot(nineToTwelveAMDecisionTreeTwo)
