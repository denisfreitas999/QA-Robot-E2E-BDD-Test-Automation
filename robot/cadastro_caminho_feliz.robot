*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o organo
Test Teardown    Fechar o navegador

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...        //option[contains(.,'Programação')]
...        //option[contains(.,'Front-End')]
...        //option[contains(.,'Data Science')]
...        //option[contains(.,'Devops')] 
...        //option[contains(.,'UX e Design')]
...        //option[contains(.,'Mobile')]
...        //option[contains(.,'Inovação e Gestão')]

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

*** Keywords ***

Dado que os campos do formulário sejam preenchidos
    ${Nome}          FakerLibrary.First Name
    Input Text       ${CAMPO_NOME}      ${Nome}
    ${Cargo}         FakerLibrary.Job
    Input Text       ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}        FakerLibrary.Image Url
    Input Text       ${CAMPO_IMAGEM}    ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[0]

E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então identificar o card dentro do bloco do time esperado
    Element Should Be Visible    class:colaborador
    Sleep    10s
Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
       Dado que os campos do formulário sejam preenchidos
       E clique no botão criar card 
    END
    Sleep    10s

Então criar e identificar um card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que os campos do formulário sejam preenchidos
        Click Element    ${time}
        E clique no botão criar card 
    END
    Sleep    10s