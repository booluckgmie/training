#call dataset
df = read.csv('heart.csv', header = TRUE)
dfh = df
str(dfh)

dfh$Gender = factor(dfh$Gender)
dfh$Race = factor(dfh$Race)

#Full
k=5
LR1rsme = rep(NA, k)
LR2rsme = rep(NA, k)

folds = split(dfh, cut(1:nrow(dfh),k))

for (i in 1:k) {
  test = ldply(folds[i], data.frame)
  train = ldply(folds[-i], data.frame)
  test$.id = NULL
  train$.id = NULL
  #LR1
  LR1 = lm(Mphr~Pkhr, data=train)
  LR1pred = predict(LR1, newdata = test)
  LR1rsme[i] = sqrt(mean((test$Mphr - LR1pred)^2))
  
  #LR2
  LR2 = lm(Mphr~Pkhr+Bp+Race, data=train)
  LR2pred = predict(LR2, newdata = test)
  LR2rsme[i] = sqrt(mean((test$Mphr - LR2pred)^2))
  
}

LR1rsme
LR2rsme

resultrmse = data.frame(mean(LR1rsme),mean(LR2rsme))

resultrmse