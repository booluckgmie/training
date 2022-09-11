library(DescTools)
library(readr)
library(dplyr)
probs <- read_csv("countTable_byWorkStatus2.csv")
head(probs)

names(probs)

#count nlevel for every Category/Attribute
probs2 <-  probs %>% group_by(Category, Attribute) %>% summarise(nlevel = n())

#put all data frames into list
df_list <- list(probs, probs2)      

#merge all data frames together
data2 <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list)
names <- c("Category","Attribute","Level")
data2[,names] <- lapply(data2[,names] , factor)

levels(data2$Attribute)
levels(data2$Category)

probs<- data2

#Gini

scoop <- filter(probs, Attribute == "Outside" & Category=="Pendidikan")
#define vector of incomes
#x <- c(50, 50, 70, 70, 70, 90, 150, 150, 150, 150)

#calculate Gini coefficient
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Pendidikan")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Pendidikan")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Pendidikan")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Pendidikan")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

pendidikan = data.frame(out,emr,eme,self,unpaid)
pendidikan$Category = "Pendidikan"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Strata")
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Strata")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Strata")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Strata")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Strata")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

strata = data.frame(out,emr,eme,self,unpaid)
strata$Category = "Strata"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Age_Grp")
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Age_Grp")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Age_Grp")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Age_Grp")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Age_Grp")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Age_Grp = data.frame(out,emr,eme,self,unpaid)
Age_Grp$Category = "Age_Grp"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Etnik")
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Etnik")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Etnik")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Etnik")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Etnik")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Etnik = data.frame(out,emr,eme,self,unpaid)
Etnik$Category = "Etnik"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Grp_Marriage")
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Grp_Marriage")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Grp_Marriage")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Grp_Marriage")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Grp_Marriage")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Grp_Marriage = data.frame(out,emr,eme,self,unpaid)
Grp_Marriage$Category = "Grp_Marriage"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Jantina")
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Jantina")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Jantina")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Jantina")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Jantina")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Jantina = data.frame(out,emr,eme,self,unpaid)
Jantina$Category = "Jantina"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Region")
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Region")
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Region")
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Region")
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Region")
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Region = data.frame(out,emr,eme,self,unpaid)
Region$Category = "Region"

result = rbind(pendidikan,strata,Age_Grp,Etnik,Grp_Marriage,Jantina,Region)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
