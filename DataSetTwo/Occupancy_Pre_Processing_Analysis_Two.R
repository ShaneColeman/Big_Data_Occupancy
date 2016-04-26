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

plot(x = occupancyAnalysis$Day, y = occupancyAnalysis$Humidity,
		 xlab = "Day", ylab = "Humidity", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$Day, y = occupancyAnalysis$Light,
		 xlab = "Day", ylab = "Light", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$Day, y = occupancyAnalysis$CO2,
		 xlab = "Day", ylab = "CO2", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$Day, y = occupancyAnalysis$HumidityRatio,
		 xlab = "Day", ylab = "Humidity Ratio", col = heat.colors(12), pch = 1, cex = 0.5)


#Plot Time Period
plot(x = occupancyAnalysis$TimePeriod, y = occupancyAnalysis$Temperature,
		 xlab = "Time Period", ylab = "Temperature", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimePeriod, y = occupancyAnalysis$Humidity,
		 xlab = "Time Period", ylab = "Humidity", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimePeriod, y = occupancyAnalysis$Light,
		 xlab = "Time Period", ylab = "Light", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimePeriod, y = occupancyAnalysis$CO2,
		 xlab = "Time Period", ylab = "CO2", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimePeriod, y = occupancyAnalysis$HumidityRatio,
		 xlab = "Time Period", ylab = "Humidity Ratio", col = heat.colors(12), pch = 1, cex = 0.5)


#Plot Time of Day
plot(x = occupancyAnalysis$TimeOfDay, y = occupancyAnalysis$Temperature,
		 xlab = "Time of Day", ylab = "Temperature", col = heat.colors(12), 
		 pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimeOfDay, y = occupancyAnalysis$Humidity,
		 xlab = "Time of Day", ylab = "Humidity", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimeOfDay, y = occupancyAnalysis$Light,
		 xlab = "Time of Day", ylab = "Light", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimeOfDay, y = occupancyAnalysis$CO2,
		 xlab = "Time of Day", ylab = "CO2", col = heat.colors(12), pch = 1, cex = 0.5)

plot(x = occupancyAnalysis$TimeOfDay, y = occupancyAnalysis$HumidityRatio,
		 xlab = "Time of Day", ylab = "Humidity Ratio", col = heat.colors(12), pch = 1, cex = 0.5)

