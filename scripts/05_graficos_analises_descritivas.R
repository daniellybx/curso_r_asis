# carregando pacotes
library(tidyverse) #pacote inclui o ggplot2

## datasets de dados 
esus = read.csv2("dados/20210601_dadosesus_df.csv") #importando dados do esus df de 01/06/2021
sivep = read.csv2("dados/20210823_dadossivep.csv") #importando dados do esus df de 23/08/2021

source("scripts/03_aula_importando_dados.R") #realizando os tratamentos do script 03

## criando gráficos para descrição de variáveis métricas com ggplot2

#criando um objeto ggplot
esus_gra = ggplot(esus)

## criando um histograma simples
esus_gra+
  geom_histogram(aes(x = dataInicioSintomas), bins = 30)

## adicionando feições ao histograma
esus_gra+
  geom_histogram(aes(x = dataInicioSintomas), bins = 15, colour = "white", fill = "blue")+
  xlab("Data de início dos sintomas")+ylab("Número de notificações")+
  ggtitle("Histograma de notificações por data de início de sintomas")+
  theme_bw()

## criando um boxplot simples
sivep_gra = ggplot(sivep)

## criando um boxplot simples
sivep_gra+
  geom_boxplot(aes(x = CS_SEXO, y = NU_IDADE_N))

## adicionando feições ao histograma
sivep_gra+
  geom_boxplot(aes(x = CS_SEXO, y = NU_IDADE_N, fill = CS_SEXO))+
  xlab("Sexo")+ylab("Idade")+
  ggtitle("Distribuição de notificações por idade e sexo")+
  theme_dark()
