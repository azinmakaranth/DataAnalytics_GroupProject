library(corrplot)
library(ggcorrplot)
library(RColorBrewer)
library("PerformanceAnalytics")
library("readxl")

Data_Attrition <- read_excel("D:\\Study\\Data Analytics\\Module Project\\Absence_Imputed.xlsx")
is.na(Data_Attrition)
sum(is.na(Data_Attrition))

Data_Attrition_Numeric_Vars <- Data_Attrition[, unlist(lapply(Data_Attrition, is.numeric))]

#----------------------------------
#chart.Correlation(Data_Attrition_Numeric_Vars, histogram=TRUE, pch=19)

#----------------------------------
options(repr.plot.width=10, repr.plot.height=7) 

#nums <- select_if(Data_Attrition, is.numeric)

corr <- round(cor(Data_Attrition_Numeric_Vars), 1)

ggcorrplot(corr, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="square", 
           colors = c("#d63031", "white", "#0984e3"), 
           title="Correlogram Numeric Variables", 
           ggtheme=theme_gray())

#----------------------------------


