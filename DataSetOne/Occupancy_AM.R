#Occupancy_AM.R

#Count Function
#library(plyr)

#Setting Histogram Colour
colourHist <- c(1:3,4:7)

#Count Attributes
AMTemperature <- count(occupancyAM,"Temperature")
AMHumidity <- count(occupancyAM,"Humidity")
AMLight <- count(occupancyAM,"Light")
AMCO2 <- count(occupancyAM,"CO2")
AMHumidityRatio <- count(occupancyAM,"HumidityRatio")

#Attribute Value Variables
dayAM <- occupancyAM$Day
timePeriodAM <- occupancyAM$TimePeriod
timeOfDayAM <- occupancyAM$TimeOfDay
temperatureAM <- occupancyAM$Temperature
humidityAM <- occupancyAM$Humidity
lightAM <- occupancyAM$Light
co2AM <- occupancyAM$CO2
humidityRatioAM <- occupancyAM$HumidityRatio
occupancyAMValue <- as.factor(occupancyAM$Occupancy)

#Minimum - Maximum Attribute Values
#Temperature
min(temperatureAM)
max(temperatureAM)
#Humidity
min(humidityAM)
max(humidityAM)
#Light
min(lightAM)
max(lightAM)
#CO2
min(co2AM)
max(co2AM)
#Humidity Ratio
min(humidityRatioAM)
max(humidityRatioAM)

#Summary on Variables
summary(temperatureAM)
summary(humidityAM)
summary(lightAM)
summary(co2AM)
summary(humidityRatioAM)

#Standard Deviation
sd(lightAM)

#Histogram
hist(temperatureAM, main = "AM Temperature Range", xlab = "Temperature", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityAM, main = "AM Humidity Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(lightAM, main = "AM Light Range", xlab = "Light", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(co2AM, main = "AM CO2 Range", xlab = "CO2", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

hist(humidityRatioAM, main = "AM Humidity Ratio Range", xlab = "Humidity", 
		 ylab = "Frequency", col = colourHist, breaks = 5)

#Box Plot
boxplot(temperatureAM ~ occupancyAMValue, main = "Temperature due to Occupancy: AM", 
				xlab = "Occupied", ylab = "Temperature", cex = 0, col = c("green","yellow"))

boxplot(humidityAM ~ occupancyAMValue, main = "Humidity due to Occupancy: AM", 
				xlab = "Occupied", ylab = "Humidity", cex = 0, col = c("green","yellow"))

boxplot(lightAM ~ occupancyAMValue, main = "Light due to Occupancy: AM", 
				xlab = "Occupied", ylab = "Light",cex = 0, col = c("green","yellow"))

boxplot(co2AM ~ occupancyAMValue, main = "CO2 due to Occupancy: AM" ,
				xlab = "Occupied", ylab = "CO2", cex = 0, col = c("green","yellow"))

boxplot(humidityRatioAM ~ occupancyAMValue, main = "Humidity Ratio due to Occupancy: AM",
				xlab = "Occupied", ylab = "Humidity Ratio",cex = 0, col = c("green","yellow"))

#Decision Tree
#library(rpart)
#library(rattle)
#library(rpart.plot)
#library(RColorBrewer)

amDecisionTree <- rpart(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature + Humidity +
													Light + CO2 + HumidityRatio, data = occupancyAM, method = "class")

prp(amDecisionTree)

fancyRpartPlot(amDecisionTree)


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
plot_ly(data = occupancyAM,x = dayAM, y = temperatureAM, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = dayAM, y = humidityAM, mode = "markers", color = Occupancy,
				colors = distinctColours)

plot_ly(data = occupancyAM,x = dayAM, y = lightAM, mode = "markers", color = Occupancy,
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

#Scatter Plot Amended
#Temperature
plot(temperatureAM,humidityAM, col = c("green","blue"))
abline(lm(humidityAM ~ temperatureAM), col = c("red"))

plot(temperatureAM,lightAM, col = c("green","blue"))
abline(lm(lightAM ~ temperatureAM), col = c("red"))

plot(temperatureAM,co2AM, col = c("green","blue"))
abline(lm(co2AM ~ temperatureAM), col = c("red"))

plot(temperatureAM,humidityRatioAM, col = c("green","blue"))
abline(lm(humidityRatioAM ~ temperatureAM), col = c("red"))

#Humidity
plot(humidityAM,temperatureAM, col = c("green","blue"))
abline(lm(temperatureAM ~ humidityAM), col = c("red"))

plot(humidityAM,lightAM, col = c("green","blue"))
abline(lm(lightAM ~ humidityAM), col = c("red"))

plot(humidityAM,co2AM, col = c("green","blue"))
abline(lm(co2AM ~ humidityAM), col = c("red"))

plot(humidityAM,humidityRatioAM, col = c("green","blue"))
abline(lm(humidityRatioAM ~ humidityAM), col = c("red"))

#Light
plot(lightAM,temperatureAM, col = c("green","blue"))
abline(lm(temperatureAM ~ lightAM), col = c("red"))

plot(lightAM, humidityAM, col = c("green","blue"))
abline(lm(humidityAM ~ lightAM), col = c("red"))

plot(lightAM, co2AM, col = c("green","blue"))
abline(lm(co2AM ~ lightAM), col = c("red"))

plot(lightAM, humidityRatioAM, col = c("green","blue"))
abline(lm(humidityRatioAM ~ lightAM), col = c("red"))

#CO2
plot(co2AM,temperatureAM, col = c("green","blue"))
abline(lm(temperatureAM ~ co2AM), col = c("red"))

plot(co2AM, humidityAM, col = c("green","blue"))
abline(lm(humidityAM ~ co2AM), col = c("red"))

plot(co2AM, lightAM, col = c("green","blue"))
abline(lm(lightAM ~ co2AM), col = c("red"))

plot(co2AM, humidityRatioAM, col = c("green","blue"))
abline(lm(humidityRatioAM ~ co2AM), col = c("red"))
