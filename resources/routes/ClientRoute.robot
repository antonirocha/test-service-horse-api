* Settings *
Documentation           Ações da rota /cliente/*


* Keywords *
#Rotas GET
GET Customer
    ${CUSTOMER_URL}=    api.Customer Url
    [Arguments]     ${cpf}

    ${response}=    GET
    ...             ${CUSTOMER_URL}/cliente/${cpf}
    ...             expected_status=any

    [return]        ${response}


#Rotas POST
POST Register Customer
    ${CUSTOMER_URL}=    api.Customer Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${CUSTOMER_URL}/cliente
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}