import json
from pymongo import MongoClient
from datetime import datetime
from pprint import pprint
import re


def read_json_file(path):
    with open(path) as json_file:
        data = json.load(json_file)
        return data


def execute_queries(db):
    for e in db.albuns.find({"nome": {'$regex': re.compile(r'of', re.I)}}):
        pprint(e)

    for e in db.albuns.find({"nome": {'$regex': re.compile(r'of', re.I)}}):
        pprint(e)

    for e in db.albuns.find({"nome": "Seventh Son of a Seventh Son"}):
        pprint(e)

    for e in db.albuns.find({"duracao": {"$lt": 1800}}):
        pprint(e)

    for e in db.albuns.find({"duracao": {"$in": [1738, 3013]}}):
        pprint(e)

    pprint(db.albuns.find_one(
        {"$and": [
            {"dataLancamento": {"$gte": datetime.strptime(
                "01/01/1986", "%d/%m/%Y")}},
            {"dataLancamento": {"$lt": datetime.strptime(
                "01/01/1987", "%d/%m/%Y")}}
        ]}))

    for e in db.albuns.find({"idartista": 3}):
        pprint(e)

    for e in db.albuns.find({"artista.nome": "Nirvana"}):
        pprint(e)


if __name__ == "__main__":
    json_data = read_json_file('json/albuns.json')

    client = MongoClient('mongodb://localhost:27017/')

    db = client.aula_puc
    db.albuns.drop()
    db.artistas.drop()

    for e in json_data:
        for a in e.keys():
            if a.startswith("data"):
                e[a] = datetime.strptime(e[a], "%d/%m/%Y")

    db.albuns.insert_many(json_data)

    db.albuns.remove({"nome": "Master of Puppets"})

    db.albuns.update({"nome": "Seventh Son of a Seventh Son"},
                     {"$set": {"duracao": 3013}, "$unset": {"estudioGravacao": ""}})

    db.artistas.insert_many(read_json_file('json/artistas.json'))

    db.albuns.update({"nome": "Seventh Son of a Seventh Son"},
                     {"$set": {"duracao": 3013}, "$unset": {"estudioGravacao": ""}})

    db.albuns.update({"nome": "...And Justice For All"},
                     {"$set": {"artista":
                               {"id": 2, "nome": "Megadeath"}}})

    db.albuns.update({"nome": "Nervermind"},
                     {"$set": {"artista":
                               {"id": 6, "nome": "Nirvana"}}})

    db.albuns.update({"nome": "The Dark Side Of the Mon"},
                     {"$set": {"idartista": 7}})

    db.albuns.update({"nome": "Among the Living"},
                     {"$set": {"idartista": 3}})

    with client.start_session() as session:
        with session.start_transaction():
            db.albuns.update({"nome": "Seventh Son of a Seventh Son"},
                             {"$set": {"idartista": 3}})

            db.albuns.update({"nome": "Reign in Blood"},
                             {"$set": {"idartista": 4}})

    execute_queries(db)
