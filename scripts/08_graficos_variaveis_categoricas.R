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
tab01$Sexo = as.character(tab01$Sexo) #alterando as categorias de sexo
tab01$Sexo[tab01$Sexo == "M"] = "Masculino"
tab01$Sexo[tab01$Sexo == "F"] = "Feminino"

tab01 = melt(tab01, id.vars = "Sexo")
colnames(tab01) = c("Sexo", "SE", "n")

# criando gráfico de barras para valores absolutos
ggplot(tab01)+
  geom_bar(aes(x = Sexo, y = n, fill = SE), stat = "identity")+
  ggtitle("Número de notificações por sexo e semana epidemiológica")

## tabela de número de notificações por classificação final 
tab02 = data.frame(table(esus$classificacaoFinal))
tab02$Var1 = as.character(tab02$Var1)

tab02[1,1] = "Não classificado" #incluindo linha sem classificação final
colnames(tab02) = c("Classificacao", "n") #incluindo rótulos na tabela
tab02$Proporcao = tab02$n/sum(tab02$n)*100 #calculando a porcentagem

# criando gráfico de barras para proporção
ggplot(tab02)+
  geom_bar(aes(x = Classificacao, y = Proporcao), stat = "identity")+
  ggtitle("Proporção de notificações por calssificação final")+
  theme_bw()
