match(m:Movie)
where m.released <= 1999 and m.released >=1990
return m.title

match(p:Person)-[r]-(m:Movie{title: "Cloud Atlas"})
return p.name

MATCH (p:Person{name:"Kevin Bacon"})-[*1..3]->(m)
RETURN m

MATCH (kb:Person { name: 'Kevin Bacon' }),(mr:Person { name: 'Meg Ryan' }), p = shortestPath((kb)-[*]-(mr))
RETURN p
