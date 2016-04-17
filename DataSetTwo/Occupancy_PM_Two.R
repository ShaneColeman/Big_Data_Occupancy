#Occupancy_PM_Two.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
PMTemperatureTwo <- count(occupancyPMTwo,"Temperature")
PMHumidityTwo <- count(occupancyPMTwo,"Humidity")
PMLightTwo <- count(occupancyPMTwo,"Light")
PMCO2Two <- count(occupancyPMTwo,"CO2")
PMHumidityRatioTwo <- count(occupancyPMTwo,"HumidityRatio")

#Attribute Value Variables
temperaturePMTwo <- occupancyPMTwo$Temperature
humidityPMTwo <- occupancyPMTwo$Humidity
lightPMTwo <- occupancyPMTwo$Light
co2PMTwo <- occupancyPMTwo$CO2
humidityRatioPMTwo <- occupancyPMTwo$HumidityRatio
occupancyPMValueTwo <- as.factor(occupancyPMTwo$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperaturePMTwo)
max(temperaturePMTwo)
#Humidity
min(humidityPMTwo)
max(humidityPMTwo)
#Light
min(lightPMTwo)
max(lightPMTwo)
#CO2
min(co2PMTwo)
max(co2PMTwo)
#Humidity Ratio
min(humidityRatioPMTwo)
max(humidityRatioPMTwo)

#Summary on Variables
summary(temperaturePMTwo)
summary(humidityPMTwo)
summary(lightPMTwo)
summary(co2PMTwo)
summary(humidityRatioPMTwo)

#Standard Deviation
sd(lightPMTwo)

#Histogram
hist(temperaturePMTwo, main = "PM Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityPMTwo, main = "PM Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightPMTwo, main = "PM Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2PMTwo, main = "PM CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioPMTwo, main = "PM Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperaturePMTwo ~ occupancyPMValueTwo, main = "Temperature due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityPMTwo ~ occupancyPMValueTwo, main = "Humidity due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightPMTwo ~ occupancyPMValueTwo, main = "Light due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2PMTwo ~ occupancyPMValueTwo, main = "CO2 due to Occupancy: PM" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioPMTwo ~ occupancyPMValueTwo, main = "Humidity Ratio due to Occupancy: PM",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

pmDecisionTreeTwo <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													Light + CO2 + HumidityRatio, data = occupancyPMTwo, method = "class")

prp(pmDecisionTreeTwo)

fancyRpartPlot(pmDecisionTreeTwo)
