* Settings *
Documentation       Suite de Teste da Impressão de Etiquetas de Produtos


Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Print Product One
    ${payload}=         Tags.Print Tag Product1
    ${response}=        TagRoute.POST Print Tag     ${payload}

    Status Should Be    201     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Comandos Enviados Para a Impressora


Print Product Two
    ${payload}=         Tags.Print Tag Product2
    ${response}=        TagRoute.POST Print Tag     ${payload}

    Status Should Be    201     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Comandos Enviados Para a Impressora

