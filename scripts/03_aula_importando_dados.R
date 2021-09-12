# carregando pacotes
library(tidyverse) #pacote para a manipulação dos dados

## datasets de dados 
p = "dados/"

esus = read.csv2(paste0(p, "20210601_dadosesus_df.csv")) #importando dados do esus df de 01/06/2021
sivep = read.csv2(paste0(p, "20210823_dadossivep.csv")) #importando dados do esus df de 23/08/2021

## visualizando as variáveis, linhas e colunas dos datasets
glimpse(esus)
glimpse(sivep)

#transformando variáveis em data 
esus$dataInicioSintomas = as.Date(esus$dataInicioSintomas)
esus$dataNotificacao = as.Date(esus$dataNotificacao)

class(esus$dataNotificacao)
class(esus$dataInicioSintomas)

sivep$DT_NOTIFIC = as.Date(sivep$DT_NOTIFIC, "%d/%m/%Y")
sivep$DT_SIN_PRI = as.Date(sivep$DT_SIN_PRI, "%d/%m/%Y")

class(sivep$DT_NOTIFIC)
class(sivep$DT_SIN_PRI)

#verificando se as datas são possíveis e ajustando as incorretas
summary(esus$dataInicioSintomas)
hist(esus$dataInicioSintomas, breaks = 30)

esus$dataInicioSintomas = as.Date(ifelse(esus$dataInicioSintomas <= "2020-03-01" | esus$dataInicioSintomas > "2021-06-01", 
                                 NA, esus$dataInicioSintomas), origin = "1970-01-01")
summary(esus$dataInicioSintomas)
hist(esus$dataInicioSintomas, breaks = 30)

summary(sivep$DT_SIN_PRI)
hist(sivep$DT_SIN_PRI, breaks = 30)

#ajustando idade como número 
class(esus$idade)

esus$idade = as.numeric(esus$idade)
summary(esus$idade)
hist(esus$idade)

esus$idade = ifelse(esus$idade > 100, NA, esus$idade)
summary(esus$idade)
hist(esus$idade)

#tratando com variáveis nominais
table(sivep$CS_SEXO)
sivep$CS_SEXO = factor(sivep$CS_SEXO, levels = c("M", "F", "I"))
