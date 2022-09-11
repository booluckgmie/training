library(readr)
library(dplyr)
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

#Dissimilarity Index

scoop <- filter(probs, Attribute == "Outside" & Category=="Pendidikan")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Pendidikan")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Pendidikan")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Pendidikan")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Pendidikan")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

pendidikan = data.frame(out,emr,eme,self,unpaid)
pendidikan$Category = "Pendidikan"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Strata")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Strata")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Strata")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Strata")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Strata")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

strata = data.frame(out,emr,eme,self,unpaid)
strata$Category = "Strata"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Age_Grp")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Age_Grp")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Age_Grp")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Age_Grp")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Age_Grp")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

Age_Grp = data.frame(out,emr,eme,self,unpaid)
Age_Grp$Category = "Age_Grp"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Etnik")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Etnik")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Etnik")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Etnik")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Etnik")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

Etnik = data.frame(out,emr,eme,self,unpaid)
Etnik$Category = "Etnik"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Grp_Marriage")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Grp_Marriage")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Grp_Marriage")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Grp_Marriage")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Grp_Marriage")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

Grp_Marriage = data.frame(out,emr,eme,self,unpaid)
Grp_Marriage$Category = "Grp_Marriage"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Jantina")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Jantina")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Jantina")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Jantina")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Jantina")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

Jantina = data.frame(out,emr,eme,self,unpaid)
Jantina$Category = "Jantina"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Region")
out <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employer" & Category=="Region")
emr <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Employee" & Category=="Region")
eme <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Self employed" & Category=="Region")
self <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Region")
unpaid <- sum(abs(scoop$Value-(1/scoop$nlevel))*1/2, na.rm=TRUE)

Region = data.frame(out,emr,eme,self,unpaid)
Region$Category = "Region"

result = rbind(pendidikan,strata,Age_Grp,Etnik,Grp_Marriage,Jantina,Region)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
