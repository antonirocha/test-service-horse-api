*Settings*
Documentation   Aqui é onde tudo começa...

Library     Collections
Library     String
Library     RequestsLibrary

Library     ${EXECDIR}/resources/factories/api.py
Library     ${EXECDIR}/resources/factories/Customers.py
Library     ${EXECDIR}/resources/factories/Products.py
Library     ${EXECDIR}/resources/factories/Recounts.py
Library     ${EXECDIR}/resources/factories/Orders.py
Library     ${EXECDIR}/resources/factories/Tags.py

Resource    routes/ClientRoute.robot
Resource    routes/ProductsRoute.robot
Resource    routes/RecountRoute.robot
Resource    routes/VirtualRoute.robot
Resource    routes/TagRoute.robot
