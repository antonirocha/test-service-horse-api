from time import strftime
import pymysql.cursors
from datetime import datetime, timedelta, timezone
import os
import dotenv
from configparser import ConfigParser
import time

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

        today = datetime.now().strftime('%Y-%m-%d')
        var = datetime.now() + timedelta(days=-1)
        yesterday = var.strftime('%Y-%m-%d')

        query1 = "SELECT * FROM RECOCICLO WHERE COD_LOJA = @@SERVER_ID ORDER BY NUMCICLO DESC LIMIT 1;"
        cursor.execute(query1)

        result = cursor.fetchone()
        datafinal = str(result['DATAFINAL'])

        print("\nAjustando Banco de Dados para execução de testes na rota:",os.getenv('RECOUNT_URL'),"\n")
        print("Alterando data da recontagem para:",yesterday,"\n")
        time.sleep(2)


    with connection.cursor() as cursor:
        if datafinal >= today:
            query2 = "UPDATE RECOCICLO SET DATAFINAL = (%s) WHERE COD_LOJA = @@SERVER_ID ORDER BY NUMCICLO DESC LIMIT 1;"
            cursor.execute(query2,(yesterday))
            connection.commit()


def create_recount():
    return {
    'datainicial': str(today),
    'datafinal': config.get('RECOUNT', 'datafinal'),
    'mostrar_estoque': config.get('RECOUNT', 'mostrar_estoque')
}

def recount_itens_pending():
    return {
        "nome_computador": config.get('RECOUNT', 'nome_computador'),
        "status": "Pendente"
    }

def recount_itens_rejected():
    return {
        "nome_computador": config.get('RECOUNT', 'nome_computador'),
        "status": "Rejeitado"
    }

def lauch_item_recount():
    return {
        "nome_computador": config.get('RECOUNT', 'nome_computador'),
        "status": "Rejeitado"
    }


def lauch_item1_recount():
    return {
        'nome_computador': config.get('RECOUNT', 'nome_computador'),
        'descricao': config.get('RECOUNT', 'desc_prod1'),  #Fazer consulta no BD
        'cod_prod': config.get('RECOUNT', 'cod_prod1'),
        'quantestoque': 1000, #Fazer consulta no BD
        'quantcontinf': config.get('RECOUNT', 'qtd_contada1'),
        'local1': "TESTE",
        'local2': "TESTE",
        'contadorid': config.get('RECOUNT', 'contadorid'),
        'status': "Pendente"
    }


def lauch_item2_recount():
    return {
        'nome_computador': config.get('RECOUNT', 'nome_computador'),
        'descricao': config.get('RECOUNT', 'desc_prod2'),  #Fazer consulta no BD
        'cod_prod': config.get('RECOUNT', 'cod_prod2'),
        'quantestoque': 1000, #Fazer consulta no BD
        'quantcontinf': config.get('RECOUNT', 'qtd_contada2'),
        'local1': "TESTE",
        'local2': "TESTE",
        'contadorid': config.get('RECOUNT', 'contadorid'),
        'status': "Pendente"
    }


def delete_item1_recount():
    return {
        'nome_computador': config.get('RECOUNT', 'nome_computador'),
        'cod_prod': config.get('RECOUNT', 'desc_prod1')
    }


def lauch_item2_recount():
    return {
        'nome_computador': config.get('RECOUNT', 'nome_computador'),
        'descricao': config.get('RECOUNT', 'desc_prod2'),  #Fazer consulta no BD
        'cod_prod': config.get('RECOUNT', 'cod_prod2'),
        'quantestoque': 1000, #Fazer consulta no BD
        'quantcontinf': config.get('RECOUNT', 'qtd_contada2'),
        'local1': "TESTE",
        'local2': "TESTE",
        'contadorid': config.get('RECOUNT', 'contadorid'),
        'status': "Pendente"
    }