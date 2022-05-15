library(corrplot)
library(ggcorrplot)
library(RColorBrewer)
library("PerformanceAnalytics")


Data_Attrition <- read.csv("D:\\Study\\Data Analytics\\Module Project\\HR-Employee-Attrition.csv", header=TRUE, sep= ",") 
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
#cor(Data_Attrition[, unlist(lapply(Data_Attrition, is.numeric))])
Data_Attrition$Attrition <- as.factor(Data_Attrition$Attrition)
Data_Attrition$BusinessTravel <- as.factor(Data_Attrition$BusinessTravel)
Data_Attrition$Department <- as.factor(Data_Attrition$Department)
Data_Attrition$EducationField <- as.factor(Data_Attrition$EducationField)
Data_Attrition$Gender <- as.factor(Data_Attrition$Gender)
Data_Attrition$JobRole <- as.factor(Data_Attrition$JobRole)
Data_Attrition$MaritalStatus <- as.factor(Data_Attrition$MaritalStatus)
Data_Attrition$OverTime <- as.factor(Data_Attrition$OverTime)
Data_Attrition$Over18 <- as.factor(Data_Attrition$Over18)

Data_Attrition_One_Hot <- one_hot(as.data.table(Data_Attrition))

M <-cor(newdata)
plot.new()
#corrplot(M, type="upper", order="hclust",
#         col=brewer.pal(n=8, name="BuPu"))
#cor(subset(newdata))
corr <- round(cor(Data_Attrition_One_Hot), 1)

ggcorrplot(corr, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="square", 
           colors = c("#ff7675", "white", "#00cec9"), 
           title="Correlogram Numeric Variables", 
           ggtheme=theme_minimal())

library(caret)   


library(mltools)
library(data.table)



newdata <- one_hot(as.data.table(Data_Attrition))

