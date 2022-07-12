Algoritmo "menuOperacionalDaJajatur"
// Disciplina   : Atividade prática do módulo 2
// Professor   : Recode Pro
// Descrição   : Simulação em pseudocódigo de um menu de uma agência de
//               viagens com as seguintes funções: cadastro de cliente e
//               cadastro de destino, criar também uma consulta para
//               cada estrutura de dados.
// Autor(a)    : Jairo Jose R. T. de B. Junior
// Data atual  : 07/07/2022
Var
// Seção de Declarações das variáveis 
    opcaoMenu, i : inteiro
    mensagemTexto, nome, sobrenome, cpf, destino: caractere
    baseClientes : vetor [1..11, 1..10] de caractere
    resLogico : logico

// Funções a serem utilizadas

// checkCadastro é uma função para verificar se o usuário já é nosso cliente
    funcao checkCadastro: logico
       // variáveis internas
       var
          nossoCliente: logico
       inicio
       nossoCliente <- falso //Essa variável já deve iniciar no falso para a condicional funcionar
       escreval("Você já tem cadastro conosco? Por favor, digite seu cpf:")
       leia(cpf)

       // Esse 'para' é para verificar se o usuário já não é cliente nosso
       para i <- 2 ate 11 faca
            se (cpf = baseClientes[i,1]) entao
               nossoCliente <- verdadeiro
            fimse
       fimpara
       
       se (nossoCliente = verdadeiro) entao
          escreval("Este cpf já está cadastrado. Você já é nosso cliente.")
       senao
          escreval("Você não é nosso cliente. Vamos fazer o cadastro?")
       fimse
       
       escreval("------------------------------------")
       
       retorne nossoCliente
    fimfuncao
    
// procedimento que realiza o cadastro do cliente
    procedimento fazerCadastro(statusCadastro: logico)
       var
          confirmaDados: inteiro
          dadoInserido: logico
       inicio
       confirmaDados <- 2 //Para o laço do 'enquanto' funcionar
       dadoInserido <- falso // Para funcionar a condicional da linha 69
       
       se statusCadastro = falso entao
            enquanto confirmaDados = 2 faca
               escreval("Escreva seu primeiro nome:")
               leia(nome)
               escreval("Escreva seu sobrenome:")
               leia(sobrenome)
               escreval("Informe seu cpf:")
               leia(cpf)
               escreval("Confira seus dados: ")
               escreval("Nome: ", nome, " ","Sobrenome: ", sobrenome, " ", "CPF: ", cpf)
               escreval("1 - Estão corretos", " ", "2 - Estão errados")
               leia(confirmaDados)
            fimenquanto

            para i <- 2 ate 11 faca
                       se (baseClientes[i,1] = "") entao
                          se dadoInserido = falso entao
                             baseClientes[i,1]<-cpf
                             baseClientes[i,2]<-nome
                             baseClientes[i,3]<-sobrenome
                             dadoInserido <- verdadeiro
                          fimse
                       fimse
                  fimpara
       fimse
       escreval("------------------------------------")
    fimprocedimento

// Procedimento para cadastrar destino de cliente
// o programa comporta até 7 registros de destino
    procedimento cadastrarDestino (statusCadastro: logico)
                 var
                    confirmaDados, linhaCliente: inteiro
                    dadoInserido: logico
                 inicio
                    confirmaDados <- 2
                    dadoInserido <- falso

                    para i <- 2 ate 11 faca
                         se cpf = baseClientes[i,1] entao
                            nome <- baseClientes[i,2]
                            sobrenome <- baseClientes[i,3]
                         fimse
                    fimpara

                    escreval("Olá ", nome, " ", sobrenome.)

                    enquanto confirmaDados = 2 faca
                            escreval("Para qual destino deseja ir: ")
                            leia(destino)
                            escreval("O destino escolhido foi: ", " ", destino)
                            escreval("1 - O destino está correto", " ", " 2 - O destino está incorreto")
                            leia(confirmaDados)
                    fimenquanto

                    para i <- 2 ate 11 faca
                         se cpf = baseClientes[i,1] entao
                            linhaCliente <- i
                         fimse
                    fimpara
                    para i <- 4 ate 10 faca
                          se dadoInserido = falso entao
                            se baseClientes[linhaCliente, i] = "" entao
                               baseClientes[linhaCliente, i] <- destino
                               dadoInserido <- verdadeiro
                            fimse
                          fimse
                    fimpara
                    escreval("------------------------------------")
    fimprocedimento
    
    procedimento consultarDados()
                 var
                 linhaCliente: inteiro

                 inicio
                 escreval("Informe seu cpf: ")
                 leia(cpf)
                 
                 para i <- 2 ate 11 faca
                      se cpf = baseClientes[i,1] entao
                         nome <- baseClientes[i,2]
                         sobrenome <- baseClientes[i,3]
                      fimse
                 fimpara
                 
                 para i <- 2 ate 11 faca
                      se cpf = baseClientes[i,1] entao
                            linhaCliente <- i
                      fimse
                 fimpara
                 
                 escreval("Esses são os seus dados: ")
                 escreval("Nome: ", nome)
                 escreval("Sobrenome: ", sobrenome)
                 escreval("CPF: ", cpf)
                 escreval("Destinos: ")
                 para i <- 4 ate 10 faca
                      escreval(baseClientes[linhaCliente, i])
                 fimpara
                 escreval("------------------------------------")
    fimprocedimento
    
Inicio
//  Organização de cabeçalho na baseClientes
    baseClientes[1,1] <- "CPF"
    baseClientes[1,2] <- "Nome"
    baseClientes[1,3] <- "Sobrenome"
    baseClientes[1,4] <- "Viajem 1"
    baseClientes[1,5] <- "Viajem 2"
    baseClientes[1,6] <- "Viajem 3"
    baseClientes[1,7] <- "Viajem 4"
    baseClientes[1,8] <- "Viajem 5"
    baseClientes[1,9] <- "Viajem 6"
    baseClientes[1,10] <- "Viajem 7"

//  Apresentação do menu

    escreval ("Olá! Bem-vindxs a agência de turismo JajaTur!")
    opcaoMenu <- 0
    enquanto opcaoMenu <> 4 faca
       escreval ("Por favor, selecione uma das opções a seguir:")
       escreval ("1 - Cadastro cliente")
       escreval ("2 - Cadastrar destino")
       escreval ("3 - Consulta")
       escreval ("4 - Sair")
       leia (opcaoMenu)

   //  Navegação pelo menu

       escolha opcaoMenu
         caso 1
              resLogico<-checkCadastro
              fazerCadastro(resLogico)
         caso 2
              resLogico<-checkCadastro
              cadastrarDestino(resLogico)
         caso 3
              consultarDados
         caso 4
              ESCREVAL ("Ok. A JajaTur agradece por contar conosco. Volte sempre")
       fimescolha
     fimenquanto
Fimalgoritmo