* Settings *
Documentation       Suite de Teste da Consulta de Produtos


Resource    ${EXECDIR}/resources/Base.robot


* Test Cases *
Search Code Product Store
    ${cod_prod}=        Store Product
    ${response}=        ProductsRoute.GET Product Store          ${cod_prod}

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}
    Should Be Equal As Integers     ${response.json()['cod_prod']}      ${cod_prod}

Search Code Product Fidelity
    ${cod_prod}=        Store Product
    ${response}=        ProductsRoute.GET Product Fidelity       ${cod_prod}

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}
    Should Be Equal As Integers     ${response.json()['cod_prod']}      ${cod_prod}


Search EAN Product Store
    ${ean_prod}=        Store Product EAN
    ${response}=        ProductsRoute.GET Product Store          ${ean_prod}

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}
    Should Be Equal     ${response.json()['cod_barra']}     ${ean_prod}


Search Product Photo B2B
    ${cod_prod}=        Store Product
    ${response}=        ProductsRoute.GET Product Photo          ${cod_prod}

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}
    # Should Be Equal     ${response.json()['ulr']}           https://b2b.multicoisas.com.br//media//catalog//ProductsRoute//k//y//kyw7SG9g1NUn.jpg


Search Code Product Store Invalid
    ${cod_prod}=        Fake Product
    ${response}=        ProductsRoute.GET Product Store          ${cod_prod}

    Status Should Be    404     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso não encontrado


Search Code Product Fidelity Invalid
    ${cod_prod}=        Fake Product
    ${response}=        ProductsRoute.GET Product Fidelity       ${cod_prod}

    Status Should Be    404     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso não encontrado


Search EAN Product Store Invalid
    ${ean_prod}=        Fake Product EAN
    ${response}=        ProductsRoute.GET Product Store          ${ean_prod}

    Status Should Be    404     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso não encontrado


Search Product Photo Nonexistent
    ${cod_prod}=        Fake Product
    ${response}=        ProductsRoute.GET Product Photo          ${cod_prod}

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}