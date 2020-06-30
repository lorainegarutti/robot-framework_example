*** Settings ***

Documentation    O usuário procura por vídeos no app do YouTube com o termo 'café especial'    

Library          AppiumLibrary
Resource         ../resource/variables.robot

Test Setup      Começando teste
Test Teardown   Finalizando teste

*** Test Cases ***
Cenário: fazer pesquisa de vídeo sobre café especial
    Abrir campo de busca
    Digitar as palavras   café especial
    Clicar na tecla "Enter"
    Verei pelo menos um resultado com a palavra chave    café especial                        



