# carregando pacotes
library(tidyverse) #pacote inclui o ggplot2 
library(EpiWeek)

## datasets de dados 
esus = read.csv2("dados/20210601_dadosesus_df.csv") #importando dados do esus df de 01/06/2021
sivep = read.csv2("dados/20210823_dadossivep.csv") #importando dados do esus df de 23/08/2021

source("scripts/03_aula_importando_dados.R") #realizando os tratamentos do script 03

## criando gráficos para descrição de variáveis métricas com ggplot2

##inlcuindo populacao fictícia para calcular taxa de incidência

esus$n = 1
esus_agday = aggregate(n ~ dataInicioSintomas, data = esus, FUN = sum)
esus_agday$dataInicioSintomas = as.Date(esus_agday$dataInicioSintomas)

#criando um objeto ggplot
esus_gra = ggplot(esus)

## criando um gráfico de linha simples
ggplot(data=esus_agday, aes(x=dataInicioSintomas, y=n, group=1)) +
  geom_line()+
  geom_point()

## adicionando feições ao gráfico de linha
ggplot(data=esus_agday, aes(x=dataInicioSintomas, y=n, group=1)) +
  geom_line(fill = "blue")+
  geom_point(colour = "blue")+
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
