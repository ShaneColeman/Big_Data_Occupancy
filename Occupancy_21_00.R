#Occupancy_21_00.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
NineToTwelvePMTemperature <- count(occupancy21_00,"Temperature")
NineToTwelvePMHumidity <- count(occupancy21_00,"Humidity")
NineToTwelvePMLight <- count(occupancy21_00,"Light")
NineToTwelvePMCO2 <- count(occupancy21_00,"CO2")
NineToTwelvePMHumidityRatio <- count(occupancy21_00,"HumidityRatio")

#Attribute Value Variables
temperature21_00 <- occupancy21_00$Temperature
humidity21_00 <- occupancy21_00$Humidity
light21_00 <- occupancy21_00$Light
co221_00 <- occupancy21_00$CO2
humidityRatio21_00 <- occupancy21_00$HumidityRatio
occupancy21_00Value <- as.factor(occupancy21_00$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature21_00)
max(temperature21_00)
#Humidity
min(humidity21_00)
max(humidity21_00)
#Light
min(light21_00)
max(light21_00)
#CO2
min(co221_00)
max(co221_00)
#Humidity Ratio
min(humidityRatio21_00)
max(humidityRatio21_00)

#Summary on Variables
summary(temperature21_00)
summary(humidity21_00)
summary(light21_00)
summary(co221_00)
summary(humidityRatio21_00)

#Histogram
hist(temperature21_00, main = "21:00 - 23:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity21_00, main = "21:00 - 23:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light21_00, main = "21:00 - 23:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co221_00, main = "21:00 - 23:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio21_00, main = "21:00 - 23:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature21_00 ~ occupancy21_00Value, main = "Temperature due to Occupancy: \n21:00 - 23:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity21_00 ~ occupancy21_00Value, main = "Humidity due to Occupancy: \n21:00 - 23:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light21_00 ~ occupancy21_00Value, main = "Light due to Occupancy: \n21:00 - 23:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co221_00 ~ occupancy21_00Value, main = "CO2 due to Occupancy: \n21:00 - 23:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio21_00 ~ occupancy21_00Value, main = "Humidity Ratio due to Occupancy: \n21:00 - 23:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# nineToTwelvePMDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																Light + CO2 + HumidityRatio, data = occupancy21_00, 
# 																	method = "class")
# 
# prp(nineToTwelvePMDecisionTree)
# 
# fancyRpartPlot(nineToTwelvePMDecisionTree)
