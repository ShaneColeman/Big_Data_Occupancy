#Occupancy_Pre_Processing.R

occupancyFile <- read.csv("DataSetOne/Occupancy_Data_Set.txt", header = TRUE, sep = ",", 
													stringsAsFactors = TRUE)

rownames(occupancyFile) <- NULL

str(occupancyFile)
sapply(occupancyFile, class)

occupancy <- occupancyFile
head(occupancy)
#View(occupancy)

occupancy$Occupancy[occupancy$Occupancy == 1] <- "Yes"
occupancy$Occupancy[occupancy$Occupancy == 0] <- "No"
sapply(occupancy, class)
str(occupancy)

occupancy$Occupancy <- as.factor(occupancy$Occupancy)
str(occupancy)

occupancy$date <- as.character(occupancy$date)
str(occupancy)

#http://stackoverflow.com/questions/16248861/split-1-column-into-2-columns-in-a-dataframe
list <- strsplit(occupancy$date, " ")

#install.packages("plyr")
#library(plyr)

dateTime <- ldply(list)
colnames(dateTime) <- c("date","time")

occupancy$date <- dateTime$date
occupancy$time <- dateTime$time
colnames(occupancy) <- c("Date", "Temperature", "Humidity", "Light", "CO2", "HumidityRatio",
												 "Occupancy", "Time")

#http://stackoverflow.com/questions/5620885/how-does-one-reorder-columns-in-r
occupancyAltered <- occupancy[,c(1,8,2,3,4,5,6,7)]

str(occupancyAltered)

occupancyAltered$Date <- as.factor(occupancyAltered$Date)
#occupancyAltered$Date <- as.POSIXlt(occupancyAltered$Date,tz = "GMT")
str(occupancyAltered)

occupancyAltered$Time <- as.factor(occupancyAltered$Time)
str(occupancyAltered)

summary(occupancyAltered)
#View(occupancyAltered)

occupancyAltered$Day <- occupancyAltered$Date
occupancyAltered$Day <- as.numeric(occupancyAltered$Day)

occupancyAltered$Day[occupancyAltered$Day == 1] <- "Monday"
occupancyAltered$Day[occupancyAltered$Day == 2] <- "Tuesday"
occupancyAltered$Day[occupancyAltered$Day == 3] <- "Wednesday"
str(occupancyAltered)

occupancyAltered$TimePeriod <- occupancyAltered$Time
occupancyAltered$TimePeriod <- as.numeric(occupancyAltered$TimePeriod)
str(occupancyAltered)

occupancyAltered$TimePeriod[occupancyAltered$TimePeriod > 0 & occupancyAltered$TimePeriod < 721] <- "AM"
summary(occupancyAltered$TimePeriod == "AM")

#Tried setting the time period to greater than 722, did not work. Overwrote the AM 
occupancyAltered$TimePeriod[occupancyAltered$TimePeriod != "AM"] <- "PM"
summary(occupancyAltered$TimePeriod == "PM")

summary(occupancyAltered$TimePeriod)

occupancyAltered$TimeOfDay <- occupancyAltered$Time
occupancyAltered$TimeOfDay <- as.numeric(occupancyAltered$TimeOfDay)
str(occupancyAltered$TimeOfDay)

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 1 & occupancyAltered$TimeOfDay < 181] <- "00:00 - 02:59"
summary(occupancyAltered$TimePeriod == "00:00 - 02:59")

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 181 & occupancyAltered$TimeOfDay < 361] <- "03:00 - 05:59"
summary(occupancyAltered$TimePeriod == "03:00 - 05:59")

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 361 & occupancyAltered$TimeOfDay < 541] <- "06:00 - 08:59"
summary(occupancyAltered$TimePeriod == "06:00 - 08:59")

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 541 & occupancyAltered$TimeOfDay < 721] <- "09:00 - 11:59"
summary(occupancyAltered$TimePeriod == "09:00 - 11:59")

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 721 & occupancyAltered$TimeOfDay < 901] <- "12:00 - 14:59"
summary(occupancyAltered$TimePeriod == "12:00 - 14:59")

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 901 & occupancyAltered$TimeOfDay <= 999] <- "15:00 - 17:59"
occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 1000 & occupancyAltered$TimeOfDay < 1081] <- "15:00 - 17:59"
summary(occupancyAltered$TimePeriod == "15:00 - 17:59")

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay >= 1261 & occupancyAltered$TimeOfDay < 1441] <- "21:00 - 23:59"

occupancyAltered$TimeOfDay[occupancyAltered$TimeOfDay != "00:00 - 02:59" & 
													 	occupancyAltered$TimeOfDay != "03:00 - 05:59" & 
													 	occupancyAltered$TimeOfDay != "06:00 - 08:59" &
													 	occupancyAltered$TimeOfDay != "09:00 - 11:59" &
													 	occupancyAltered$TimeOfDay != "12:00 - 14:59" &
													 	occupancyAltered$TimeOfDay != "15:00 - 17:59" &
													 	occupancyAltered$TimeOfDay != "21:00 - 23:59"] <- "18:00 - 20:59"

summary(occupancyAltered)

write.csv(occupancyAltered, file = "DataSetOne/OccupancyAltered.csv", row.names = FALSE)

str(occupancyAltered)

occupancyAltered$Day <- as.factor(occupancyAltered$Day)
occupancyAltered$TimePeriod <- as.factor(occupancyAltered$TimePeriod)
occupancyAltered$TimeOfDay <- as.factor(occupancyAltered$TimeOfDay)
str(occupancyAltered)
summary(occupancyAltered)

occupancyPreProcessed <- occupancyAltered[c(9,10,11,3:8)]
sapply(occupancyPreProcessed, FUN = class)

occupancyMonday <- occupancyPreProcessed[occupancyPreProcessed$Day == "Monday",]
occupancyTuesday <- occupancyPreProcessed[occupancyPreProcessed$Day == "Tuesday",]
occupancyWednesday <- occupancyPreProcessed[occupancyPreProcessed$Day == "Wednesday",]

occupancyAM <- occupancyPreProcessed[occupancyPreProcessed$TimePeriod == "AM",]
occupancyPM <- occupancyPreProcessed[occupancyPreProcessed$TimePeriod == "PM",]

occupancy00_03 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "00:00 - 02:59",]
occupancy03_06 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "03:00 - 05:59",]
occupancy06_09 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "06:00 - 08:59",]
occupancy09_12 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "09:00 - 11:59",]
occupancy12_15 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "12:00 - 14:59",]
occupancy15_18 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "15:00 - 17:59",]
occupancy18_21 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "18:00 - 20:59",]
occupancy21_00 <- occupancyPreProcessed[occupancyPreProcessed$TimeOfDay == "21:00 - 23:59",]

