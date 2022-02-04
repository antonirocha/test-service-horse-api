* Settings *
Documentation       Suite de testes de consultas de Clientes.


Resource    ${EXECDIR}/resources/base.robot


* Test Cases *
Search Customer Fixed
    ${send}=            Customers.Search CPF
    ${response}=        ClientRoute.GET Customer        ${send}

    Status Should Be    200         ${response}
    Status Should Be    OK          ${response}


Search Customer Personalized
    ${response}=        ClientRoute.GET Customer        02839051150

    Status Should Be    200         ${response}
    Status Should Be    OK          ${response}


Search Customer Personalized [Mask]
    ${response}=        ClientRoute.GET Customer        032.741.591-66

    Status Should Be    200         ${response}
    Status Should Be    OK          ${response}


Search Customer CPF Incorrect
    ${response}=        ClientRoute.GET Customer        123456

    Status Should Be    500         ${response}
    Should Be Equal     ${response.json()['mensagem']}         CPF deve ter 11 dígitos. (Apenas números)


Search Customer CPF Invalid
    ${response}=        ClientRoute.GET Customer        12345678910

    Status Should Be    500         ${response}
    Should Be Equal     ${response.json()['mensagem']}         CPF inválido.


Search Customer Not Found
    ${response}=        ClientRoute.GET Customer        326.342.771-72

    Status Should Be    404         ${response}
    Should Be Equal     ${response.json()['mensagem']}         Cliente não encontrado
