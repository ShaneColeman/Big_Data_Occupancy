#Occupancy_Neural_Network.R
#http://www.r-bloggers.com/using-neural-networks-for-credit-scoring-a-simple-example/
#http://gekkoquant.com/2012/05/26/neural-networks-with-r-simple-example/

install.packages("neuralnet")
library(neuralnet)
library(dprep)

occupancyNeuralNetwork <- occupancyPreProcessed

sapply(occupancyNeuralNetwork, "class")

occupancyNeuralNetwork[1:9] <- sapply(occupancyNeuralNetwork[1:9], as.numeric)
sapply(occupancyNeuralNetwork, "class")
head(occupancyNeuralNetwork)

print(2665 / 2)
trainNeuralNetwork <- occupancyNeuralNetwork[1:1333,]
testNeuralNetwork <- occupancyNeuralNetwork[1334:2665,]

# #1 - Occupied, 0 - Unoccupied
occupancyANNNorm <- mmnorm(occupancyNeuralNetwork[1:9], minval = 0, maxval = 1)
head(occupancyANNNorm)
str(occupancyANNNorm)

occupancyANNNorm$Occupancy <- occupancyANNNorm$Occupancy
occupancyANNNorm$Occupancy2 <- occupancyANNNorm$Occupancy
head(occupancyANNNorm)

colnames(occupancyANNNorm) <- c("Day", "TimePeriod", "TimeOfDay", "Temperature",
																			"Humidity", "Light", "CO2", "HumidityRatio",
																			"OccupancyYes","OccupancyNo")
head(occupancyANNNorm)

occupancyANNNorm$OccupancyYes[occupancyANNNorm$OccupancyYes == 1] <- 0
occupancyANNNorm$OccupancyYes[occupancyANNNorm$OccupancyYes == 2] <- 1
occupancyANNNorm$OccupancyNo[occupancyANNNorm$OccupancyNo == 1] <- 1
occupancyANNNorm$OccupancyNo[occupancyANNNorm$OccupancyNo == 2] <- 0
head(occupancyANNNorm)

occupancyNormalised <- occupancyANNNorm[1:10]
#names(occupancyNormalised) <- NULL
head(occupancyNormalised)

# inputsANN <- occupancyNormalised[1:8]
# names(inputsANN) <- NULL
# outputANN <- occupancyNormalised[9]
# names(outputANN) <- NULL
# 
# trainingData <- cbind(inputsANN,outputANN)
# colnames(trainingData) <- c("Inputs","Output")

occupancyANN <- neuralnet(OccupancyYes ~ Day + TimePeriod + TimeOfDay + Temperature +
														Humidity + Light + CO2 + HumidityRatio, occupancyNormalised, 
															hidden = 6, threshold = 0.01, linear.output = FALSE)
print(occupancyANN)

plot(occupancyANN, rep = "best")

###############

#http://www.louisaslett.com/Courses/Data_Mining/ST4003-Lab5-Introduction_to_Neural_Networks.pdf
#http://stackoverflow.com/questions/10939591/predicting-class-for-new-data-using-neuralnet
library(nnet)

occupancyNeuralNetwork <- occupancyPreProcessed
head(occupancyNeuralNetwork)

trainNeuralNetwork <- occupancyNeuralNetwork[1:1333,]
testNeuralNetwork <- occupancyNeuralNetwork[1334:2665,]

trainNeuralNetwork$Occupancy <- class.ind(trainNeuralNetwork$Occupancy)
head(trainNeuralNetwork)

testNeuralNetwork$Occupancy <- class.ind(testNeuralNetwork$Occupancy)
head(testNeuralNetwork)

nnetOccupancy <- nnet(Occupancy ~., trainNeuralNetwork, linout = FALSE, size = 8)

trainNeuralNetwork[1:9] <- sapply(trainNeuralNetwork[1:9], as.numeric)
sapply(trainNeuralNetwork,"class")
head(trainNeuralNetwork)

testNeuralNetwork[1:9] <- sapply(testNeuralNetwork[1:9], as.numeric)
sapply(testNeuralNetwork,"class")
head(testNeuralNetwork)

neuralNetOccupancy <- neuralnet(Occupancy ~ Day + TimePeriod + TimeOfDay + Temperature +
																	Humidity + Light + CO2 + HumidityRatio, trainNeuralNetwork, 
																	hidden = 6, threshold = 0.01, linear.output = FALSE)

print(neuralNetOccupancy)
plot(neuralNetOccupancy)

neuralNetworkResults <- compute(neuralNetOccupancy,testNeuralNetwork[1:8])
neuralNetworkResults$net.result

occupancyOutput <- cbind(testNeuralNetwork[1:8], testNeuralNetwork$Occupancy, 
												 as.data.frame(neuralNetworkResults$net.result))

sapply(occupancyOutput, "class")

colnames(occupancyOutput) <- c("Input 1 - Day", "Input 2 - Time Period", 
																 "Input 3 - Time Of Day", "Input 4 - Temperature",
																 "Input 5 - Humidity", "Input 6 - Light", "Input 7 - CO2",
																 "Input 8 - Humidity Ratio", "Expected Output", 
																 "Neural Network Output")
print(occupancyOutput)
View(occupancyOutput)
