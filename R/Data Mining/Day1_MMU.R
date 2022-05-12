install.packages("mlbench")     #dataset
install.packages("plyr")        #split func
install.packages("rpart")       #decision tree
install.packages("rpart.plot")  #tree plot
install.packages("class")       #k-nn
install.packages("e1071")       #naive bayes
install.packages("caret")       #cm

library(mlbench)     #dataset
library(plyr)        #split func
library(rpart)       #decision tree
library(rpart.plot)  #tree plot
library(class)       #k-nn
library(e1071)       #naive bayes
library(caret)       #cm

ls('package:plyr')            #function in package
data(PimaIndiansDiabetes)

str(PimaIndiansDiabetes)
summary(PimaIndiansDiabetes)

#load whole dataset
df = PimaIndiansDiabetes

#load selected data with not zero value for specific var (valid data only) by ([X, ]take all rows)
df1 = df[df['glucose'] != 0 & df['pressure'] != 0 & df['triceps'] != 0 & df['mass'] != 0,]

#split train data and test data
sRow = floor(nrow(df1) * .8)

#set first 80% dataset as train data
trainData = df1[1:sRow, ] 

#selecting other 425rows (20%) onwards as test data
testData = df1[(sRow+1):nrow(df1),] 

#select 1-4 rows, select column no.2
df1[1:4, 2]

#select 1-4 rows, select column no.2-5
df1[1:4, 2:5]

#model building
DTmodel = rpart(diabetes~., data=trainData, 
                method = 'class', parms = list(split='information'))

summary(DTmodel)

#plotting tree
prp(DTmodel, roundint = FALSE, digits=0)

#evalute model
DTpred = predict(DTmodel, testData, type='class')

confusionMatrix(DTpred, testData$diabetes, 'pos')
DT = confusionMatrix(DTpred, testData$diabetes, 'pos')

#NB Classifier (0 value never happen)
NBmodel = naiveBayes(diabetes~., data = trainData,
                     method='class')

NBpred = predict(NBmodel, testData, type='class')

confusionMatrix(NBpred, testData$diabetes, 'pos')
NB = confusionMatrix(NBpred, testData$diabetes, 'pos')

#df1 without normalization

df2 = df1
#df2 with normalization

#set normalize function
normalize = function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

df2[1:8] = as.data.frame(lapply(df2[1:8], normalize)) #normalize columns 1-8 except pred output

trainDataKNN = df2[1:sRow,]
testDataKNN = df2[(sRow+1):nrow(df2),]

#kNN Model
KNNpred = knn(train=trainDataKNN[,1:8],
              test=testDataKNN[,1:8],
              cl=trainDataKNN[,9], k=3)

confusionMatrix(KNNpred, testDataKNN$diabetes, 'pos')
KNNcm3 = confusionMatrix(KNNpred, testDataKNN$diabetes, 'pos')

#kNN Model
KNNpred2 = knn(train=trainDataKNN[,1:8],
              test=testDataKNN[,1:8],
              cl=trainDataKNN[,9], k=5)

confusionMatrix(KNNpred2, testDataKNN$diabetes, 'pos')
KNNcm5 = confusionMatrix(KNNpred2, testDataKNN$diabetes, 'pos')

data.frame(KNN_3 = KNNcm3$overall['Accuracy'],
           KNN_5 = KNNcm5$overall['Accuracy'])

data.frame(DT = DT$overall['Accuracy'],
           NB = NB$overall['Accuracy'],
           KNN_5 = KNNcm5$overall['Accuracy'])

#5-fold Cross Validation

k=5
DTaccuracy = rep(NA, k)
DTaccuracy
folds = split(df1, cut(1:nrow(df1),k))
folds

for (i in 1:k) {
  test = ldply(folds[i], data.frame)
  train = ldply(folds[-i], data.frame)
  test$.id = NULL
  train$.id = NULL
  DTmodelCV = rpart(diabetes~., data=train, method = 'class',
                    parms = list(split='information'))
  DTpredCV = predict(DTmodelCV, test, type='class')
  DTcmCV = confusionMatrix(DTpredCV, test$diabetes,
                           positive='pos')
  DTaccuracy[i] = DTcmCV$overall['Accuracy']
  
}
DTaccuracy


#Full
DTaccuracy = rep(NA, k)
NBaccuracy = rep(NA, k)
KNNaccuracy = rep(NA, k)

for (i in 1:k) {
  test = ldply(folds[i], data.frame)
  train = ldply(folds[-i], data.frame)
  test$.id = NULL
  train$.id = NULL
  #DT
  DTmodelCV = rpart(diabetes~., data=train, method = 'class',
                    parms = list(split='information'))
  DTpredCV = predict(DTmodelCV, test, type='class')
  DTcmCV = confusionMatrix(DTpredCV, test$diabetes,
                           positive='pos')
  DTaccuracy[i] = DTcmCV$overall['Accuracy']
  
  #NB
  NBmodelCV = naiveBayes(diabetes~., data = train,
                         method='class')
  NBpredCV = predict(NBmodelCV, test, type='class')
  NBcmCV = confusionMatrix(NBpredCV, test$diabetes,
                           positive='pos')
  NBaccuracy[i] = NBcmCV$overall['Accuracy']
  
}

DTaccuracy
NBaccuracy

#KNN loops
j = 5
KNNaccuracy = rep(NA, j)
foldsKNN = split(df2, cut(1:nrow(df2),j))
df2[1:8] = as.data.frame(lapply(df2[1:8], normalize)) #normalize columns 1-8 except pred output
trainKNN = df2[1:sRow,]
testKNN = df2[(sRow+1):nrow(df2),]

for (i in 1:j) {
  testKNN = ldply(foldsKNN[i], data.frame)
  trainKNN = ldply(foldsKNN[-i], data.frame)
  testKNN$.id = NULL
  trainKNN$.id = NULL
  #KNN
  
  KNNpredCV = knn(train=trainKNN[,1:8],
                test=testKNN[,1:8],
                cl=trainKNN[,9], k=3)
  
  KNNcm3CV = confusionMatrix(KNNpredCV, testKNN$diabetes, 'pos')
  KNNaccuracy[i] = KNNcm3CV$overall['Accuracy']
  
}

KNNaccuracy


#################
ResultCV = data.frame(DT = mean(DTaccuracy),
                      NB = mean(NBaccuracy),
                      KNN = mean(KNNaccuracy))

rownames(ResultCV) = 'Accuracy'
                  
##########
KNNcm3CV$positive

KNNcm3CV$overall['Accuracy']
KNNcm3CV$byClass['Sensitivity']
KNNcm3CV$byClass['Specificity']
KNNcm3CV$byClass['Pos Pred Value']
KNNcm3CV$table
