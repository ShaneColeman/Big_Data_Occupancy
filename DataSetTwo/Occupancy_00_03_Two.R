#Occupancy_00_03_Two.R

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
TwelveToThreeAMTemperatureTwo <- count(occupancy00_03Two,"Temperature")
TwelveToThreeAMHumidityTwo <- count(occupancy00_03Two,"Humidity")
TwelveToThreeAMLightTwo <- count(occupancy00_03Two,"Light")
TwelveToThreeAMCO2Two <- count(occupancy00_03Two,"CO2")
TwelveToThreeAMHumidityRatioTwo <- count(occupancy00_03Two,"HumidityRatio")

#Attribute Value Variables
temperature00_03Two <- occupancy00_03Two$Temperature
humidity00_03Two <- occupancy00_03Two$Humidity
light00_03Two <- occupancy00_03Two$Light
co200_03Two <- occupancy00_03Two$CO2
humidityRatio00_03Two <- occupancy00_03Two$HumidityRatio
occupancy00_03ValueTwo <- as.factor(occupancy00_03Two$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperature00_03Two)
max(temperature00_03Two)
#Humidity
min(humidity00_03Two)
max(humidity00_03Two)
#Light
min(light00_03Two)
max(light00_03Two)
#CO2
min(co200_03Two)
max(co200_03Two)
#Humidity Ratio
min(humidityRatio00_03Two)
max(humidityRatio00_03Two)

#Summary on Variables
summary(temperature00_03Two)
summary(humidity00_03Two)
summary(light00_03Two)
summary(co200_03Two)
summary(humidityRatio00_03Two)

#Histogram
hist(temperature00_03Two, main = "00:00 - 02:59 Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidity00_03Two, main = "00:00 - 02:59 Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(light00_03Two, main = "00:00 - 02:59 Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co200_03Two, main = "00:00 - 02:59 CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatio00_03Two, main = "00:00 - 02:59 Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperature00_03Two ~ occupancy00_03ValueTwo, main = "Temperature due to Occupancy: \n00:00 - 02:59", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidity00_03Two ~ occupancy00_03ValueTwo, main = "Humidity due to Occupancy: \n00:00 - 02:59", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(light00_03Two ~ occupancy00_03ValueTwo, main = "Light due to Occupancy: \n00:00 - 02:59", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co200_03Two ~ occupancy00_03ValueTwo, main = "CO2 due to Occupancy: \n00:00 - 02:59" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatio00_03Two ~ occupancy00_03ValueTwo, main = "Humidity Ratio due to Occupancy: \n00:00 - 02:59",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

# twelveToThreeAMDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
# 																		 	Light + CO2 + HumidityRatio, data = occupancy00_03Two,
# 																		 		method = "class")
# 
# prp(twelveToThreeAMDecisionTreeTwo)
# 
# fancyRpartPlot(twelveToThreeAMDecisionTreeTwo)
