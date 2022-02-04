* Settings *
Documentation           Ações da rota /cadastro/*


* Keywords *
#Rotas GET
GET Customer
    [Arguments]     ${id}

    ${response}=    GET
    ...             ${API_URL_HORSE}/cadastro/admin/${id}
    ...             expected_status=any

    [return]        ${response}


GET Register
    [Arguments]     ${id}

    ${response}=    GET
    ...             ${API_URL_HORSE}/cadastro/cadastro/${id}
    ...             expected_status=any

    [return]        ${response}


GET Permissions
    [Arguments]     ${id}

    ${response}=    GET
    ...             ${API_URL_HORSE}/cadastro/permissoes/${id}
    ...             expected_status=any

    [return]        ${response}


#Rotas POST
POST Registers
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/cadastro/cadastros
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Forgot Password
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/cadastro/forgot_password
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Register List
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/cadastro/listacadastro
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Login
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/cadastro/login
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Reset Password
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/cadastro/reset_password
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


# Rotas PUT
PUT Emails
    [Arguments]     ${payload}

    ${response}=    PUT
    ...             ${API_URL_HORSE}/cadastro/emails
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}