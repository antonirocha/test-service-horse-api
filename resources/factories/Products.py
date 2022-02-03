from faker import Faker
faker = Faker()
import os; import dotenv
from configparser import ConfigParser

dotenv.load_dotenv(dotenv.find_dotenv())

file = 'configSpecs.ini'
config = ConfigParser()
config.read(file)


def store_product():
    sp = config.get('PRODUCTS', 'cod_prod_store')
    return sp
sp = store_product()


def store_product_EAN():
    spe = config.get('PRODUCTS', 'ean_prod_store')
    return spe
spe = store_product_EAN()


def rf_product():
    rp = config.get('PRODUCTS', 'cod_prod_rf')
    return rp
rp = rf_product()


def rf_product_EAN():
    rpe = config.get('PRODUCTS', 'ean_prod_rf')
    return rpe
rpe = rf_product_EAN()


def fake_product():
    fp = config.get('PRODUCTS', 'cod_prod_fake')
    return fp
fp = fake_product()


def fake_product_EAN():
    fpe = config.get('PRODUCTS', 'ean_prod_fake')
    return fpe
fpe = fake_product_EAN()


#Testando retorno do arquivo .env
print("\nProduto Loja:",sp)
print("Barra Loja:",spe)
print("Produto RF:",rp)
print("Barra RF:",rpe)
print("Produto Fake:",fp)
print("Barra Fake:",fpe,"\n")