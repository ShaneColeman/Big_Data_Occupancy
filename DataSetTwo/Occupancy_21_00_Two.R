#Occupancy_21_00_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
NineToTwelvePMTemperatureTwo <- count(occupancy21_00Two,"Temperature")
NineToTwelvePMHumidityTwo <- count(occupancy21_00Two,"Humidity")
NineToTwelvePMLightTwo <- count(occupancy21_00Two,"Light")
NineToTwelvePMCO2Two <- count(occupancy21_00Two,"CO2")
NineToTwelvePMHumidityRatioTwo <- count(occupancy21_00Two,"HumidityRatio")

#Attribute Value Variables
temperature21_00Two <- occupancy21_00Two$Temperature
humidity21_00Two <- occupancy21_00Two$Humidity
light21_00Two <- occupancy21_00Two$Light
co221_00Two <- occupancy21_00Two$CO2
humidityRatio21_00Two <- occupancy21_00Two$HumidityRatio
occupancy21_00ValueTwo <- as.factor(occupancy21_00Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature21_00Two)
max(temperature21_00Two)
#Humidity
min(humidity21_00Two)
max(humidity21_00Two)
#Light
min(light21_00Two)
max(light21_00Two)
#CO2
min(co221_00Two)
max(co221_00Two)
#Humidity Ratio
min(humidityRatio21_00Two)
max(humidityRatio21_00Two)

#Summary on Variables
summary(temperature21_00Two)
summary(humidity21_00Two)
summary(light21_00Two)
summary(co221_00Two)
summary(humidityRatio21_00Two)

#Histogram
hist(temperature21_00Two, main = "21:00 - 23:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity21_00Two, main = "21:00 - 23:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light21_00Two, main = "21:00 - 23:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co221_00Two, main = "21:00 - 23:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio21_00Two, main = "21:00 - 23:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature21_00Two ~ occupancy21_00ValueTwo, main = "Temperature due to Occupancy: \n21:00 - 23:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity21_00Two ~ occupancy21_00ValueTwo, main = "Humidity due to Occupancy: \n21:00 - 23:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light21_00Two ~ occupancy21_00ValueTwo, main = "Light due to Occupancy: \n21:00 - 23:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co221_00Two ~ occupancy21_00ValueTwo, main = "CO2 due to Occupancy: \n21:00 - 23:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio21_00Two ~ occupancy21_00ValueTwo, main = "Humidity Ratio due to Occupancy: \n21:00 - 23:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# nineToTwelvePMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																Light + CO2 + HumidityRatio, data = occupancy21_00Two,
# 																	method = "class")
# 
# prp(nineToTwelvePMDecisionTreeTwo)
# 
# fancyRpartPlot(nineToTwelvePMDecisionTreeTwo)
