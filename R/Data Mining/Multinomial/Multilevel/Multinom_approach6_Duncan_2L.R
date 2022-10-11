library(readr)
library(dplyr)
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

#calculate Duncan

#Strata/Urban
scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Urban')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Strata" & Level=='Urban')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Strata" & Level=='Urban')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Strata" & Level=='Urban')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Strata" & Level=='Urban')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

strata_urban = data.frame(out,emr,eme,self,unpaid)

strata_urban$Category = "Strata/Urban"

#Strata/Rural
scoop <- filter(probs, Attribute == "outside" & Category=="Strata" & Level=='Rural')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Strata" & Level=='Rural')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Strata" & Level=='Rural')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Strata" & Level=='Rural')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Strata" & Level=='Rural')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

strata_rural = data.frame(out,emr,eme,self,unpaid)
strata_rural$Category = "Strata/Rural"

#pendidikan = data.frame(out,emr,eme,self,unpaid)
#pendidikan$Category = "Pendidikan"
#####################

#####################
#Jantina/Male
scoop <- filter(probs, Attribute == "outside" & Category=="Jantina" & Level=='Male')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Jantina" & Level=='Male')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Jantina" & Level=='Male')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Jantina" & Level=='Male')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Jantina" & Level=='Male')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Jantina_male = data.frame(out,emr,eme,self,unpaid)
Jantina_male$Category = "Jantina/male"

#Jantina/Female
scoop <- filter(probs, Attribute == "outside" & Category=="Jantina" & Level=='Female')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Jantina" & Level=='Female')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Jantina" & Level=='Female')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Jantina" & Level=='Female')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Jantina" & Level=='Female')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Jantina_Female = data.frame(out,emr,eme,self,unpaid)
Jantina_Female$Category = "Jantina/Female"

#####################
#Pendidikan/TPR
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='TPR')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='TPR')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='TPR')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='TPR')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='TPR')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Pendidikan_TPR= data.frame(out,emr,eme,self,unpaid)
Pendidikan_TPR$Category = "Pendidikan/TPR"

#Pendidikan/TPR
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='TPR')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='TPR')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='TPR')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='TPR')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='TPR')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Pendidikan_TPR= data.frame(out,emr,eme,self,unpaid)
Pendidikan_TPR$Category = "Pendidikan/TPR"

#Pendidikan/Rendah
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Rendah')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Rendah')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Rendah')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Rendah')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Rendah')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Pendidikan_Rendah= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Rendah$Category = "Pendidikan/Rendah"

#Pendidikan/Menengah
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Menengah')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Menengah')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Menengah')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Menengah')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Menengah')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Pendidikan_Menengah= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Menengah$Category = "Pendidikan/Menengah"

#Pendidikan/Tertiari
scoop <- filter(probs, Attribute == "outside" & Category=="Pendidikan" & Level=='Tertiari')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Pendidikan" & Level=='Tertiari')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Pendidikan" & Level=='Tertiari')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Pendidikan" & Level=='Tertiari')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Pendidikan" & Level=='Tertiari')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Pendidikan_Tertiari= data.frame(out,emr,eme,self,unpaid)
Pendidikan_Tertiari$Category = "Pendidikan/Tertiari"

#####################
#Etnik/Melayu
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Melayu')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Melayu')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Melayu')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Melayu')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Melayu')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Etnik_Melayu = data.frame(out,emr,eme,self,unpaid)
Etnik_Melayu$Category = "Etnik_Melayu"

#Etnik/Cina
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Cina')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Cina')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Cina')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Cina')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Cina')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Etnik_Cina = data.frame(out,emr,eme,self,unpaid)
Etnik_Cina$Category = "Etnik_Cina"

#Etnik/India
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='India')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='India')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='India')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='India')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='India')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Etnik_India = data.frame(out,emr,eme,self,unpaid)
Etnik_India$Category = "Etnik_India"

#Etnik/Lain
scoop <- filter(probs, Attribute == "outside" & Category=="Etnik" & Level=='Lain')
out <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employer" & Category=="Etnik" & Level=='Lain')
emr <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "employee" & Category=="Etnik" & Level=='Lain')
eme <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "self employed" & Category=="Etnik" & Level=='Lain')
self <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

scoop <- filter(probs, Attribute == "unpaid family worker" & Category=="Etnik" & Level=='Lain')
unpaid <- (1/2) * sum(abs(scoop$Value/100 - scoop$Total/100))

Etnik_Lain = data.frame(out,emr,eme,self,unpaid)
Etnik_Lain$Category = "Etnik_Lain"

###########

result = rbind(Etnik_Melayu,Etnik_Cina,Etnik_India,Etnik_Lain,
               Jantina_male,Jantina_Female,
               Pendidikan_TPR,Pendidikan_Rendah,Pendidikan_Menengah,Pendidikan_Tertiari,
               strata_urban,strata_rural)

names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category")
result$index = "Duncan"
names(result) <- c("Outside","Employer","Employee","Self employed","Unpaid family worker","Category","Index")
resultDuncan = result

#write.csv(resultDuncan,"resultDuncan_2L.csv")
