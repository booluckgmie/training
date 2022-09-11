require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)
require(caret)
library("caret")
library("foreign")
library(readr)
data <- read_csv("rawSTB.csv")
data2 <- read_csv("rawSTB2.csv")
head(data2)
str(data2)

require("GGally")
library(GGally)

##convert multiple variable to factor
names <- c('Pendidikan2','Strata2' ,'Jantina2','Region2','Age_Grp2','Grp_Marriage2', 
           'Grp_WorkStatusCat',"Etnik2")
data2[,names] <- lapply(data2[,names] , factor)

GGally::ggpairs(data2)

with(data2, table(Pendidikan2, Grp_WorkStatusCat))

#with(data2, do.call(rbind, tapply(Age_Grp2, Grp_WorkStatusCat, function(x) c(M = mean(x), SD = sd(x)))))

names(data2)

#Re-leveling data and Training the multinomial model
data2$Grp_WorkStatusCat2 <- relevel(data2$Grp_WorkStatusCat, ref = "Outside")

multinom_model <- multinom(Grp_WorkStatusCat2 ~ Jantina2 + Age_Grp2 + Strata2 + Etnik2, data = data2)

# Checking the model
summary(multinom_model)


z <- summary(multinom_model)$coefficients/summary(multinom_model)$standard.errors
z

# 2-tailed z test
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p

# display p-values in transposed data frame
data.frame(t(p))

## extract the coefficients from the model and exponentiate
exp <- exp(coef(test))
data.frame(t(exp))

levels(data2$Pendidikan2)
levels(data2$Jantina2)
levels(data2$Age_Grp2)
levels(data2$Strata2)
levels(data2$Etnik2)
levels(data2$Grp_WorkStatusCat2)

head(round(fitted(multinom_model), 2))
head(pp <- fitted(multinom_model))

# Predicting the values for train dataset
train <- read_csv("rawSTB_testsampletofill.csv", 
                                    col_types = cols(Grp_WorkStatusCat = col_skip()))


# Predicting the values for train dataset
predict(multinom_model, newdata = train, type = "probs", se = TRUE)
pred <- predict(multinom_model, newdata = train, type = "probs", se = TRUE)

keeps <- "Probability"
train[ , keeps, drop = FALSE]
predtable <- data.frame(cbind(train, pred))

write.csv(predtable, file = "summaryTable.csv")


head(train)

require("DescTools")
library(DescTools)
DescTools::PseudoR2(multinom_model, 
                    which = c("McFadden", "CoxSnell", "Nagelkerke"))
