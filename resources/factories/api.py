
import os
import dotenv

dotenv.load_dotenv(dotenv.find_dotenv())


def base_url():
    base = os.getenv("BASE_URL")
    return base
base = base_url()

def cart_url():
    cart = os.getenv("CART_URL")
    return cart
cart = cart_url()

def customer_url():
    customer = os.getenv("CUSTOMER_URL")
    return customer
customer = customer_url()

def payment_group_url():
    payment = os.getenv("PAYMENTGROUP_URL")
    return payment
payment = payment_group_url()

def product_url():
    product = os.getenv("PRODUCT_URL")
    return product
product = product_url()

def recount_url():
    recount = os.getenv("RECOUNT_URL")
    return recount
recount = recount_url()

def tag_url():
    tag = os.getenv("TAG_URL")
    return tag
tag = tag_url()

def virtual_url():
    virtual = os.getenv("VIRTUAL_URL")
    return virtual
virtual = virtual_url()


#Testando retorno do arquivo .env
print("\nURL Base:",base)
print("URL Carrinhos:",cart)
print("URL Clientes:",customer)
print("URL Grupos de Pagamento:",payment)
print("URL Produtos:",product)
print("URL Recontagem:",recount)
print("URL Etiquetas:",tag)
print("URL Virtuais:",virtual,"\n")


