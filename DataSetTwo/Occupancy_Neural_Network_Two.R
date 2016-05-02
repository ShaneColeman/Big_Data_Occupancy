#Occupancy_Neural_Network_Two.R

#http://www.louisaslett.com/Courses/Data_Mining/ST4003-Lab5-Introduction_to_Neural_Networks.pdf
#http://stackoverflow.com/questions/10939591/predicting-class-for-new-data-using-neuralnet

#install.packages("neuralnet")
library(neuralnet)
library(dprep)
library(nnet)

occupancyNeuralNetworkTwo <- occupancyPreProcessedTwo
head(occupancyNeuralNetworkTwo)

print(8143 / 2) #4071.5
trainNeuralNetworkTwo <- occupancyNeuralNetworkTwo[1:4072,]
testNeuralNetworkTwo <- occupancyNeuralNetworkTwo[4073:8143,]

trainNeuralNetworkTwo$Occupancy <- class.ind(trainNeuralNetworkTwo$Occupancy)
head(trainNeuralNetworkTwo)

testNeuralNetworkTwo$Occupancy <- class.ind(testNeuralNetworkTwo$Occupancy)
head(testNeuralNetworkTwo)

nnetOccupancyTwo <- nnet(Occupancy ~., trainNeuralNetworkTwo, linout = FALSE, size = 8)

trainNeuralNetworkTwo[1:9] <- sapply(trainNeuralNetworkTwo[1:9], as.numeric)
#trainNeuralNetworkTwo[1:9] <- sapply(trainNeuralNetworkTwo[1:9], as.numeric)
sapply(trainNeuralNetworkTwo,"class")
head(trainNeuralNetworkTwo)

testNeuralNetworkTwo[1:9] <- sapply(testNeuralNetworkTwo[1:9], as.numeric)
#testNeuralNetworkTwo[1:9] <- sapply(testNeuralNetworkTwo[1:9], as.numeric)
sapply(testNeuralNetworkTwo,"class")
head(testNeuralNetworkTwo)

neuralNetOccupancyTwo <- neuralnet(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature +
																	Humidity + Light + CO2 + HumidityRatio, trainNeuralNetworkTwo, 
																hidden = 6, threshold = 0.01, linear.output = FALSE)

print(neuralNetOccupancyTwo)
plot(neuralNetOccupancyTwo)

neuralNetworkResultsTwo <- compute(neuralNetOccupancyTwo,testNeuralNetworkTwo[1:8])
neuralNetworkResultsTwo$net.result

occupancyOutputTwo <- cbind(testNeuralNetworkTwo[1:8], testNeuralNetworkTwo$Occupancy, 
												 as.data.frame(neuralNetworkResultsTwo$net.result))

sapply(occupancyOutputTwo, "class")

colnames(occupancyOutputTwo) <- c("Input 1 - Day", "Input 2 - Time Period", 
															 "Input 3 - Time Of Day", "Input 4 - Temperature",
															 "Input 5 - Humidity", "Input 6 - Light", "Input 7 - CO2",
															 "Input 8 - Humidity Ratio", "Expected Output", 
															 "Neural Network Output")
print(occupancyOutputTwo)
View(occupancyOutputTwo)


################################################################################################

#http://www.r-bloggers.com/using-neural-networks-for-credit-scoring-a-simple-example/
#http://gekkoquant.com/2012/05/26/neural-networks-with-r-simple-example/

#install.packages("neuralnet")
library(neuralnet)
library(dprep)

occupancyNeuralNetworkTwo <- occupancyPreProcessedTwo

sapply(occupancyNeuralNetworkTwo, "class")

occupancyNeuralNetworkTwo[1:9] <- sapply(occupancyNeuralNetworkTwo[1:9], as.numeric)
sapply(occupancyNeuralNetworkTwo, "class")
head(occupancyNeuralNetworkTwo)

print(8143 / 2)
trainNeuralNetworkTwo <- occupancyNeuralNetworkTwo[1:4072,]
testNeuralNetworkTwo <- occupancyNeuralNetworkTwo[4073:8143,]

# #1 - Occupied, 0 - Unoccupied
occupancyANNNormTwo <- mmnorm(occupancyNeuralNetworkTwo[1:9], minval = 0, maxval = 1)
head(occupancyANNNormTwo)
str(occupancyANNNormTwo)

occupancyANNNormTwo$Occupancy <- occupancyANNNormTwo$Occupancy
occupancyANNNormTwo$Occupancy2 <- occupancyANNNormTwo$Occupancy
head(occupancyANNNormTwo)

colnames(occupancyANNNormTwo) <- c("Day", "TimePeriod", "TimeOfDay", "Temperature",
																	 "Humidity", "Light", "CO2", "HumidityRatio",
																	 "OccupancyYes","OccupancyNo")
head(occupancyANNNormTwo)

occupancyANNNormTwo$OccupancyYes[occupancyANNNormTwo$OccupancyYes == 1] <- 0
occupancyANNNormTwo$OccupancyYes[occupancyANNNormTwo$OccupancyYes == 2] <- 1
occupancyANNNormTwo$OccupancyNo[occupancyANNNormTwo$OccupancyNo == 1] <- 1
occupancyANNNormTwo$OccupancyNo[occupancyANNNormTwo$OccupancyNo == 2] <- 0
head(occupancyANNNormTwo)
View(occupancyANNNormTwo)

occupancyNormalisedTwo <- occupancyANNNormTwo[1:10]
#names(occupancyNormalised) <- NULL
head(occupancyNormalisedTwo)

# inputsANN <- occupancyNormalised[1:8]
# names(inputsANN) <- NULL
# outputANN <- occupancyNormalised[9]
# names(outputANN) <- NULL
# 
# trainingData <- cbind(inputsANN,outputANN)
# colnames(trainingData) <- c("Inputs","Output")

occupancyANNTwo <- neuralnet(OccupancyYes ~ Day + TimePeriod + TimeOfDay + Temperature +
														 	Humidity + Light + CO2 + HumidityRatio, occupancyNormalisedTwo, 
														 hidden = 6, threshold = 0.01, linear.output = FALSE)
print(occupancyANN)

plot(occupancyANN, rep = "best")