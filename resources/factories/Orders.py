
import datetime
from time import strftime
import time
import pymysql.cursors
from datetime import datetime, timezone
import os, dotenv
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
        query1 = "DELETE FROM VIRTUAL_ITEM where NUM_PEDIDO = (%s)";
        cursor.execute(query1,(config.get('VIRTUAL', 'pedidoid')))
        connection.commit()

        query2 = "DELETE FROM PEDCLI where NUM_PEDIDO = (%s)";
        cursor.execute(query2,(config.get('VIRTUAL', 'pedidoid')))
        connection.commit()


    with connection.cursor() as cursor:

        now = datetime.now()

        sql = "SELECT COD_LOJA FROM LOJA WHERE COD_LOJA = @@SERVER_ID;";
        cursor.execute(sql)
        result = cursor.fetchone()
        store = result['COD_LOJA']

        query1 = ("INSERT INTO `VIRTUAL_ITEM` (`NUM_VIRT`, `COD_PROD`, `NUM_PEDIDO`, `QTD_COLETADA`, `QTD_VIRT`, `chg`, `CLASSIF`, `QTD_CHECK`, `INTEGRADO_ERP`, `STATUS_ERP`)"
                  "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)");
        cursor.execute(query1, (config.get('VIRTUAL', 'virtualid'), config.get('VIRTUAL', 'cod_prod1'), config.get('VIRTUAL', 'pedidoid'), '0.00', config.get('VIRTUAL', 'qtd_virtual1'), now, '14', '0.00', '', ''));
        connection.commit()
        cursor.execute(query1, (config.get('VIRTUAL', 'virtualid'), config.get('VIRTUAL', 'cod_prod2'), config.get('VIRTUAL', 'pedidoid'), '0.00', config.get('VIRTUAL', 'qtd_virtual2'), now, '14', '0.00', '', ''));
        connection.commit()

        query2 = ("INSERT INTO `PEDCLI` ( `COD_CLI`, `NUM_PEDIDO`, `COD_PROD`, `QTD_PENDENTE`, `NUM_VIRT`, `QTD_VIRT`, `CLASSIF`, `DATAHORA`, `COD_FORN`, `chg`, `ORDEM`,"
                  "`INTEGRADO_ERP`, `STATUS_ERP`, `NRO_LOTE`, `TIPOCAMPANHAID`, `QTD_ATENDIDA`, `QTD_DISPONIVEL`, `PRAZOPAGID`)"
                  "VALUES  (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)");
        cursor.execute(query2,(store, config.get('VIRTUAL', 'pedidoid'), config.get('VIRTUAL', 'cod_prod1'), config.get('VIRTUAL', 'qtd_coleta1'), config.get('VIRTUAL', 'virtualid'), config.get('VIRTUAL', 'qtd_virtual1'),
                               '14', now, '15', now, '0', 'NULL', 'NULL', '0', '0', '0.00', '0.00', '0'));
        cursor.execute(query2,(store, config.get('VIRTUAL', 'pedidoid'), config.get('VIRTUAL', 'cod_prod2'), config.get('VIRTUAL', 'qtd_coleta2'), config.get('VIRTUAL', 'virtualid'), config.get('VIRTUAL', 'qtd_virtual2'),
                               '14', now, '15', now, '0', 'NULL', 'NULL', '0', '0', '0.00', '0.00', '0'));
        connection.commit()


    with connection.cursor() as cursor:
        query1 = "select * from VIRTUAL_ITEM where NUM_VIRT = (%s)";
        cursor.execute(query1, config.get('VIRTUAL', 'virtualid'))

        query2 = "select * from PEDCLI where NUM_VIRT = (%s)";
        cursor.execute(query2, config.get('VIRTUAL', 'virtualid'))

        result = cursor.fetchall()
        # print("\nSQL Execute:",result)
        # print("\nStore Execute:",store)
        print("\nAjustando Banco de Dados para execução de testes na rota:",os.getenv('VIRTUAL_URL'),"\n")
        time.sleep(2)


def search_virtual():
    number = config.get('VIRTUAL', 'virtualid')
    return number
number = search_virtual()


def update_virtual():
    virtual = {
        "num_virt": config.get('VIRTUAL', 'virtualid'),
            "itensVirtual": [
                        {
                    "num_virt": config.get('VIRTUAL', 'virtualid'),
                    "cod_prod": config.get('VIRTUAL', 'cod_prod1'),
                    "listadepedidos": config.get('VIRTUAL', 'pedidoid'),
                    "qtd_coletada": config.get('VIRTUAL', 'qtd_coleta1'),
                    "qtd_virt": config.get('VIRTUAL', 'qtd_virtual1'),
                    "classif": 14,
                    "qtd_check": 0
                },
                {
                    "num_virt": config.get('VIRTUAL', 'virtualid'),
                    "cod_prod": config.get('VIRTUAL', 'cod_prod2'),
                    "listadepedidos": config.get('VIRTUAL', 'pedidoid'),
                    "qtd_coletada": config.get('VIRTUAL', 'qtd_coleta2'),
                    "qtd_virt": config.get('VIRTUAL', 'qtd_virtual2'),
                    "classif": 14,
                    "qtd_check": 0
                }
            ]
        }
    return virtual