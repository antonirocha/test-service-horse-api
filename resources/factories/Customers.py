from faker import Faker
fake = Faker()
import os; import dotenv
from configparser import ConfigParser

dotenv.load_dotenv(dotenv.find_dotenv())

file = 'configSpecs.ini'
config = ConfigParser()
config.read(file)


def search_cpf():
    cpf = config.get('CUSTOMER', 'cpf')
    return cpf
cpf = search_cpf()

def search_cnpj():
    cnpj = config.get('CUSTOMER', 'cnpj')
    return cnpj
cnpj = search_cnpj()

#Testando retorno do arquivo .env
print("\nCPF:",cpf)
print("CNPJ Informado:",cnpj)
