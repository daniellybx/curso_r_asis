# carregando pacotes
library(tidyverse) #pacote para a manipulação dos dados

## datasets de dados 
esus = read.csv2("dados/20210601_dadosesus_df.csv") #importando dados do esus df de 01/06/2021
sivep = read.csv2("dados/20210823_dadossivep.csv") #importando dados do esus df de 23/08/2021

source("scripts/03_aula_importando_dados.R") #realizando os tratamentos do script 03

## Calculando medidas descritivas para dados contínuos
summary(esus$idade) #medidas de posição (quartis, minimo, máximo e mediana)

mean(esus$idade) #média da idade
median(esus$idade) #mediana da idade

quantile(esus$idade) #quantis  da distribuição da idade
quantile(esus$idade, probs = 0.5)
quantile(esus$idade, probs = 0.9)
quantile(esus$idade, probs = 0.99)

var(esus$idade) #variância da idade
sd(esus$idade) #desvio padrão da idade

sqrt(var(esus$idade)) #desvio padrão da idade
sqrt(var(esus$idade)) == sd(esus$idade) #testando se os dados são iguais

## calculando medidas descritivas para dados categóricos
summary(sivep$CS_SEXO)
table(sivep$CS_SEXO) #tabela de frequencia de dados
tabela01 = data.frame(table(sivep$CS_SEXO)) #tabela de frequencia de dados em data.frame
