**Settings***
Documentation       Suite de teste de Recontagem de Produtos do MultiApp


Resource    ${EXECDIR}/resources/base.robot


***Test Cases***
Check Recount Cicle
    ${response}         RecountRoute.GET Cicles

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}

    Should Be Equal             ${response.json()['mensagem']}      Recurso não encontrado
    Should Be Equal As Strings  ${response.json()['codigo']}        404

    # IF      "200" in "${response}"
    #     ${numciclo}=    Set Variable    ${response.json()}[numciclo]

    #     IF      ${numciclo} > 0
    #         Status Should Be    OK      ${response}
    #     END

    # END


Create Recount Cicle
    ${payload}=         Recounts.Create Recount
    ${response}=        RecountRoute.POST Insert Cicle      ${payload}

    Status Should Be    201     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso criado com sucesso


Check Recount Date
    ${response}=        RecountRoute.GET Date

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}


Check Itens Recount Pending
    ${payload}=         Recounts.Recount Itens Pending
    ${response}=        RecountRoute.POST Items     ${payload}

    Status Should Be    200        ${response}
    Status Should Be    OK      ${response}


Check Itens Recount Rejected
    ${payload}=         Recounts.Recount Itens Rejected
    ${response}=        RecountRoute.POST Items     ${payload}

    Status Should Be    200     ${response}
    Status Should Be    OK      ${response}


Insert Product 1 Recount
    ${payload}=         Recounts.lauch_item1_recount
    ${response}=        RecountRoute.POST Insert Item        ${payload}

    Status Should Be    201     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso criado com sucesso


Delete Product 1 Incorrect
    ${payload}=         Recounts.delete_item1_recount
    ${response}=        RecountRoute.POST Delete Item       ${payload}

    Status Should Be    200     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso deletado com sucesso


Insert Product 1 Recount
    ${payload}=         Recounts.lauch_item1_recount
    ${response}=        RecountRoute.POST Insert Item        ${payload}

    Status Should Be    201     ${response}
    Should Be Equal     ${response.json()['mensagem']}      Recurso criado com sucesso


Insert Product 2 Recount
    ${payload}=         Recounts.lauch_item2_recount
    ${response}=        RecountRoute.POST Insert Item        ${payload}

    Status Should Be    201     ${response}
        Should Be Equal     ${response.json()['mensagem']}      Recurso criado com sucesso

# Falta o Envio para Analise de 2 produtos

# Falta o Retorno do Processamento para (Rejeitado)

# Falta o Envio para Analise de 2 produtos novamente

# Falta o Processamento da Recotagem (Quebra Simulada)


