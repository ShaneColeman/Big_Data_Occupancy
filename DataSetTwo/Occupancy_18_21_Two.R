#Occupancy_18_21_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
SixToNinePMTemperatureTwo <- count(occupancy18_21Two,"Temperature")
SixToNinePMHumidityTwo <- count(occupancy18_21Two,"Humidity")
SixToNinePMLightTwo <- count(occupancy18_21Two,"Light")
SixToNinePMCO2Two <- count(occupancy18_21Two,"CO2")
SixToNinePMHumidityRatioTwo <- count(occupancy18_21Two,"HumidityRatio")

#Attribute Value Variables
temperature18_21Two <- occupancy18_21Two$Temperature
humidity18_21Two <- occupancy18_21Two$Humidity
light18_21Two <- occupancy18_21Two$Light
co218_21Two <- occupancy18_21Two$CO2
humidityRatio18_21Two <- occupancy18_21Two$HumidityRatio
occupancy18_21ValueTwo <- as.factor(occupancy18_21Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature18_21Two)
max(temperature18_21Two)
#Humidity
min(humidity18_21Two)
max(humidity18_21Two)
#Light
min(light18_21Two)
max(light18_21Two)
#CO2
min(co218_21Two)
max(co218_21Two)
#Humidity Ratio
min(humidityRatio18_21Two)
max(humidityRatio18_21Two)

#Summary on Variables
summary(temperature18_21Two)
summary(humidity18_21Two)
summary(light18_21Two)
summary(co218_21Two)
summary(humidityRatio18_21Two)

#Histogram
hist(temperature18_21Two, main = "18:00 - 20:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity18_21Two, main = "18:00 - 20:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light18_21Two, main = "18:00 - 20:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co218_21Two, main = "18:00 - 20:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio18_21Two, main = "18:00 - 20:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature18_21Two ~ occupancy18_21ValueTwo, main = "Temperature due to Occupancy: \n18:00 - 20:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity18_21Two ~ occupancy18_21ValueTwo, main = "Humidity due to Occupancy: \n18:00 - 20:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light18_21Two ~ occupancy18_21ValueTwo, main = "Light due to Occupancy: \n18:00 - 20:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co218_21Two ~ occupancy18_21ValueTwo, main = "CO2 due to Occupancy: \n18:00 - 20:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio18_21Two ~ occupancy18_21ValueTwo, main = "Humidity Ratio due to Occupancy: \n18:00 - 20:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

sixToNinePMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													 		Light + CO2 + HumidityRatio, data = occupancy18_21Two,
																method = "class")

prp(sixToNinePMDecisionTreeTwo)

fancyRpartPlot(sixToNinePMDecisionTreeTwo)
