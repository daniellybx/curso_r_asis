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

## criando tabela simples

## tabela de número de notificações por classificação final 
tab01 = data.frame(table(esus$classificacaoFinal))
tab01$Var1 = as.character(tab01$Var1)

tab01[1,1] = "Não classificado" #incluindo linha sem classificação final
colnames(tab01) = c("Classificacao", "n") #incluindo rótulos na tabela
tab01$Proporcao = tab01$n/sum(tab01$n)*100 #calculando a porcentagem

## formatando a tabela 
formattable(tab01) #formatando a tabela de forma simples

formattable(tab01, align = c("l", "r", "r"),
            list(`Classificacao` = formatter("span", style = ~ style(color = "grey", font.weight = "bold")), 
                 `n` = color_bar("#FA614B"),
                 `Proporcao` = formatter("span", 
                                         x ~ percent(x / 100))))
