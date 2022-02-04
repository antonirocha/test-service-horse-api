* Settings *
Documentation           Ações da rota /produtos/*


* Keywords *
#Rotas GET
GET Product Store
    ${PRODUCT_URL}=     api.Product Url
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${PRODUCT_URL}/Produtos/${cod_prod}
    ...             expected_status=any

    [return]        ${response}


GET Product RF
    ${PRODUCT_URL}=     api.Product Url
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${PRODUCT_URL}/produtosrf/${cod_prod}
    ...             expected_status=any

    [return]        ${response}


GET Product Fidelity
    ${PRODUCT_URL}=     api.Product Url
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${PRODUCT_URL}/ProdutosFidelidade/${cod_prod}
    ...             expected_status=any

    [return]        ${response}


GET Product Photo
    ${PRODUCT_URL}=     api.Product Url
    [Arguments]     ${cod_prod}

    ${response}=    GET
    ...             ${PRODUCT_URL}/foto/${cod_prod}
    ...             expected_status=any

    [return]        ${response}