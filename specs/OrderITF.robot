* Settings *
Documentation       Suite de testes de consultas e alterações de Virtuais.


Resource    ${EXECDIR}/resources/Base.robot


* Test Cases *
Search Virtual
    ${num_virt}=        Orders.Search Virtual
    ${response}=        VirtualRoute.GET Virtual        ${num_virt}

    Status Should Be    200         ${response}
    Status Should Be    OK          ${response}

    Should Be Equal As Strings      ${response.json()['num_virt']}      ${num_virt}


Search Virtual Invalid
    ${response}=        VirtualRoute.GET Virtual        12345

    Status Should Be    404         ${response}

    Should Be Equal     ${response.json()['mensagem']}         Recurso não encontrado


Save Virtual
    &{send_virtual}=    Orders.Update Virtual
    ${response}=        VirtualRoute.PUT Virtual       ${send_virtual}

    Status Should Be    201         ${response}
    Should Be Equal As Integers     ${response.json()['num_virt']}      ${send_virtual.num_virt}