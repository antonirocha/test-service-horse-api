from faker import Faker
faker = Faker()

def open_session():
    return {
        "cod_loja": 158,
        "ipmaquina": "M02",
        "seg_usuarioid": 94158,
        "datahorainicio": "2021-09-10 T12:03:12",
        "situacao": "Aberta"
    }

def close_session():
    return {
        "seg_usuarioid": "94158",
        "sessaocaixaid": 10651158,
        "situacao": "Encerrada"
    }

def permission_session():
    return {
        "mac_address": "C08C71700D33",
        "seg_usuarioid": "94158"
    }

def modify_session():
    return {
        "entidade": "MAC_SESSAO",
        "cod_loja": 158,
        "mac_address": "0215B2000000",
        "ipmaquina": "M02",
        "nome_maquina": "Android SDK built for x86",
        "usuario_solicitante": 94158,
        "status": "Aprovado",
        "chg": "2021-11-17T07:53:55.000Z",
        "newMac_address": "C08C71700D33",
        "newNome_maquina": "moto g(7) play"
}
