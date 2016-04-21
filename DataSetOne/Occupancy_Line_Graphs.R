#Occupancy_Line_Graphs.R

occupancyLineGraph <- occupancyPreProcessed

head(occupancyLineGraph)

sapply(occupancyLineGraph, "class")

library(ggplot2)

#http://rstudio-pubs-static.s3.amazonaws.com/4311_4b1ab71799a44f1c9e4ae58e430d5881.html
ggplot(occupancyLineGraph, aes(x = TimeOfDay, y = Temperature, group = Occupancy, colour = Occupancy)) + 
	geom_line()
