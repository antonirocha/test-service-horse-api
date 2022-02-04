* Settings *
Documentation           Ações da rota /fraqueado/*


* Keywords *
#Rotas GET
GET Lojas
    [Arguments]     ${cadastro_id}

    ${response}=    GET
    ...             ${API_URL_HORSE}/fraqueado/lojas/${cadastro_id}
    ...             expected_status=any

    [return]        ${response}


#Rotas PUT
PUT Virtual
    [Arguments]     ${payload}

    ${response}=    PUT
    ...             ${API_URL_HORSE}/fraqueado/fluxo
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}