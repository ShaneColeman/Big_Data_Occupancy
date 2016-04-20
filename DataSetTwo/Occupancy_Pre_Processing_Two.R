#Occupancy_Pre_Processing_Two.R

occupancyFileTwo <- read.csv("DataSetTwo/Occupancy_Data_Set_Two.txt", header = TRUE, sep = ",", 
													stringsAsFactors = TRUE)

rownames(occupancyFileTwo) <- NULL

str(occupancyFileTwo)
sapply(occupancyFileTwo, class)

occupancyTwo <- occupancyFileTwo
head(occupancyTwo)
#View(occupancy)

occupancyTwo$Occupancy[occupancyTwo$Occupancy == 1] <- "Yes"
occupancyTwo$Occupancy[occupancyTwo$Occupancy == 0] <- "No"
sapply(occupancyTwo, class)
str(occupancyTwo)

occupancyTwo$Occupancy <- as.factor(occupancyTwo$Occupancy)
str(occupancyTwo)

occupancyTwo$date <- as.character(occupancyTwo$date)
str(occupancyTwo)

#http://stackoverflow.com/questions/16248861/split-1-column-into-2-columns-in-a-dataframe
listTwo <- strsplit(occupancyTwo$date, " ")

#install.packages("plyr")
#library(plyr)

dateTimeTwo <- ldply(listTwo)
colnames(dateTimeTwo) <- c("date","time")

occupancyTwo$date <- dateTimeTwo$date
occupancyTwo$time <- dateTimeTwo$time
colnames(occupancyTwo) <- c("Date", "Temperature", "Humidity", "Light", "CO2", "HumidityRatio",
												 "Occupancy", "Time")

#http://stackoverflow.com/questions/5620885/how-does-one-reorder-columns-in-r
occupancyAlteredTwo <- occupancyTwo[,c(1,8,2,3,4,5,6,7)]

str(occupancyAlteredTwo)

occupancyAlteredTwo$Date <- as.factor(occupancyAlteredTwo$Date)
#occupancyAltered$Date <- as.POSIXlt(occupancyAltered$Date,tz = "GMT")
str(occupancyAlteredTwo)

occupancyAlteredTwo$Time <- as.factor(occupancyAlteredTwo$Time)
str(occupancyAlteredTwo)

summary(occupancyAlteredTwo)
#View(occupancyAltered)

occupancyAlteredTwo$Day <- occupancyAlteredTwo$Date
occupancyAlteredTwo$Day <- as.numeric(occupancyAlteredTwo$Day)

occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 1] <- "Wednesday"
occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 2] <- "Thursday"
occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 3] <- "Friday"
occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 4] <- "Saturday"
occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 5] <- "Sunday"
occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 6] <- "Monday"
occupancyAlteredTwo$Day[occupancyAlteredTwo$Day == 7] <- "Tuesday"
str(occupancyAlteredTwo)

occupancyAlteredTwo$TimePeriod <- occupancyAlteredTwo$Time
occupancyAlteredTwo$TimePeriod <- as.factor(occupancyAlteredTwo$TimePeriod)
occupancyAlteredTwo$TimePeriod <- as.numeric(occupancyAlteredTwo$TimePeriod)
str(occupancyAlteredTwo)

occupancyAlteredTwo$TimePeriod[occupancyAlteredTwo$TimePeriod > 0 & occupancyAlteredTwo$TimePeriod < 721] <- "AM"
summary(occupancyAlteredTwo$TimePeriod == "AM")

#Tried setting the time period to greater than 722, did not work. Overwrote the AM 
occupancyAlteredTwo$TimePeriod[occupancyAlteredTwo$TimePeriod != "AM"] <- "PM"
summary(occupancyAlteredTwo$TimePeriod == "PM")

summary(occupancyAlteredTwo$TimePeriod)

occupancyAlteredTwo$TimeOfDay <- occupancyAlteredTwo$Time
occupancyAlteredTwo$TimeOfDay <- as.factor(occupancyAlteredTwo$TimeOfDay)
occupancyAlteredTwo$TimeOfDay <- as.numeric(occupancyAlteredTwo$TimeOfDay)
str(occupancyAlteredTwo$TimeOfDay)

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 1 & occupancyAlteredTwo$TimeOfDay < 181] <- "00:00 - 02:59"
summary(occupancyAlteredTwo$TimePeriod == "00:00 - 02:59")

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 181 & occupancyAlteredTwo$TimeOfDay < 361] <- "03:00 - 05:59"
summary(occupancyAlteredTwo$TimePeriod == "03:00 - 05:59")

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 361 & occupancyAlteredTwo$TimeOfDay < 541] <- "06:00 - 08:59"
summary(occupancyAlteredTwo$TimePeriod == "06:00 - 08:59")

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 541 & occupancyAlteredTwo$TimeOfDay < 721] <- "09:00 - 11:59"
summary(occupancyAlteredTwo$TimePeriod == "09:00 - 11:59")

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 721 & occupancyAlteredTwo$TimeOfDay < 901] <- "12:00 - 14:59"
summary(occupancyAlteredTwo$TimePeriod == "12:00 - 14:59")

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 901 & occupancyAlteredTwo$TimeOfDay <= 999] <- "15:00 - 17:59"
occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 1000 & occupancyAlteredTwo$TimeOfDay < 1081] <- "15:00 - 17:59"
summary(occupancyAlteredTwo$TimePeriod == "15:00 - 17:59")

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay >= 1261 & occupancyAlteredTwo$TimeOfDay < 1441] <- "21:00 - 23:59"

occupancyAlteredTwo$TimeOfDay[occupancyAlteredTwo$TimeOfDay != "00:00 - 02:59" & 
													 		occupancyAlteredTwo$TimeOfDay != "03:00 - 05:59" & 
													 		occupancyAlteredTwo$TimeOfDay != "06:00 - 08:59" &
													 		occupancyAlteredTwo$TimeOfDay != "09:00 - 11:59" &
													 		occupancyAlteredTwo$TimeOfDay != "12:00 - 14:59" &
													 		occupancyAlteredTwo$TimeOfDay != "15:00 - 17:59" &
													 		occupancyAlteredTwo$TimeOfDay != "21:00 - 23:59"] <- "18:00 - 20:59"

summary(occupancyAlteredTwo)

write.csv(occupancyAlteredTwo, file = "DataSetTwo/OccupancyAlteredTwo.csv", row.names = FALSE)

str(occupancyAlteredTwo)

occupancyAlteredTwo$Day <- as.factor(occupancyAlteredTwo$Day)
occupancyAlteredTwo$TimePeriod <- as.factor(occupancyAlteredTwo$TimePeriod)
occupancyAlteredTwo$TimeOfDay <- as.factor(occupancyAlteredTwo$TimeOfDay)
str(occupancyAlteredTwo)
summary(occupancyAlteredTwo)

occupancyPreProcessedTwo <- occupancyAlteredTwo[c(9,10,11,3:8)]
sapply(occupancyPreProcessedTwo, FUN = class)

occupancyWednesdayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Wednesday",]
occupancyThursdayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Thursday",]
occupancyFridayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Friday",]
occupancySaturdayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Saturday",]
occupancySundayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Sunday",]
occupancyMondayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Monday",]
occupancyTuesdayTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$Day == "Tuesday",]

occupancyAMTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimePeriod == "AM",]
occupancyPMTwo <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimePeriod == "PM",]

occupancy00_03Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "00:00 - 02:59",]
occupancy03_06Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "03:00 - 05:59",]
occupancy06_09Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "06:00 - 08:59",]
occupancy09_12Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "09:00 - 11:59",]
occupancy12_15Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "12:00 - 14:59",]
occupancy15_18Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "15:00 - 17:59",]
occupancy18_21Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "18:00 - 20:59",]
occupancy21_00Two <- occupancyPreProcessedTwo[occupancyPreProcessedTwo$TimeOfDay == "21:00 - 23:59",]

