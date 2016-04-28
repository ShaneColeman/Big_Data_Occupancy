#Occupancy_Pre_Processing_Analysis_Two.R

occupancyAnalysisTwo <- occupancyPreProcessedTwo
head(occupancyAnalysisTwo)
sapply(occupancyAnalysisTwo, "class")

#Setting Colour
#colourAnalysis <- c(1:3,4:7)

# library(ggplot2)
# 
# #http://rstudio-pubs-static.s3.amazonaws.com/4311_4b1ab71799a44f1c9e4ae58e430d5881.html
# ggplot(occupancyAnalysis, aes(x = TimeOfDay, y = Temperature, group = Occupancy, colour = Occupancy)) +
# 	geom_line()

#http://www.r-bloggers.com/color-palettes-in-r/
#Plot Day
plot(x = occupancyAnalysisTwo$Day, y = occupancyAnalysisTwo$Temperature,
		 xlab = "Day", ylab = "Temperature", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$Day, y = occupancyAnalysisTwo$Humidity,
		 xlab = "Day", ylab = "Humidity", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$Day, y = occupancyAnalysisTwo$Light,
		 xlab = "Day", ylab = "Light", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$Day, y = occupancyAnalysisTwo$CO2,
		 xlab = "Day", ylab = "CO2", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$Day, y = occupancyAnalysisTwo$HumidityRatio,
		 xlab = "Day", ylab = "Humidity Ratio", col = heat.colors(12), pch = 1, cex = 0.5)


#Plot Time Period
plot(x = occupancyAnalysisTwo$TimePeriod, y = occupancyAnalysisTwo$Temperature,
		 xlab = "Time Period", ylab = "Temperature", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimePeriod, y = occupancyAnalysisTwo$Humidity,
		 xlab = "Time Period", ylab = "Humidity", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimePeriod, y = occupancyAnalysisTwo$Light,
		 xlab = "Time Period", ylab = "Light", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimePeriod, y = occupancyAnalysisTwo$CO2,
		 xlab = "Time Period", ylab = "CO2", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimePeriod, y = occupancyAnalysisTwo$HumidityRatio,
		 xlab = "Time Period", ylab = "Humidity Ratio", col = heat.colors(12), pch = 1, cex = 0.5)


#Plot Time of Day
plot(x = occupancyAnalysisTwo$TimeOfDay, y = occupancyAnalysisTwo$Temperature,
		 xlab = "Time of Day", ylab = "Temperature", col = heat.colors(12), 
		 pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimeOfDay, y = occupancyAnalysisTwo$Humidity,
		 xlab = "Time of Day", ylab = "Humidity", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimeOfDay, y = occupancyAnalysisTwo$Light,
		 xlab = "Time of Day", ylab = "Light", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimeOfDay, y = occupancyAnalysisTwo$CO2,
		 xlab = "Time of Day", ylab = "CO2", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysisTwo$TimeOfDay, y = occupancyAnalysisTwo$HumidityRatio,
		 xlab = "Time of Day", ylab = "Humidity Ratio", col = heat.colors(12), pch = 1, cex = 0.5)

