#required packages
#install.packages('haven')
#library(haven)
require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)

#load data
data <- read_sav('DataSetSTB_2020.research(final).sav')

#sneak peak dataset
class(data)
dim(data)
head(data)
str(data)

#pivot table
with(data, table(Grp_WorkStatus, Region))

#pivot by group
with(data, do.call(rbind, tapply(Grp_WorkStatus, Region, function(x) c(Mean = mean(x), SD = sd(x)))))

##change datatypes
data$Grp_WorkStatus <- as.factor(data$Grp_WorkStatus)
levels(data$Grp_WorkStatus)

##convert multiple variable to factor
names <- c('Strata' ,'Jantina','Region','Age_Grp','Grp_Marriage', 
           'Grp_WorkStatus','Berkahwin')
data[,names] <- lapply(data[,names] , factor)

#descriptive with tableone
## tableone package itself
install.packages('tableone')
library(tableone)

#Simplest use case
CreateTableOne(data = data)

## Get variables names
dput(names(data))

#str(data)
#data$Jantina2 <- relevel(data$Jantina, ref = "Grp_WorkStatus")
#test <- multinom(Jantina2 ~ Grp_Marriage + Grp_WorkStatus, data = data)

## Vector of variables to summarize
myVars <- c("Pendidikan", "Strata", "Jantina","Region", "Age_Grp", 
            "Grp_Marriage", "Grp_WorkStatus", "Etnik")

## Vector of categorical variables that need transformation
catVars <- c("Pendidikan", "Strata", "Jantina","Region", "Age_Grp", 
             "Grp_Marriage", "Grp_WorkStatus", "Etnik")

## Create a TableOne object
tab2 <- CreateTableOne(vars = myVars, data = data, factorVars = catVars)

tab2

#Showing all levels for categorical variables
print(tab2, showAllLevels = TRUE, formatOptions = list(big.mark = ","))

#Detailed information including missingness
summary(tab2)

tab3 <- CreateTableOne(vars = myVars, strata = "Grp_WorkStatus" , data = data, factorVars = catVars)
print(tab3, nonnormal =  , formatOptions = list(big.mark = ","))

print(tab3, nonnormal =  , exact = "stage", smd = TRUE)

tab3Mat <- print(tab3, nonnormal = , exact = "stage", quote = FALSE, noSpaces = TRUE, printToggle = FALSE, showAllLevels = TRUE)
## Save to a CSV file
write.csv(tab3Mat, file = "myTable.csv")

## Categorical part only
tab3$CatTable
