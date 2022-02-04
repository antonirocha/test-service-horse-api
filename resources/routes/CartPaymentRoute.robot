* Settings *
Documentation           Ações da rota /grupospagamento/*


* Keywords *
# Rotas GET
GET Cart Payment Groups
    [Arguments]     ${params}

    ${response}=    GET
    ...             ${API_URL_HORSE}/grupospagamento/carrinhopagtogrupos
    ...             expected_status=any

    [return]        ${response}