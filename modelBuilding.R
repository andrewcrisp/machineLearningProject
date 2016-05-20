library(caret)
library(xgboost)

set.seed(1)

setwd("~/projects/machineLearning")

training <- read.csv("pml-training.csv", sep=",")
testing <- read.csv("pml-testing.csv", sep=",")



newTraining <-training[sapply(training, function(x)
  !any(is.na(x) | x =="")
)]
newTraining <- newTraining[,grep("_belt|_arm|_dumbbell|_forearm|classe",colnames(newTraining))]

newTesting <- testing[sapply(testing, function(x)
  !any(is.na(x) | x == "")
)]
newTesting <- newTesting[,grep("_belt|_arm|_dumbbell|_forearm",colnames(newTesting))]

model <- train(classe~., data=newTraining, method="xgbTree")