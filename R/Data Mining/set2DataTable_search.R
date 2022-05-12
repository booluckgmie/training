#install.packages("knitr")
#install.packages("rmarkdown")
#install.packages("tidyverse")

#print(getwd())
#setwd("C:/Users/najmi.ariffin/Documents/R/datatable")

library(tidyverse)
library(DT)
library(knitr)
library(tidyverse)
library(rmarkdown)

#load data
data <- read.csv('toy sales.csv', header = TRUE)

data %>%
  datatable(extensions = 'Buttons',
            options = list(dom = 'Blfrtip',
                           buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                           lengthMenu = list(c(10,25,50,-1),
                                             c(10,25,50,"All"))))

