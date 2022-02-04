* Settings *
Documentation           Ações da rota /etiquetas/*


* Keywords *
# Rotas POST
POST Print Tag
    ${TAG_URL}=     api.Tag Url
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${TAG_URL}/etiqueta
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}