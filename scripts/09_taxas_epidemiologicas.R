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

# datasets de população
pop =  read.csv2("dados/20211010_populacao.csv") #importando dados populacionais do tabnet

# criando tabela de casos

## importante, ao calcular a taxa de incidência, usamos apenas casos confirmados. 
## por causa do n baixo, usaremos todas as notificações nesse exercício

sivep$COD = as.character(substring(sivep$CO_MUN_RES, 1, 2)) #incluindo código da UF
casos = data.frame(table(sivep$COD))
colnames(casos) = c("COD", "casos")
casos$COD = as.character(casos$COD)

pop$COD = as.character(pop$COD) #transformando o código da UF em character

# unindo os dados em um único data.frame
taxa = merge(casos, pop, by = "COD")

#calculando taxa de incidência por UF 
taxa$taxa_inc = round(taxa$casos/taxa$POP*100000, 2)
