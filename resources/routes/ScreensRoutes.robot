* Settings *
Documentation           Ações da rota /seg_tela/*


* Keywords *
#Rotas GET
GET Screens
    [Arguments]     ${id}

    ${response}=    GET
    ...             ${API_URL_HORSE}/seg_tela/telas/${id}
    ...             expected_status=any

    [return]        ${response}
