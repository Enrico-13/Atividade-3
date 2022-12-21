# Configurando pasta de trabalho para fácil acesso aos arquivos

PATH <- "D:/Users/enric/Desktop/Pós Facens/Estatística/Aula 3/Atividade-3/Dados"
setwd(PATH)

# ----------------------------------------------------------------------

# Ex1: Laranja

dados_laranja <- read.csv2("./laranja.csv")
shapiro.test(dados_laranja$prod)
# Teste de shapiro tem P-valor mairo que 5% (10,8%), logo se tem
# distruibuição normal na base de dados pois não se rejeita H0

model_laranja <- aov(prod ~ trat, data=dados_laranja)
summary(model_laranja)
# P-valor da análise de variância está maior que 5% (14,6%)
# então não se rejeita H0, logo a média dos valores se
# mantém constante entre as amostras.

# ----------------------------------------------------------------------

# Ex2: Cana

dados_cana <- read.csv2("./cana.csv")
shapiro.test(dados_cana$prod)
# Teste de shapiro tem P-valor maior que 5% (54,67%), logo se tem
# distruibuição normal na base de dados pois não se rejeita H0

model_cana <- aov(prod ~ trat, data=dados_cana)
summary(model_cana)
# P-valor da análise de variância está menor que 5% (0,3%)
# então se rejeita H0, logo existe diferença na média dos valores
# entre as amostras.

posthoc_cana <- TukeyHSD(model_cana, 'trat', conf.level = 0.95)
posthoc_cana
plot(posthoc_cana)
# Utilizando o teste de Tukey é possível concluir que o tratamento C
# da cana-de-açúcar possui a maior diferença entre os pares de valores
# C - B ; D - C ; E - C, pois possuem módulo da diferença com um valor
# maior que os demais, e isso se comprova verdadeiro ao vermos que o 
# P-valor desses pares apresentam valores menores que 5%

# ----------------------------------------------------------------------

# Ex3: Bezerro

dados_bezerro <- read.csv2("./bezerro.csv")
shapiro.test(dados_bezerro$Peso)
# Teste de shapiro tem P-valor maior que 5% (88,5%), logo se tem
# distruibuição normal na base de dados pois não se rejeita H0

model_bezerro <- aov(Peso ~ Raca, data=dados_bezerro)
summary(model_bezerro)
# P-valor da análise de variância está maior que 5% (20%)
# então não se rejeita H0, logo a média dos valores se
# mantém constante entre as amostras.

# ----------------------------------------------------------------------

# Ex4: Espinafre

dados_espinafre <- read.csv2("./espinafre.csv")
shapiro.test(dados_espinafre$Comprimento.raiz)
# Teste de shapiro tem P-valor menor que 5% (0,6312%), valor menos que 5%
# então se rejeita H0 pois a base de dados não apresenta
# distribuição normal

kruskal.test(Comprimento.raiz ~ as.factor(Tratamento),
             data=dados_espinafre)
# P-valor do teste de Kruskal-Wallis é maior que 5% (96,29%)
# logo, não se rejeita H0, e não existe diferença significativa entre
# a média das amostras testadas

# ----------------------------------------------------------------------