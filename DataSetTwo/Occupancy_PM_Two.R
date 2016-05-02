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
dayPMTwo <- occupancyPMTwo$Day
timePeriodPMTwo <- occupancyPMTwo$TimePeriod
timeOfDayPMTwo <- occupancyPMTwo$TimeOfDay
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

#Scatter Plot
#install.packages("plotly")
#install.packages("ggplot2")
#install.packages("graphics")
#library(plotly)
#library(ggplot2)
#library(graphics)

sapply(occupancyAM, "class")

#https://plot.ly/r/line-and-scatter/#line-and-scatter-plots-in-r
distinctColours <- RColorBrewer::brewer.pal(nlevels(occupancyAM$Occupancy), "Set1")

#Day
plot_ly(data = occupancyPM,x = dayPM, y = temperaturePM, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = dayPM, y = humidityPM, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = dayPM, y = lightPM, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = dayPM, y = humidityRatioPM, mode = "markers", color = Occupancy,
				colors = distinctColours)

sapply(occupancyPM, "class")

#Time of Day
plot_ly(data = occupancyPM,x = TimeOfDay, y = Temperature, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = TimeOfDay, y = Humidity, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = TimeOfDay, y = Light, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = TimeOfDay, y = HumidityRatio, mode = "markers", color = Occupancy,
				colors = distinctColours)

sapply(occupancyPM, "class")

#Time Period
plot_ly(data = occupancyPM,x = TimePeriod, y = Temperature, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = TimePeriod, y = Humidity, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = TimePeriod, y = Light, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyPM,x = TimePeriod, y = HumidityRatio, mode = "markers", color = Occupancy,
				colors = distinctColours)

sapply(occupancyPM, "class")

#Temperature
# plot_ly(data = occupancyAM,x = temperatureAM, y = humidityAM, mode = "markers", color = Occupancy,
# 						colors = distinctColours)
# m <- line(humidityAM ~ temperatureAM)
# add_trace(y = fitted(m))
# 
# plot_ly(data = occupancyAM,x = Temperature, y = CO2, mode = "markers", color = Occupancy,
# 						colors = distinctColours)
# 
# plot_ly(data = occupancyAM,x = Temperature, y = HumidityRatio, mode = "markers", color = Occupancy,
# 						colors = distinctColours)

#Scatter Plot Amended
#Temperature
plot(temperaturePMTwo,humidityPMTwo, col = c("green","blue"))
abline(lm(humidityPMTwo ~ temperaturePMTwo), col = c("red"))

plot(temperaturePMTwo,lightPMTwo, col = c("green","blue"))
abline(lm(lightPMTwo ~ temperaturePMTwo), col = c("red"))

plot(temperaturePMTwo,co2PMTwo, col = c("green","blue"))
abline(lm(co2PMTwo ~ temperaturePMTwo), col = c("red"))

plot(temperaturePMTwo,humidityRatioPMTwo, col = c("green","blue"))
abline(lm(humidityRatioPMTwo ~ temperaturePMTwo), col = c("red"))

#Humidity
plot(humidityPMTwo,temperaturePMTwo, col = c("green","blue"))
abline(lm(temperaturePMTwo ~ humidityPMTwo), col = c("red"))

plot(humidityPMTwo,lightPMTwo, col = c("green","blue"))
abline(lm(lightPMTwo ~ humidityPMTwo), col = c("red"))

plot(humidityPMTwo,co2PMTwo, col = c("green","blue"))
abline(lm(co2PMTwo ~ humidityPMTwo), col = c("red"))

plot(humidityPMTwo,humidityRatioPMTwo, col = c("green","blue"))
abline(lm(humidityRatioPMTwo ~ humidityPMTwo), col = c("red"))

#Light
plot(lightPMTwo,temperaturePMTwo, col = c("green","blue"))
abline(lm(temperaturePMTwo ~ lightPMTwo), col = c("red"))

plot(lightPMTwo, humidityPMTwo, col = c("green","blue"))
abline(lm(humidityPMTwo ~ lightPMTwo), col = c("red"))

plot(lightPMTwo, co2PMTwo, col = c("green","blue"))
abline(lm(co2PMTwo ~ lightPMTwo), col = c("red"))

plot(lightPMTwo, humidityRatioPMTwo, col = c("green","blue"))
abline(lm(humidityRatioPMTwo ~ lightPMTwo), col = c("red"))

#CO2
plot(co2PMTwo,temperaturePMTwo, col = c("green","blue"))
abline(lm(temperaturePMTwo ~ co2PMTwo), col = c("red"))

plot(co2PMTwo, humidityPMTwo, col = c("green","blue"))
abline(lm(humidityPMTwo ~ co2PMTwo), col = c("red"))

plot(co2PMTwo, lightPMTwo, col = c("green","blue"))
abline(lm(lightPMTwo ~ co2PMTwo), col = c("red"))

plot(co2PMTwo, humidityRatioPMTwo, col = c("green","blue"))
abline(lm(humidityRatioPMTwo ~ co2PMTwo), col = c("red"))
