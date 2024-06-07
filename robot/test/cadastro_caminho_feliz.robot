*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o organo
Test Teardown    Fechar o navegador

*** Test Cases ***

Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    Dado que os campos do formulário sejam preenchidos
    E clique no botão criar card
    Então identificar o card dentro do bloco do time esperado
    
Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que os campos do formulário sejam preenchidos
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se é possivel criar um card para cada time disponível se preenchermos os campos corretamente
    Dado que os campos do formulário sejam preenchidos
    Então criar e identificar um card em cada time disponível

