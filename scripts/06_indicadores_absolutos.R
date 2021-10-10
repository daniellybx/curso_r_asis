# carregando pacotes
library(tidyverse) #tratamento dos dados

#install.packages("formattable")
library(formattable) #pacote para criação de tabelas bonitas

#install.packages("reshape2")
library(reshape2)

## datasets de dados 
esus = read.csv2("dados/20210601_dadosesus_df.csv") #importando dados do esus df de 01/06/2021
sivep = read.csv2("dados/20210823_dadossivep.csv") #importando dados do esus df de 23/08/2021

source("scripts/03_aula_importando_dados.R") #realizando os tratamentos do script 03

## criando uma tabela cruzada
tab01 = data.frame(sivep$CS_SEXO, sivep$SEM_PRI)
tab01 = dcast(sivep.CS_SEXO ~ sivep.SEM_PRI, data = tab01) #reorganizando os dados

colnames(tab01) = c("Sexo", "SEM01", "SEM02", "SEM03", "SEM04") #incluindo os títulos
tab01$Total = rowSums(tab01[,2:5]) #incluindo uma coluna de total

tab01$Sexo = as.character(tab01$Sexo) #alterando as categorias de sexo
tab01$Sexo[tab01$Sexo == "M"] = "Masculino"
tab01$Sexo[tab01$Sexo == "F"] = "Feminino"

## formatando a tabela
formattable(tab01)

formattable(tab01, align = c("l",rep("r", NCOL(tab01) - 1)), list(
  `Sexo` = formatter("span", style = ~ style(color = "grey",font.weight = "bold")), 
  area(col = 2:5) ~ color_tile("#DeF7E9", "#71CA97"),
  `Total` = formatter("span", style = ~ style(color = "black", font.weight = "bold"))))
