//Criação de nós
create(dylan:Musico{nome: 'Bob Dylan', data_nascimento: '1941-05-24'})
create(hendrix:Musico{nome: 'Jimi Hendrix'})
create(al_along:Musica{nome: 'All Along the Watchtower'})

//Criação de relacionamentos
MATCH (d:Musico {nome: 'Bob Dylan'})
MATCH(al_along:Musica {nome: 'All Along the Watchtower'})
create(d)-[r:gravou]->(al_along)
create(d)-[r:compos]->(al_along)

//Seleção - Todos os nós de um tipo
MATCH (m:Musico {})
return m

//Seleção - Todos os nós
MATCH (m)
return m

//Seleção - Filtro com clausula where
MATCH (m:Musico)
where m.nome = 'Bob Dylan'
return m

//Seleção - Filtro sem clausula where
MATCH (m:Musico{nome: 'Bob Dylan'})
return m

//Seleção - Todos os nós
MATCH (m)
return m

//Seleção - Nós com grau de saída
match(n1)-[compos]->()
return n1

//Seleção - Nós com grau de entrada
match(n1)<-[]-()
return n1

//Seleção -  Nós com grau de saída
match(n1)-[]-()
return n1

//Seleção - Nós com relacionamento compos
match(n1)-[r:compos]->()
return n1

//Seleção - Contagem dos nós com relacionamentos do tipo compos
match(n1)-[r:compos]->()
return count(n1)

//Seleção - Nós do tipo Músico, nós do tipo Música e o tipo de relacionamento dos mesmos, filtrados pelo tipos de nós e tipo de relacionamento
MATCH (m:Musico)-[r:gravou]-(n:Musica)
return m, n, type(r)

//Deleção - todos os relacionamentos de um nó tipo Musico com filtro em atributo
match(m:Musico{nome: 'Jimi Hendrix'})-[r]-()
DELETE r

//Deleção - Nó(s) filtrado(s) 
match(hendrix:Musico{nome: 'Jimi Hendrix'})
DELETE hendrix

//Deleção - Todos os relacionamentos
MATCH ()-[r]-()
DELETE r

//Deleção - Todos os nós
MATCH (n)
DELETE n

//Deleção - Todos a base de dados
MATCH (n)
optional match (n)-[r]-()
DELETE r, n

//Atualização - Nó(s) filtrado(s) com inserção/update de campo específico
match(hendrix:Musico{nome: 'Jimi Hendrix'})
set hendrix.data_nascimento='1942-11-27'

//Atualização - Nó(s) filtrado(s)  com remoção de campo específico
match(hendrix:Musico{nome: 'Jimi Hendrix'})
set hendrix.data_nascimento=null

//Seleciona todos os relacionamentos de um nó tipo Musico com filtro em atributo
match(m:Musico{nome: 'Jimi Hendrix'})-[r]-()
return m, type(r)

//Carregando CSV fazendo merge dos dados iguais
load csv with headers 
from "file:///musicadb/composicoes.csv"
as linha
merge(compositor:Musico{nome: linha.compositor})
merge(musica:Musica{nome: linha.musica})
merge(compositor)-[:compos]->(musica)

//Seleção - todos os musicos que gravaram musicas que foram compostas por um musico
match(m:Musico)-[g:gravou]->(ma:Musica)<-[c:compos]-(m2:Musico)
return m, ma, m2

//Cria índice hash para campo específico
CREATE INDEX ON :Product(productID)
CREATE INDEX ON :Category(categoryID)
CREATE INDEX ON :Supplier(supplierID)

//Carregando CSV fazendo create
load csv with headers 
from "file:///northwind/products.csv"
as row
create(n:Product)
set n=row,
n.unitPrice = toFloat(row.unitPrice),
n.unitsInStock = toInteger(row.unitsInStock),
n.unitsOnOrder = toInteger(row.unitsOnOrder),
n.reorderLevel = toInteger(row.reorderLevel),
n.discontinued = (row.discontinued <> 0)

load csv with headers 
from "file:///northwind/categories.csv"
as row
create(n:Category)
set n=row

load csv with headers 
from "file:///northwind/suppliers.csv"
as row
create(n:Supplier)
set n=row


//Criação de relacionamentos entre nós
match(p:Product), (c:Category)
where p.categoryID = c.categoryID
create (p)-[:PART_OF]->(c);

match(p:Product), (c:Supplier)
where p.supplierID = c.supplierID
create (c)-[:SUPPLIES]->(p);

//Seleciona o nome das companias com as categorias de podutos fornecidas por esta
match (s:Supplier)-->(:Product)-->(c:Category)
return s.companyName, collect(distinct c.categoryName)

//Seleciona o nome do fornecer que tem produtos da categoria de nome Produce
match (c:Category{categoryName: "Produce"})<--(p:Product)<--(s:Supplier)
return distinct s.companyName as ProductSupplier

//Dropa os indexes
drop index on:Product(productID)
drop index on:Category(categoryID)
drop index on:Supplier(supplierID)
