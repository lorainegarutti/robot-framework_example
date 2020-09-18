*** Settings ***

Documentation    O usuário procura por vídeos no app do YouTube com o termo 'café especial'    

Library          AppiumLibrary
Resource         ../resource/variables.robot

###Test Setup      
###Test Teardown   

*** Test Cases ***
Cenário 01: fazer pesquisa de vídeo sobre café especial
    Começando teste
    Ir para a aba Explorar
    Abrir campo de busca
    Digitar as palavras   café especial
    Clicar na tecla "Enter"
    Verei pelo menos um resultado com a palavra chave    café especial                        

Cenário 02: dar play no segundo vídeo exibido no resultado da pesquisa
    Abrir o segundo vídeo
    Verei que ele tem a palavra chave utilizada na busca  café especial
    Finalizando teste
