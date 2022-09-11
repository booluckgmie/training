library(readr)
library(dplyr)
probs <- read_csv("probswTotal.csv")
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

#Duncan

scoop <- filter(probs, Attribute == "Outside" & Category=="Region")
  summarize(duncan = (1/2) * sum(abs(scoop$Value - scoop$Total)))

####


scoop <- filter(probs, Attribute == "Outside" & Category=="Pendidikan")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Pendidikan")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Pendidikan")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Pendidikan")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Pendidikan")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

pendidikan = data.frame(out,emr,eme,self,unpaid)
pendidikan$Category = "Pendidikan"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Strata")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Strata")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Strata")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Strata")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Strata")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

strata = data.frame(out,emr,eme,self,unpaid)
strata$Category = "Strata"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Age_Grp")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Age_Grp")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Age_Grp")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Age_Grp")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Age_Grp")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

Age_Grp = data.frame(out,emr,eme,self,unpaid)
Age_Grp$Category = "Age_Grp"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Etnik")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Etnik")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Etnik")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Etnik")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Etnik")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

Etnik = data.frame(out,emr,eme,self,unpaid)
Etnik$Category = "Etnik"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Grp_Marriage")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Grp_Marriage")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Grp_Marriage")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Grp_Marriage")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Grp_Marriage")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

Grp_Marriage = data.frame(out,emr,eme,self,unpaid)
Grp_Marriage$Category = "Grp_Marriage"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Jantina")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Jantina")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Jantina")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Jantina")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Jantina")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

Jantina = data.frame(out,emr,eme,self,unpaid)
Jantina$Category = "Jantina"

#####################
scoop <- filter(probs, Attribute == "Outside" & Category=="Region")
out <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employer" & Category=="Region")
emr <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Employee" & Category=="Region")
eme <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Self employed" & Category=="Region")
self <- (1/2) * sum(abs(scoop$Value - scoop$Total))

scoop <- filter(probs, Attribute == "Unpaid family worker" & Category=="Region")
unpaid <- (1/2) * sum(abs(scoop$Value - scoop$Total))

Region = data.frame(out,emr,eme,self,unpaid)
Region$Category = "Region"

result = rbind(pendidikan,strata,Age_Grp,Etnik,Grp_Marriage,Jantina,Region)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
