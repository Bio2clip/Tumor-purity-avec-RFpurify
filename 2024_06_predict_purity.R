# Installation (une seule fois)
if(!require(minfi)){
  if(!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install("minfi")
}

if(!require(devtools)) install.packages("devtools")   
devtools::install_github('mwsill/RFpurify')

#Chargement du package 
library(RFpurify)

#Charger ses données au format MehtylSet 
#MsetEX = ...

#Prediction pureté tumorale avec ABSOLUTE et ESTIMATE
absolute <- predict_purity(MsetEx,method="ABSOLUTE")
estimate <- predict_purity(MsetEx,method="ESTIMATE")

#Graphique de la prediction estimate par rapport à la prédiction absolute
plot(x=estimate,y=absolute,pch=19,ylim=c(0,1),xlim=c(0,1))
abline(a=0,b=1,col="red")