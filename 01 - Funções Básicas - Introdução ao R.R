######################################################################################
##########################         FUNÇÕES BÁSICAS          ##########################
####################         ANÁLISES BIOLÓGICAS DIVERSAS         ####################
######################################################################################


#--------------------------------- INTRODUÇÃO AO R ----------------------------------#

#OBS:
#Para este tutorial, baixar o exemplo1.txt do mesmo repositório.

#------------------------------------------------------------------------------------#

#No R, qualquer linha escrita é interpretada como um comando ou função.
#Usando oo símbolo de cerquilha "#", ou hashtag, o software automaticamente ignora a linha.
#Isto é útil para redigir comentários e lembrete úteis.


#No R, decimal é representado por ponto " . " Se desejamos escrever
#quatro virgula cinco, a representação correta é 4.5
#virgula será utilizada para separar valores, linhas, colunas, e funções


#Para ativar qualquer linha/comando pressione Ctrl + Enter
#ou simplesmente o botão "Run".


#Operações matematicas básicas no R:
5+2 #soma
5-2 #subtração
5*2 #multiplicação
5/2 #divisão
5^2 #elevado ao quadrado, ao cubo, etc..
sqrt(100) #Raiz quadrada
sin(45) #Seno
cos(45) #Cosseno
tan(45) #Tangente


2<5	  #x menor que y?
2<=5 	#x menor ou igual a y?
5>2	  #x maior que y?
5>=2	#x maior ou igual a y?
5==5	#x igual a y?
5!=2	#x diferente de y?


#Comandos úteis do R:

help.search("fBasics") #comando para obter ajuda dentro dos pacotes do R.

install.packages("NOME DO PACOTE") #Instalar pacotes
install.packages("fBasics")

library("NOME DO PACOTE") #Comando para carregar o pacote sempre que for utilizá-lo.
library(fBasics) 



#Importando planilha de dados txt

#Primeiro é necessário definir o diretório (pasta onde estão os arquivos)
#Para definir o diretório basta utilizar a função setwd
#O caminho deve está entre " e as barras duplicadas \\

setwd("C:\\Users\\clara\\OneDrive\\Documentos\\Rotinas do R")

dir() #conferir se o diretório está certo.
#Ctrl+Shift+H -> DEFINIR DIRETORIO #Abrir a pasta diretamente!

getwd() #Verifica qual diretório está sendo utilizado
dir() #Exibe todos os arquivos dentro do diretorio

#Para importar o txt vamos utilizar a função read.table. Lembrando que
#deve-se usar o ponto " . " para decimais no txt
ex1<-read.table("exemplo1.txt", h=T) #h=T informa que cabeçalho

ex1
head(ex1) #Primeiras linhas do txt
tail(ex1) #Ultimas linhas do txt
str(ex1) #Mostra a estrutura da tabela


#Toda manipulação de dados feita anteriormente é possivel de ser realizada
#quando se importa a planilha


#Exemplos
rownames(ex1)<-c(LETTERS[1:20])#Nomeando as linhas. O Comando
#LETTERS indica que eu quero nomear as
#linhas com letras MAIUSCULAS da 1a Letra
#do alfabeto (a) até a 20a (T). "letters" p/ minusculas
ex1
ex1$Amb1 #Observar dados somente do ambiente 1
mean(ex1$Amb2) #Média do ambiente 2
var(ex1$Amb3) #Variância do ambiente 3
apply(ex1,1,mean) #média de todos os genotipos
apply(ex1,2,mean) #média de todos os ambientes


rm(list=ls()) #Limpar todos os dados do workspace
#Também pode ser feito pelo símbolo da vassourinha.
#Recomendado sempre que for iniciar outro banco de dados.



#OUTRAS FUNCIONALIDADES:

#Obtendo ajuda com qualquer termo no R:
help("setwd")
?setwd
??setwd #busca dentro dos pacotes


#Citando o R em artigos:
citation() #Como citar o software R



#-------------------------------- FUNÇÕES BÁSICAS ----------------------------------#


#Criando um objeto:
a<-c(1,2,3,4,5)
a
b<-c(10,20,30,40,50)
b

#Podem-se realizar quaisquer funções com os conjuntos "a" e "b"
a+b
a-b
somatorio_a<-sum(a)
somatorio_b<-sum(b)
#etc.


#Media
mean(a)
mean(b)

media<-mean(a)
media<-mean(b)
media_ab<-mean(a+b)

length(a+b) # número de elementos em a+b #comprimento
media_ab<-sum(a+b)/length(a+b); media #A média também pode ser encontrada por 
#sum/length

#Ao criar um objeto de mesmo nome que outro, o último substituirá o anterior.



#Para nomear os vetores:
names(a)<-c("A","B","C","D", "E");a #Nomeando o vetor a

#Para ordenar por forma crescente ou decrescente:
(order(a, na.last = TRUE, decreasing = TRUE)) #Ordenando a de forma decrescente
a_ordem_D<-(order(a, na.last = TRUE, decreasing = TRUE))
a_ordem_C<-(order(a, na.last = TRUE, decreasing = FALSE))#Ordenando na forma crescente


#Alterar dados:
b2<-b[1:3];b2  #retirar os números do vetor b nas posições 1, 2 e 3
b3<-b[-5]; b3  #retirar o quinta observação
b[6]<-100; b #Inserir o valor 100 na posição 6
b<-b[-5];b
#Perceba que estes dois últimos substituiram o antigo conjunto b.

a
names(a)<-c("A","B","C","D", "E");a
mean(a)
a2<-a[a>mean(a)]; a2 #retirar os maiores que a média
media_a2<-mean(a2)



#Gerar um data.frame
ab<-data.frame(a,b); ab #Criando data.frame composto pelos vetores a e b
#Criar um data.frame gera uma tabela com as posições e colunas a e b no formato
#5 observações com 2 variáveis: a e b)



#Renomeando "a" e "b" como uma variável:
names(ab)<-c("Amb1", "Amb2");ab #Renomeando as a e b para ambientes
ab$Amb1 #Observar somente o Ambiente 1
mean(ab$Amb1) #Média do ambiente 1
var(ab$Amb1) #Variância do ambiente 1



length(ab[1,]) #[x,y] Neste caso x representa as linhas, e y as colunas
#Estamos interessados em verificar quantos valores temos
#Para a linha 1, considerando todas as colunas.
#Observa-se que temos 2 valores associados a essa linha

length(ab[,2]) #Quantos valores associados a coluna 2 ?


sum(ab[1,])   #Somando os valores da linha 1 para todas as colunas. 
sum(ab[,2])   #Somando os valores da coluna 2 para todas as linhas.



#Função "Apply":

#apply(X, MARGIN, FUN, ...) X=objeto, Margin = Lin ou Col? FUN = função

apply(ab,1,mean) #média de todos os genotipos (1 para linhas)
#medias de todas as linhas (genótipos).

apply(ab,2,mean) #média de todos os ambientes (2 para colunas)
#médias de todas as colunas (ambiente).



#Adicionando novo conjunto ao data.frame:
ab$Amb3<- c(30, 90, 100, 120, 760); ab #Adicionando o Ambiente 3 ao conjunto ab.
mean(ab$Amb3) #média ambiente 3



#Remoção de objeto:
rm(b2) #Remove apenas o conjnto b2 do workspace
rm(b3) #Remove apenas o conjnto b2 do workspace

rm(list=ls()) #Limpar todos os dados do workspace
#Também pode ser feito pelo símbolo da vassourinha.
#Recomendado sempre que for iniciar outro banco de dados.



#Gerando uma planilha de preenchimento direto

DADOS<-edit(data.frame()) #possibilida a digitação direta em uma planilha
DADOS



#Distribuição Normal:

Dados<-rnorm(n=100,mean=10, sd=3)
Dados
#Gera distribuição normal com 100 valores aleatórios, de média 10 e desvio padrão 3.

Dados<-rnorm(n=100,mean=10, sd=3); Dados
#O ponto-vírgula aqui age comunicando ao R outro comando na mesma linha.
#Digitando desta forma, o objeto será mostrado no "Environment" e no "Console"

#pode também ser de forma resumida:
Dados<-rnorm(100,10,3); Dados


