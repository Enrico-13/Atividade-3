# Configurando pasta de trabalho para fácil acesso aos arquivos
PATH = "D:/Users/enric/Desktop/Pós Facens/Estatística/Aula 3/Atividade-3"
setwd(PATH)


# Ex1: Laranja
dados_laranja = read.csv2("./Dados/laranja.csv")
model_laranja = aov(prod ~ trat, data=dados_laranja)
summary(model_laranja)
# P valor da análise de variância está maior que 5% (14,6%)
# então não se rejeita H0, logo a média dos valores se
# mantém constante entre as amostras.


# Ex2: Cana
dados_cana = read.csv2("./Dados/cana.csv")
model_cana = aov(prod ~ trat, data=dados_cana)
summary(model_cana)
# P valor da análise de variância está menor que 5% (0,3%)
# então se rejeita H0, logo existe diferença na média dos valores
# entre as amostras.



# Ex3: Bezerro
dados_bezerro = read.csv2("./Dados/bezerro.csv")



# Ex4: Espinafre
dados_espinafre = read.csv2("./Dados/espinafre.csv")
