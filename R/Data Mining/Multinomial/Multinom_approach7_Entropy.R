library(readr)
library(dplyr)
#install.packages("entropy")
library(entropy)
probs <- read_csv("probs_bygroupCat.csv")
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

#Entropy

scoop <- filter(probs, Attribute == "Outside" & Category=="Region")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Pendidikan")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Pendidikan")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Pendidikan")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Pendidikan")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

pendidikan = data.frame(out,emr,eme,self,unpaid)
pendidikan$Category = "Pendidikan"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Strata")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Strata")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Strata")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Strata")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Strata")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

strata = data.frame(out,emr,eme,self,unpaid)
strata$Category = "Strata"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Age_Grp")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Age_Grp")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Age_Grp")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Age_Grp")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Age_Grp")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

Age_Grp = data.frame(out,emr,eme,self,unpaid)
Age_Grp$Category = "Age_Grp"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Etnik")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Etnik")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Etnik")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Etnik")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Etnik")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

Etnik = data.frame(out,emr,eme,self,unpaid)
Etnik$Category = "Etnik"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Grp_Marriage")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Grp_Marriage")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Grp_Marriage")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Grp_Marriage")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Grp_Marriage")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

Grp_Marriage = data.frame(out,emr,eme,self,unpaid)
Grp_Marriage$Category = "Grp_Marriage"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Jantina")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Jantina")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Jantina")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Jantina")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Jantina")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

Jantina = data.frame(out,emr,eme,self,unpaid)
Jantina$Category = "Jantina"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Region")
out <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employer" & Category=="Region")
emr <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Employee" & Category=="Region")
eme <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Self employed" & Category=="Region")
self <- entropy.empirical(scoop$Value, unit = "log")

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Region")
unpaid <- entropy.empirical(scoop$Value, unit = "log")

Region = data.frame(out,emr,eme,self,unpaid)
Region$Category = "Region"

result = rbind(pendidikan,strata,Age_Grp,Etnik,Grp_Marriage,Jantina,Region)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
