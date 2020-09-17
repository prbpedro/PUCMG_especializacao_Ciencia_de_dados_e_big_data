from neo4j import GraphDatabase

uri = "neo4j://localhost:7687"
driver = GraphDatabase.driver(uri, auth=("neo4j", "neo4j"))


def create_user(tx, name):
    tx.run("merge(a:user{name:$name})", name=name)


def create_relationship(tx, u1name, rname, u2name):
    tx.run(
        "match(a:user{name:$u1name}) match(b:user{name:$u2name}) create(a)-[r:" + rname + "]->(b)", u1name=u1name, u2name=u2name)


with driver.session() as session:
    session.write_transaction(create_user, "Joao")
    session.write_transaction(create_user, "Maria")
    session.write_transaction(create_relationship, "Joao", "namora", "Maria")

driver.close()
