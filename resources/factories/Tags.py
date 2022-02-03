from itertools import product
import os
import dotenv
import pymysql.cursors
from configparser import ConfigParser

dotenv.load_dotenv(dotenv.find_dotenv())

file = 'configSpecs.ini'
config = ConfigParser()
config.read(file)


connection = pymysql.connect(
    host = os.getenv("DB_HOST"),
    port = int(os.getenv("DB_PORT")),
    user = os.getenv("DB_USER"),
    database = os.getenv("DB_NAME"),
    password = os.getenv("DB_PASS"),
    cursorclass = pymysql.cursors.DictCursor)


with connection:
    with connection.cursor() as cursor:

        query1 = "SELECT * FROM PRODUTOS WHERE COD_PROD = (%s);"
        cursor.execute(query1,config.get('TAG', 'cod_prod1'))

        result = cursor.fetchone()
        product1 = result['DESCCURTA']
        print("\nDescrição Produto 1:",product1)


        def print_tag_product1():
            product = [
                {
                    "preco_venda": config.get('TAG', 'pricing1'),
                    "preco_campanha": 0,
                    "campanha_ativa": "N",
                    "beneficio": "- CONQUISTOU O PRÊMIO \\\"OURO AZUL\" COMO PRODUTO ECOLOGICAMENTE CORRETO, POIS ECONOMIZA ÁGUA POTÁVEL;\r\n- É SIMPLES, MAS SEU RESULTADO É SURPREENDENTE: GELA POR MAIS TEMPO QUE O GELO CONVENCIONAL COM A VANTAGEM DE NÃO ALTERAR O SABOR E A CONSISTÊNCIA DA BEBIDA;\r\n- O GELO ABSOLUTO É REUTILIZÁVEL\r\n- TOME UMA ATITUDE ECOLOGICAMENTE CORRETA E ECONOMICAMENTE PERFEITA, EXPERIMENTE.\r\n",
                    "caracteristica": "- MATERIAL: PELÍCULA ESPECIAL DE SILICONE E POLIETILENO ENVOLVENDO ÁGUA FILTRADA;\r\n- ATÓXICO;\r\n- PRÁTICO;\r\n- ECONÔMICO;\r\n- INCOLOR;\r\n- EMBALAGEM COM 80 UNIDADES.\r\n",
                    "descricao": "GELO REUTILIZAVEL AVULSO INCOL.ABSO",
                    "desccurta": product1,
                    "cod_prod": config.get('TAG', 'cod_prod1'),
                    "unidade": "UN",
                    "cod_barra": "",
                    "local1": "TESTE",
                    "quant_est_comerc": 999,
                    "url": "",
                    "local2": "",
                    "preco_fidelidade": 0,
                    "custo_medio": 3,
                    "quant_defeitos": 100,
                    "qtdpedida": 0,
                    "qtdedispitf": 0,
                    "qtdEtiqueta": config.get('TAG', 'qtd_prod1'),
                    "cod_ncm": 0,
                    "cod_cest": "",
                    "origem": "",
                    "controlado": "TSNNenhum",
                    "substituicaoid": 0,
                    "convenioid": 0,
                    "grupo": "",
                    "subGrupo": "",
                    "previsao_chegada": "",
                    "preco_itf": 0,
                    "preco_Transferencia": 0,
                    "preco_itf_loja": 0,
                    "preco_Transferencia_loja": 0,
                    "inconsistencia": ""
                }
            ]
            return product

    connection.commit()

    with connection.cursor() as cursor:

        query1 = "SELECT DESCCURTA FROM PRODUTOS WHERE COD_PROD = (%s);"
        cursor.execute(query1,config.get('TAG', 'cod_prod2'))

        result = cursor.fetchone()
        product2 = result['DESCCURTA']
        print("Descrição Produto 2:",product2,)


        def print_tag_product2():
            product = [
                {
                    "preco_venda": config.get('TAG', 'pricing2'),
                    "preco_campanha": 0,
                    "campanha_ativa": "N",
                    "beneficio": "- CONQUISTOU O PRÊMIO \\\"OURO AZUL\" COMO PRODUTO ECOLOGICAMENTE CORRETO, POIS ECONOMIZA ÁGUA POTÁVEL;\r\n- É SIMPLES, MAS SEU RESULTADO É SURPREENDENTE: GELA POR MAIS TEMPO QUE O GELO CONVENCIONAL COM A VANTAGEM DE NÃO ALTERAR O SABOR E A CONSISTÊNCIA DA BEBIDA;\r\n- O GELO ABSOLUTO É REUTILIZÁVEL\r\n- TOME UMA ATITUDE ECOLOGICAMENTE CORRETA E ECONOMICAMENTE PERFEITA, EXPERIMENTE.\r\n",
                    "caracteristica": "- MATERIAL: PELÍCULA ESPECIAL DE SILICONE E POLIETILENO ENVOLVENDO ÁGUA FILTRADA;\r\n- ATÓXICO;\r\n- PRÁTICO;\r\n- ECONÔMICO;\r\n- INCOLOR;\r\n- EMBALAGEM COM 80 UNIDADES.\r\n",
                    "descricao": "GELO REUTILIZAVEL AVULSO INCOL.ABSO",
                    "desccurta": product2,
                    "cod_prod": config.get('TAG', 'cod_prod2'),
                    "unidade": "UN",
                    "cod_barra": "",
                    "local1": "TESTE",
                    "quant_est_comerc": 999,
                    "url": "",
                    "local2": "",
                    "preco_fidelidade": 0,
                    "custo_medio": 3,
                    "quant_defeitos": 100,
                    "qtdpedida": 0,
                    "qtdedispitf": 0,
                    "qtdEtiqueta": config.get('TAG', 'qtd_prod2'),
                    "cod_ncm": 0,
                    "cod_cest": "",
                    "origem": "",
                    "controlado": "TSNNenhum",
                    "substituicaoid": 0,
                    "convenioid": 0,
                    "grupo": "",
                    "subGrupo": "",
                    "previsao_chegada": "",
                    "preco_itf": 0,
                    "preco_Transferencia": 0,
                    "preco_itf_loja": 0,
                    "preco_Transferencia_loja": 0,
                    "inconsistencia": ""
                }
            ]
            return product

    connection.commit()