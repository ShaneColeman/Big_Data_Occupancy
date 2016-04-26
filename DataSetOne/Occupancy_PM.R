#Occupancy_PM.R

#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
PMTemperature <- count(occupancyPM,"Temperature")
PMHumidity <- count(occupancyPM,"Humidity")
PMLight <- count(occupancyPM,"Light")
PMCO2 <- count(occupancyPM,"CO2")
PMHumidityRatio <- count(occupancyPM,"HumidityRatio")

#Attribute Value Variables
dayPM <- occupancyPM$Day
timePeriodPM <- occupancyPM$TimePeriod
timeOfDayPM <- occupancyPM$TimeOfDay
temperaturePM <- occupancyPM$Temperature
humidityPM <- occupancyPM$Humidity
lightPM <- occupancyPM$Light
co2PM <- occupancyPM$CO2
humidityRatioPM <- occupancyPM$HumidityRatio
occupancyPMValue <- as.factor(occupancyPM$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperaturePM)
max(temperaturePM)
#Humidity
min(humidityPM)
max(humidityPM)
#Light
min(lightPM)
max(lightPM)
#CO2
min(co2PM)
max(co2PM)
#Humidity Ratio
min(humidityRatioPM)
max(humidityRatioPM)

#Summary on Variables
summary(temperaturePM)
summary(humidityPM)
summary(lightPM)
summary(co2PM)
summary(humidityRatioPM)

#Standard Deviation
sd(lightPM)

#Histogram
hist(temperaturePM, main = "PM Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityPM, main = "PM Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightPM, main = "PM Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2PM, main = "PM CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioPM, main = "PM Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperaturePM ~ occupancyPMValue, main = "Temperature due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityPM ~ occupancyPMValue, main = "Humidity due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightPM ~ occupancyPMValue, main = "Light due to Occupancy: PM", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2PM ~ occupancyPMValue, main = "CO2 due to Occupancy: PM" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioPM ~ occupancyPMValue, main = "Humidity Ratio due to Occupancy: PM",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

pmDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													Light + CO2 + HumidityRatio, data = occupancyPM, method = "class")

prp(pmDecisionTree)

fancyRpartPlot(pmDecisionTree)


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
plot(temperaturePM,humidityPM, col = c("green","blue"))
abline(lm(humidityPM ~ temperaturePM), col = c("red"))

plot(temperaturePM,lightPM, col = c("green","blue"))
abline(lm(lightPM ~ temperaturePM), col = c("red"))

plot(temperaturePM,co2PM, col = c("green","blue"))
abline(lm(co2PM ~ temperaturePM), col = c("red"))

plot(temperaturePM,humidityRatioPM, col = c("green","blue"))
abline(lm(humidityRatioPM ~ temperaturePM), col = c("red"))

#Humidity
plot(humidityPM,temperaturePM, col = c("green","blue"))
abline(lm(temperaturePM ~ humidityPM), col = c("red"))

plot(humidityPM,lightPM, col = c("green","blue"))
abline(lm(lightPM ~ humidityPM), col = c("red"))

plot(humidityPM,co2PM, col = c("green","blue"))
abline(lm(co2PM ~ humidityPM), col = c("red"))

plot(humidityPM,humidityRatioPM, col = c("green","blue"))
abline(lm(humidityRatioPM ~ humidityPM), col = c("red"))

#Light
plot(lightPM,temperaturePM, col = c("green","blue"))
abline(lm(temperaturePM ~ lightPM), col = c("red"))

plot(lightPM, humidityPM, col = c("green","blue"))
abline(lm(humidityPM ~ lightPM), col = c("red"))

plot(lightPM, co2PM, col = c("green","blue"))
abline(lm(co2PM ~ lightPM), col = c("red"))

plot(lightPM, humidityRatioPM, col = c("green","blue"))
abline(lm(humidityRatioPM ~ lightPM), col = c("red"))

#CO2
plot(co2PM,temperaturePM, col = c("green","blue"))
abline(lm(temperaturePM ~ co2PM), col = c("red"))

plot(co2PM, humidityPM, col = c("green","blue"))
abline(lm(humidityPM ~ co2PM), col = c("red"))

plot(co2PM, lightPM, col = c("green","blue"))
abline(lm(lightPM ~ co2PM), col = c("red"))

plot(co2PM, humidityRatioPM, col = c("green","blue"))
abline(lm(humidityRatioPM ~ co2PM), col = c("red"))
