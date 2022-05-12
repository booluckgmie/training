getwd()

setwd("C:/Users/najmi.ariffin/Documents/R/trainingDataMiningMMU")

#call dataset
df = read.csv('toy sales.csv', header = TRUE)

#==============Simple Linear Reg==============
#scatter plot
df1 = df
plot(df1$Price, df1$Unit,
     xlab='Unit price',
     ylab='Unit sold per month')

#correlation = how strong strength/ direction of linear assoc.
cor(df1$Price, df1$Unit)

#simple
SLR = lm(Unit~Price, data=df1) 
#lm() - OLS (Ordinary Least Squares regression (OLS) is
#a common technique for estimating coefficients
#squared it to minimize/optimize epsilon value (difference) 

#simple output
SLR

#add line in scatterplot
abline(SLR)

#reg output
summary(SLR)

#plot residual
par(mfrow = c(2,2))
plot(SLR)

#point predict
predict(SLR, newdata = data.frame(Price=9))

#confidence interval
predict(SLR, 
        newdata = data.frame(Price=9), 
        interval = 'confidence') #95% CI

#prediction interval 
predict(SLR, 
        newdata = data.frame(Price=9), 
        interval = 'prediction') #future value/more wider (future observation)

#==============Multiple Linear Reg==============
#more than 1 predictor

pairs(df1)
cor(df1)

round(cor(df1),2)


MLR = lm(Unit~Price+Ad+Promo, data=df1)
summary(MLR)

senario1 = predict(MLR, newdata = data.frame(Price=9.10, Ad=52, Promo=61))
senario2 = predict(MLR, newdata = data.frame(Price=7.10, Ad=48, Promo=57))
senario3 = predict(MLR, newdata = data.frame(Price=8.10, Ad=50, Promo=60))

resultsenario = data.frame(senario1,
                      senario2,
                      senario3)

resultsenario

#comparing nested model

anova(SLR,MLR)
#Ho: SLR = MLR
#Ha: model M1(SLR) is significantly reduced compared to M2(MLR), 
#MLR is doing better


#==============Reg with Categorical Var==============

#call dataset
df2 = read.csv('admission.csv', header = TRUE)
catv = lm(gpa~gre+factor(rank)+factor(admit), data=df2)

summary(catv)

#call dataset
test = read.csv('toy sales test.csv', header = TRUE)

#predict the whole new dataset using SLR model
pred_SLR = predict(SLR, newdata = test)
rmse_SLR = sqrt(mean((test$Unit - pred_SLR)^2))

pred_MLR = predict(MLR, newdata = test)
rmse_MLR = sqrt(mean((test$Unit - pred_MLR)^2))

resultrmse = data.frame(rmse_SLR,rmse_MLR)

resultrmse
#Error: the small value the better

#============logistics reg==============

#call dataset
Ad = read.csv('admission.csv', header = TRUE)
str(Ad)
Ad$rank = factor(Ad$rank)
Ad$admit = factor(Ad$admit, levels = c('0','1')) #predicting 1/ second value
                  
LogR = glm(admit~., data=Ad, family = 'binomial')
summary(LogR)

exp(coef(LogR))

Ad_test = read.csv('admission test.csv', header = TRUE)
str(Ad_test)
Ad_test$rank = factor(Ad_test$rank)
Ad_test$admit = factor(Ad_test$admit)

ProbS = predict(LogR, newdata=Ad_test, type = 'response')
ProbS = round(data.frame(ProbS),4)
ProbS

PredC = factor(ifelse(ProbS > 0.5,'1','0'))

#checking output
output=cbind(ProbS, data.frame(PredC))
output2=cbind(ProbS, data.frame(PredC), Ad_test)

#evaluate
confusionMatrix(PredC, Ad_test$admit, positive = '1')



#==============Exercise Logistics Reg=============

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

k =5
DTaccuracy = rep(NA, k)
LogRaccuracy = rep(NA, k)
folds = split(df1, cut(1:nrow(df1),k))

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
  
  #LogR
  LogRCV = glm(diabetes~., data=train, family = 'binomial')
  LogRprobCV = predict(LogRCV, newdata=test, type = 'response')
  LogRPredCV = factor(ifelse(LogRprobCV > 0.5,'pos','neg'))
  LogRcmCV = confusionMatrix(LogRPredCV, test$diabetes, positive = 'pos')
  
  LogRaccuracy[i] = LogRcmCV$overall['Accuracy']
  
}
DTaccuracy
LogRaccuracy

resultCV = data.frame(mean(DTaccuracy),mean(LogRaccuracy))
rownames(resultCV) = 'Accuracy'
resultCV
