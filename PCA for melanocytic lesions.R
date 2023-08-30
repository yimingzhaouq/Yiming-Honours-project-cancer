## trying to change rownames
Overlap.with.rownames <- data.frame(Overlap[,-1], row.names = Overlap[,1])
Overlap.with.rownames

install.packages("factoextra")
library(factoextra)
install.packages("factoMineR")
pcOver<-prcomp(Overlap.with.rownames[,c(1:9)],center = TRUE, scale. = TRUE)
print(pcOver)
eig.val <- get_eigenvalue(pcOver)
eig.val
fviz_eig(pcOver, addlabels = TRUE, ylim = c(0,100))
var = get_pca_var(pcOver)
corrplot(var$cos2, is.corr = FALSE)

a<-fviz_contrib(pcDysN, choice = "var", axes = 1)
b<-fviz_contrib(pcDysN, choice = "var", axes = 2)
a

fviz_pca_var(pcOver,
             col.var = "cos2",
             gradient.cols = c("red", "blue", "green"),
             repel = TRUE)
#green means highluy correlated

fviz_pca_biplot(pcOver, repel = TRUE,
                col.var = "blue",
                col.ind = "red")
install.packages("remotes")
remotes::install_github("vqv/ggbiplot")
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS = "true") ## force = TRUE
install.packages("devtools")
library("devtools")
install_github("vqv/ggbiplot", force = TRUE)
fviz_pca_biplot(pcOver, repel = TRUE,
                col.var = "blue",
                col.ind = "red")
ggbiplot(pcOver)
library(ggbiplot)
ggbiplot(pcOver, labels=rownames(Overlap.with.rownames))
ggbiplot(pcOver, ellipse = TRUE, choices = c(1,2), labels=rownames(Overlap.with.rownames), groups = Overlap.with.rownames$Category)


