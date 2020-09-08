select F.Nome from Filme F
inner join Genero G on F.CodGenero = G.CodGenero
where F.status = 1;

select F.Nome, F.CodFilme, L.DataLocacao from Filme F
inner join Locacao L on L.CodFilme = F.CodFilme
where L.DataDevolucao is null;

select F.CodFilme, F.Nome, P.Valor from Filme F
inner join Genero G on F.CodGenero = G.CodGenero
inner join Preco P on F.Cor = P.Cor
where G.Descricao = 'Terror'

select F.CodFilme, F.Nome, C.CodCliente, C.Nome from Filme F
inner join Locacao L on L.CodFilme = F.CodFilme
inner join Cliente C on C.CodCliente = L.CodCliente
inner join Genero G on F.CodGenero = G.CodGenero
where G.Descricao like 'Ação' and C.Cidade like 'Belo Horizonte';

select F.CodFilme, F.Nome from Filme F
where F.Cor = (select Cor from Filme where Nome like 'As Branquelas')

select C1.CodCliente, C1.Nome from Cliente C1
where Estado in (
	select Estado from Cliente C
    inner join Locacao L on C.CodCliente = L.CodCliente
    where L.DataLocacao between '2020-01-01' and '2020-04-01'
)

select C.CodCliente, C.Nome, count(*) from Cliente C
inner join Locacao L on C.CodCliente = L.CodCliente
group by C.CodCliente, C.Nome
having count(*) >= (
	select count(*) from Locacao
    where CodCliente = 1
)

select F.CodFilme, F.Nome from Filme F
where F.Cor in (
	select F1.Cor from Filme F1
    inner join Genero G on F1.CodGenero = G.CodGenero
    where G.Descricao like 'Comédia'
)
