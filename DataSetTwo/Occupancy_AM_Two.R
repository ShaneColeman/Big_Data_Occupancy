#Occupancy_AM_Two.R

#Count Function
#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
AMTemperatureTwo <- count(occupancyAMTwo,"Temperature")
AMHumidityTwo <- count(occupancyAMTwo,"Humidity")
AMLightTwo <- count(occupancyAMTwo,"Light")
AMCO2Two <- count(occupancyAMTwo,"CO2")
AMHumidityRatioTwo <- count(occupancyAMTwo,"HumidityRatio")

#Attribute Value Variables
temperatureAMTwo <- occupancyAMTwo$Temperature
humidityAMTwo <- occupancyAMTwo$Humidity
lightAMTwo <- occupancyAMTwo$Light
co2AMTwo <- occupancyAMTwo$CO2
humidityRatioAMTwo <- occupancyAMTwo$HumidityRatio
occupancyAMValueTwo <- as.factor(occupancyAMTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureAMTwo)
max(temperatureAMTwo)
#Humidity
min(humidityAMTwo)
max(humidityAMTwo)
#Light
min(lightAMTwo)
max(lightAMTwo)
#CO2
min(co2AMTwo)
max(co2AMTwo)
#Humidity Ratio
min(humidityRatioAMTwo)
max(humidityRatioAMTwo)

#Summary on Variables
summary(temperatureAMTwo)
summary(humidityAMTwo)
summary(lightAMTwo)
summary(co2AMTwo)
summary(humidityRatioAMTwo)

#Standard Deviation
sd(lightAMTwo)

#Histogram
hist(temperatureAMTwo, main = "AM Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityAMTwo, main = "AM Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightAMTwo, main = "AM Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2AMTwo, main = "AM CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioAMTwo, main = "AM Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureAMTwo ~ occupancyAMValueTwo, main = "Temperature due to Occupancy: AM", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityAMTwo ~ occupancyAMValueTwo, main = "Humidity due to Occupancy: AM", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightAMTwo ~ occupancyAMValueTwo, main = "Light due to Occupancy: AM", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2AMTwo ~ occupancyAMValueTwo, main = "CO2 due to Occupancy: AM" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioAMTwo ~ occupancyAMValueTwo, main = "Humidity Ratio due to Occupancy: AM",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

amDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													Light + CO2 + HumidityRatio, data = occupancyAMTwo, method = "class")

prp(amDecisionTreeTwo)

fancyRpartPlot(amDecisionTreeTwo)
