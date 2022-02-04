* Settings *
Documentation           Ações da rota /virtuais/*

* Keywords *
# Rotas GET
GET Virtual
    ${VIRTUAL_URL}=     api.Virtual Url
    [Arguments]     ${num_virt}

    ${response}=    GET
    ...             ${VIRTUAL_URL}/busca/${num_virt}
    ...             expected_status=any

    [return]        ${response}

# Rotas PUT
PUT Virtual
    ${VIRTUAL_URL}=     api.Virtual Url
    [Arguments]     ${payload}

    ${response}=    PUT
    ...             ${VIRTUAL_URL}/virtual
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}