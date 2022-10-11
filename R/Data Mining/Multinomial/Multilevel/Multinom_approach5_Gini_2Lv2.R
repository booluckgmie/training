library(DescTools)
library(readr)
library(dplyr)
probs <- read_csv("Count_woTotal_2L.csv")
head(probs)

names(probs)

#count nlevel for every Category/Attribute
probs2 <-  probs %>% group_by(Category, Attribute) %>% summarise(nlevel = n()/5)

#put all data frames into list
df_list <- list(probs, probs2)      

#merge all data frames together
data2 <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list)
names <- c("Category","Attribute","Level")
data2[,names] <- lapply(data2[,names] , factor)

levels(data2$Attribute)
levels(data2$Category)

probs<- data2


#calculate Gini coefficient

#Strata/Urban
scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Urban')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Strata" & Level=='Urban')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Strata" & Level=='Urban')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Strata" & Level=='Urban')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Strata" & Level=='Urban')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

strata_urban = data.frame(out,emr,eme,self,unpaid)

strata_urban$Category = "Strata/Urban"

#Strata/Rural
scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Rural')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Strata" & Level=='Rural')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Strata" & Level=='Rural')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Strata" & Level=='Rural')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Strata" & Level=='Rural')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

strata_rural = data.frame(out,emr,eme,self,unpaid)
strata_rural$Category = "Strata/Rural"

#pendidikan = data.frame(out,emr,eme,self,unpaid)
#pendidikan$Category = "Pendidikan"
#####################

#####################
#Jantina/Male
scoop <- filter(probs, Attribute == "outside" & Category=="Jantina" & Level=='Male')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Jantina" & Level=='Male')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Jantina" & Level=='Male')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Jantina" & Level=='Male')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Jantina" & Level=='Male')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Jantina_male = data.frame(out,emr,eme,self,unpaid)
Jantina_male$Category = "Jantina/male"

#Jantina/Female
scoop <- filter(probs, Attribute == "outside" & Category=="Jantina" & Level=='Female')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Jantina" & Level=='Female')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Jantina" & Level=='Female')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Jantina" & Level=='Female')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Jantina" & Level=='Female')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Jantina_Female = data.frame(out,emr,eme,self,unpaid)
Jantina_Female$Category = "Jantina/Female"

#####################
#Pendidikan/TPR
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='TPR')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='TPR')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='TPR')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='TPR')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='TPR')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Pendidikan_TPR= data.frame(out,emr,eme,self,unpaid)
Pendidikan_TPR$Category = "Pendidikan/TPR"

#Pendidikan/TPR
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='TPR')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='TPR')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='TPR')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='TPR')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='TPR')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Pendidikan_TPR= data.frame(out,emr,eme,self,unpaid)
Pendidikan_TPR$Category = "Pendidikan/TPR"

#Pendidikan/Rendah
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Rendah')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Rendah')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Rendah')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Rendah')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Rendah')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Pendidikan_Rendah= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Rendah$Category = "Pendidikan/Rendah"

#Pendidikan/Menengah
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Menengah')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Menengah')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Menengah')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Menengah')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Menengah')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Pendidikan_Menengah= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Menengah$Category = "Pendidikan/Menengah"

#Pendidikan/Tertiari
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Tertiari')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Tertiari')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Tertiari')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Tertiari')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Tertiari')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Pendidikan_Tertiari= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Tertiari$Category = "Pendidikan/Tertiari"

#####################
#Etnik/Melayu
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Melayu')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Melayu')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Melayu')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Melayu')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Melayu')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Etnik_Melayu = data.frame(out,emr,eme,self,unpaid)
Etnik_Melayu$Category = "Etnik_Melayu"

#Etnik/Cina
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Cina')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Cina')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Cina')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Cina')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Cina')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Etnik_Cina = data.frame(out,emr,eme,self,unpaid)
Etnik_Cina$Category = "Etnik_Cina"

#Etnik/India
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='India')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='India')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='India')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='India')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='India')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Etnik_India = data.frame(out,emr,eme,self,unpaid)
Etnik_India$Category = "Etnik_India"

#Etnik/Lain
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Lain')
out <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Lain')
emr <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Lain')
eme <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Lain')
self <- Gini(scoop$Value, unbiased=FALSE)

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Lain')
unpaid <- Gini(scoop$Value, unbiased=FALSE)

Etnik_Lain = data.frame(out,emr,eme,self,unpaid)
Etnik_Lain$Category = "Etnik_Lain"

###########

result = rbind(Etnik_Melayu,Etnik_Cina,Etnik_India,Etnik_Lain,
               Jantina_male,Jantina_Female,
               Pendidikan_TPR,Pendidikan_Rendah,Pendidikan_Menengah,Pendidikan_Tertiari,
               strata_urban,strata_rural)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
result$index = "Gini"
names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category","Index")
resultGini = result
#write.csv(resultGini,"resultGini_2L.csv")
