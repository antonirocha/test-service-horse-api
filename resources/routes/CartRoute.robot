* Settings *
Documentation           Ações da rota /carrinhos/*


* Keywords *
#Rotas GET
GET All Carts
    [Arguments]
    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/carrinhos
    ...             expected_status=any

    [return]        ${response}


GET Cart ID
    [Arguments]     ${cart_id}

    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/carrinho/${cart_id}
    ...             expected_status=any

    [return]        ${response}


GET Cart Credits Product
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/creditos/${cod_prod}
    ...             expected_status=any

    [return]        ${response}


GET Cart Loyalty Product
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/Produtos/${cod_prod}
    ...             expected_status=any

    [return]        ${response}


GET Cart Loyalty Product
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/ProdutosFidelidade/${cod_prod}
    ...             expected_status=any

    [return]        ${response}


GET Cart Docs Eletronics
    [Arguments]

    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/notasFiscais
    ...             expected_status=any

    [return]        ${response}


GET Cart Transports
    [Arguments]

    ${response}=    GET
    ...             ${API_URL_HORSE}/carrinhos/transportadoras
    ...             expected_status=any

    [return]        ${response}


# Rotas POST
POST Cart Auth
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/carrinhos/autorizacao
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Cart Payment Types
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/carrinhos/meioscobranca
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


POST Cart Total Credts
    [Arguments]     ${payload}

    ${response}=    POST
    ...             ${API_URL_HORSE}/carrinhos/saldo
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response}


