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
dayAMTwo <- occupancyAMTwo$Day
timePeriodAMTwo <- occupancyAMTwo$TimePeriod
timeOfDayAMTwo <- occupancyAMTwo$TimeOfDay
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

#Scatter Plot
#install.packages("plotly")
#install.packages("ggplot2")
#install.packages("graphics")
#library(plotly)
#library(ggplot2)
#library(graphics)

sapply(occupancyAMTwo, "class")

#https://plot.ly/r/line-and-scatter/#line-and-scatter-plots-in-r
distinctColours <- RColorBrewer::brewer.pal(nlevels(occupancyAMTwo$Occupancy), "Set1")

#Day
plot_ly(data = occupancyAMTwo,x = dayAMTwo, y = temperatureAMTwo, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAMTwo,x = dayAMTwo, y = humidityAMTwo, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAMTwo,x = dayAMTwo, y = lightAMTwo, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = dayAM, y = humidityRatioAM, mode = "markers", color = Occupancy,
				colors = distinctColours)

sapply(occupancyAM, "class")

#Time of Day
plot_ly(data = occupancyAM,x = TimeOfDay, y = Temperature, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = TimeOfDay, y = Humidity, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = TimeOfDay, y = Light, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = TimeOfDay, y = HumidityRatio, mode = "markers", color = Occupancy,
				colors = distinctColours)

sapply(occupancyAM, "class")

#Time Period
plot_ly(data = occupancyAM,x = TimePeriod, y = Temperature, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = TimePeriod, y = Humidity, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = TimePeriod, y = Light, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = TimePeriod, y = HumidityRatio, mode = "markers", color = Occupancy,
				colors = distinctColours)

sapply(occupancyAM, "class")

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

#Scatter Plots
#Temperature
plot(temperatureAMTwo,humidityAMTwo, col = c("green","blue"))
abline(lm(humidityAMTwo ~ temperatureAMTwo), col = c("red"))

plot(temperatureAMTwo,lightAMTwo, col = c("green","blue"))
abline(lm(lightAMTwo ~ temperatureAMTwo), col = c("red"))

plot(temperatureAMTwo,co2AMTwo, col = c("green","blue"))
abline(lm(co2AMTwo ~ temperatureAMTwo), col = c("red"))

plot(temperatureAMTwo,humidityRatioAMTwo, col = c("green","blue"))
abline(lm(humidityRatioAMTwo ~ temperatureAMTwo), col = c("red"))

#Humidity
plot(humidityAMTwo,temperatureAMTwo, col = c("green","blue"))
abline(lm(temperatureAMTwo ~ humidityAMTwo), col = c("red"))

plot(humidityAMTwo,lightAMTwo, col = c("green","blue"))
abline(lm(lightAMTwo ~ humidityAMTwo), col = c("red"))

plot(humidityAMTwo,co2AMTwo, col = c("green","blue"))
abline(lm(co2AMTwo ~ humidityAMTwo), col = c("red"))

plot(humidityAMTwo,humidityRatioAMTwo, col = c("green","blue"))
abline(lm(humidityRatioAMTwo ~ humidityAMTwo), col = c("red"))

#Light
plot(lightAMTwo,temperatureAMTwo, col = c("green","blue"))
abline(lm(temperatureAMTwo ~ lightAMTwo), col = c("red"))

plot(lightAMTwo, humidityAMTwo, col = c("green","blue"))
abline(lm(humidityAMTwo ~ lightAMTwo), col = c("red"))

plot(lightAMTwo, co2AMTwo, col = c("green","blue"))
abline(lm(co2AMTwo ~ lightAMTwo), col = c("red"))

plot(lightAMTwo, humidityRatioAMTwo, col = c("green","blue"))
abline(lm(humidityRatioAMTwo ~ lightAMTwo), col = c("red"))

#CO2
plot(co2AMTwo,temperatureAMTwo, col = c("green","blue"))
abline(lm(temperatureAMTwo ~ co2AMTwo), col = c("red"))

plot(co2AMTwo, humidityAMTwo, col = c("green","blue"))
abline(lm(humidityAMTwo ~ co2AMTwo), col = c("red"))

plot(co2AMTwo, lightAMTwo, col = c("green","blue"))
abline(lm(lightAMTwo ~ co2AMTwo), col = c("red"))

plot(co2AMTwo, humidityRatioAMTwo, col = c("green","blue"))
abline(lm(humidityRatioAMTwo ~ co2AMTwo), col = c("red"))

