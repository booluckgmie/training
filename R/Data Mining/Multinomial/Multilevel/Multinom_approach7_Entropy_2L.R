library(readr)
library(dplyr)
#install.packages("entropy")
library(entropy)
probs <- read_csv("2LevelProb_withTotal.csv")
head(probs)

names(probs)

#count nlevel for every Category/Attribute
probs2 <-  probs %>% group_by(Category, Attribute) %>% summarise(nlevel = n()/5)

#put all data frames into list
df_list <- list(probs, probs2)      

#merge all data frames together
data2 <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list)
names <- c("Category","Attribute","Level","Region")
data2[,names] <- lapply(data2[,names] , factor)

levels(data2$Attribute)
levels(data2$Category)

probs<- data2

#calculate Entropy

scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Urban')
out <- entropy.empirical(scoop$Value/100, unit = "log")

#Strata/Urban
scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Urban')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Strata" & Level=='Urban')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Strata" & Level=='Urban')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Strata" & Level=='Urban')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Strata" & Level=='Urban')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

strata_urban = data.frame(out,emr,eme,self,unpaid)

strata_urban$Category = "Strata/Urban"

#Strata/Rural
scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Rural')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Strata" & Level=='Rural')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Strata" & Level=='Rural')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Strata" & Level=='Rural')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Strata" & Level=='Rural')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

strata_rural = data.frame(out,emr,eme,self,unpaid)
strata_rural$Category = "Strata/Rural"

#pendidikan = data.frame(out,emr,eme,self,unpaid)
#pendidikan$Category = "Pendidikan"
#####################

#####################
#Jantina/Male
scoop <- filter(probs, Attribute == "outside" & Category=="Jantina" & Level=='Male')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Jantina" & Level=='Male')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Jantina" & Level=='Male')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Jantina" & Level=='Male')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Jantina" & Level=='Male')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Jantina_male = data.frame(out,emr,eme,self,unpaid)
Jantina_male$Category = "Jantina/male"

#Jantina/Female
scoop <- filter(probs, Attribute == "outside" & Category=="Jantina" & Level=='Female')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Jantina" & Level=='Female')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Jantina" & Level=='Female')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Jantina" & Level=='Female')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Jantina" & Level=='Female')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Jantina_Female = data.frame(out,emr,eme,self,unpaid)
Jantina_Female$Category = "Jantina/Female"

#####################
#Pendidikan/TPR
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='TPR')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='TPR')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='TPR')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='TPR')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='TPR')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Pendidikan_TPR= data.frame(out,emr,eme,self,unpaid)
Pendidikan_TPR$Category = "Pendidikan/TPR"

#Pendidikan/TPR
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='TPR')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='TPR')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='TPR')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='TPR')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='TPR')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Pendidikan_TPR= data.frame(out,emr,eme,self,unpaid)
Pendidikan_TPR$Category = "Pendidikan/TPR"

#Pendidikan/Rendah
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Rendah')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Rendah')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Rendah')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Rendah')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Rendah')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Pendidikan_Rendah= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Rendah$Category = "Pendidikan/Rendah"

#Pendidikan/Menengah
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Menengah')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Menengah')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Menengah')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Menengah')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Menengah')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Pendidikan_Menengah= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Menengah$Category = "Pendidikan/Menengah"

#Pendidikan/Tertiari
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Tertiari')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Tertiari')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Tertiari')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Tertiari')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Tertiari')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Pendidikan_Tertiari= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Tertiari$Category = "Pendidikan/Tertiari"

#####################
#Etnik/Melayu
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Melayu')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Melayu')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Melayu')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Melayu')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Melayu')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Etnik_Melayu = data.frame(out,emr,eme,self,unpaid)
Etnik_Melayu$Category = "Etnik_Melayu"

#Etnik/Cina
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Cina')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Cina')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Cina')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Cina')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Cina')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Etnik_Cina = data.frame(out,emr,eme,self,unpaid)
Etnik_Cina$Category = "Etnik_Cina"

#Etnik/India
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='India')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='India')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='India')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='India')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='India')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Etnik_India = data.frame(out,emr,eme,self,unpaid)
Etnik_India$Category = "Etnik_India"

#Etnik/Lain
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Lain')
out <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Lain')
emr <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Lain')
eme <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Lain')
self <- entropy.empirical(scoop$Value/100, unit = "log")

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Lain')
unpaid <- entropy.empirical(scoop$Value/100, unit = "log")

Etnik_Lain = data.frame(out,emr,eme,self,unpaid)
Etnik_Lain$Category = "Etnik_Lain"

###########

result = rbind(Etnik_Melayu,Etnik_Cina,Etnik_India,Etnik_Lain,
               Jantina_male,Jantina_Female,
               Pendidikan_TPR,Pendidikan_Rendah,Pendidikan_Menengah,Pendidikan_Tertiari,
               strata_urban,strata_rural)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
result$index = "Entropy"
names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category","Index")
resultEntropy = result

write.csv(resultEntropy,"resultEntropy.csv")


findings = rbind(resultDI, resultGini, resultDuncan, resultEntropy)

write.csv(findings,"resultfindings_2L.csv")
