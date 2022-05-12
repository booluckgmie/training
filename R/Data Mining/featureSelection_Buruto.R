df = read.csv('toy sales.csv', header = TRUE)

df1 = df
str(df1)

#===================Remove Redundant Features===========

# ensure the results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)
# load the data
#data(PimaIndiansDiabetes)
# calculate correlation matrix
correlationMatrix <- cor(df1)
# summarize the correlation matrix
print(correlationMatrix)
# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
# print indexes of highly correlated attributes
print(highlyCorrelated)


#=========Rank Features By Importance+================

# ensure results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)
# load the dataset
#data(PimaIndiansDiabetes)
# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)
# train the model
model <- train(Unit~., data=df1, preProcess="scale", trControl=control)
# estimate variable importance
importance <- varImp(model, scale=FALSE)
# summarize importance
print(importance)
# plot importance
plot(importance)

#===============Feature Selection using Boruta==============
#Install and load Boruta package
install.packages("Boruta")
library(Boruta)

set.seed(456)
boruta2 <- Boruta(Unit~., data = df1, doTrace = 1)

# summarize the results
print(boruta2)

# plot the results
plot(boruta2, type=c("g", "o"))
