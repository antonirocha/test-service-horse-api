***Settings***
Documentation       Suite de Teste do Cadastro de Sessão de Caixa via API

Library     ${EXECDIR}/resources/factories/session.py
#Resource    ${EXECDIR}/resources/MultiAppServer.robot (Refatorar)


***Test Cases***
Permissão de Sessão de Caixa...
    &{session}          Permission Session
    ${response}         POST            http://10.67.0.234:8080/api/v2/caixas/permissao     json=${session}
    Status Should Be    200             ${response}

Abrindo uma Sessão de Caixa...
    &{session}          Open Session
    ${response}         POST            http://localhost:8080/api/v2/caixas/nova        json=${session}
    Status Should Be    200             ${response}

Alterando uma Sessão de Caixa...
    [tags]              bloq
    &{session}          Modify Session
    ${response}         PUT             http://10.67.0.234:8080/api/v2/caixas/permissao     json=${session}
    Status Should Be    200             ${response}

Encerrando uma Sessão de Caixa...
    [tags]              exit
    &{session}          Close Session
    ${response}         PUT            http://localhost:8080/api/v2/caixas/sessao        json=${session}
    Status Should Be    200            ${response}
