from py2neo import Graph, Node, Relationship
from py2neo import Graph


def get_user_node(name):
    n = Node("Usuario", name=name, age=1)
    n.__primarylabel__ = "Usuario"
    n.__primarykey__ = "name"
    return n


def delete_by_name(data, type):
    if data and len(data) > 0:
        for e in data:
            graphdb.evaluate("DROP " + type + " " + e["name"])


graphdb = Graph("http://localhost:7474/db/data/",
                user="neo4j", password="neo4j")

delete_by_name(graphdb.run("CALL db.constraints()").data(), "CONSTRAINT")
delete_by_name(graphdb.run("CALL db.indexes()").data(), "INDEX")

del_cql = """MATCH (n)
optional match (n)-[r]-()
DELETE r, n"""
graphdb.run(del_cql)

# Primary key like constraints
constraint_un_name_usuario = "CREATE CONSTRAINT constraint_un_name_usuario ON (n:Usuario) ASSERT n.name IS UNIQUE"
graphdb.evaluate(constraint_un_name_usuario)

# Constraint unique já cria index btree
# index_usuario_name = "CREATE INDEX ON :Usuario(name)"
# graphdb.evaluate(index_usuario_name)

# enterprise
# constraint_ex_name_usuario = "CREATE CONSTRAINT constraint_ex_name_usuario ON (n:Usuario) ASSERT exists(n.name)"
# graphdb.evaluate(constraint_ex_name_usuario)

alice = get_user_node("Alice")
bob = get_user_node("Bob")
lea = get_user_node("Lea")
ana = get_user_node("Ana")
joel = get_user_node("Joel")

tx = graphdb.begin()
with tx:
    tx.create(alice)
    tx.create(bob)
    tx.create(lea)
    tx.create(ana)
    tx.create(joel)

follows_rel = Relationship.type("follows")


graphdb.merge(Relationship(bob, "follows", alice, cost=1))
graphdb.merge(Relationship(ana, "follows", bob, cost=1))
graphdb.merge(Relationship(alice, "follows", lea, cost=1))
graphdb.merge(Relationship(alice, "follows", joel, cost=1))
graphdb.merge(Relationship(ana, "follows", alice, cost=10))


cypher_query = "match(u:Usuario{name:\"%s\"})-[r:follows]->(m:Usuario) return u, type(r) as r, m"
for r in graphdb.run(cypher_query % "Bob").data():
    print("(%s)-[%s]-(%s)" % (r["u"]["name"], r["r"], r["m"]["name"]))


# Dijkstra Shortest Path algorithm
dijkstra_match = """MATCH (start:Usuario {name: '%s'}), (end:Usuario {name: '%s'})
CALL gds.alpha.shortestPath.write({
  nodeProjection: 'Usuario',
  relationshipProjection: {
    follows: {
      type: 'follows',
      properties: 'cost',
      orientation: 'UNDIRECTED'
    }
  },
  startNode: start,
  endNode: end,
  relationshipWeightProperty: 'cost',
  writeProperty: 'sssp'
})
YIELD nodeCount, totalCost
RETURN nodeCount,totalCost"""
for r in graphdb.run(dijkstra_match % ("Ana", "Lea")).data():
    print(r["nodeCount"], r["totalCost"])
