*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}    http://localhost:3000/


*** Keywords ***

Dado que eu acesse o organo
    Open Browser    url=${URL}    browser=Chrome

Fechar o navegador
    Close Browser