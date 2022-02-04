* Settings *
Documentation           Ações da rota /recontagens/*


* Keywords *
#Rotas GET
GET Cicles
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]

    ${response}=    GET
    ...             ${RECOUNT_URL}/ciclos
    ...             expected_status=any

    [return]        ${response}


GET Date
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]

    ${response}=    GET
    ...             ${RECOUNT_URL}/getdate
    ...             expected_status=any

    [return]        ${response}


#Rotas POST
POST Delete Item
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${RECOUNT_URL}/deleteitem
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Insert Cicle
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${RECOUNT_URL}/inserirCiclo
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Insert Item
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${RECOUNT_URL}/inserirItem
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Items
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${RECOUNT_URL}/itens
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Process
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${RECOUNT_URL}/processar
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Products
    ${RECOUNT_URL}=    api.Recount Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${RECOUNT_URL}/produtos
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


