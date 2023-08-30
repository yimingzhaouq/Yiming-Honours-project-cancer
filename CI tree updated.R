data<-TMD
str(data)
data$DiagnosisF <- factor(data$Diagnosis)
set.seed(1234)
pd <- sample(2, nrow(data), replace = TRUE, prob = c(0.8, 0.2))
train <- data[pd==1,]
validate <- data[pd==2,]
library(party)
tree <- ctree(DiagnosisF~ miR.211, data = train)
tree
plot(tree)
save()
setwd("R:\STARKLAB-Q4846\Dermatology\Stark_Group\Yiming_Honours2022\Data analysis\Classification tree")
getwd()
save.image("CI tree updated.Rdata")
savehistory("CI tree updated.Rhistory")
load("CI tree updated.Rdata")

#Optimal CutOff
install.packages("OptimalCutpoints")
library(OptimalCutpoints)
TD
TD$Diagnosis <- factor(TD$Diagnosis, labels = c("Absent", "Present"))
TD
results <- optimal.cutpoints (X= "miR211", status = "Diagnosis", tag.healthy = "Absent", methods = "Youden", data = TD)
summary(results)
plot(results)

