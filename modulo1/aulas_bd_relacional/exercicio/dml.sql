use pos_puc_mod_1_u1_exercicio;

insert into Cliente(CodCliente, Nome, Endereco, Bairro, Cidade, Estado)
values (1, 'Pedro', 'Rua Henrique Gorceix 539', 'Padre Eustáquio', 'Belo Horizonte', 'MG');

insert into Cliente(CodCliente, Nome, Endereco, Bairro, Cidade, Estado)
values (2, 'Jorge', 'Rua Henrique Gorceix 539', 'Padre Eustáquio', 'Belo Horizonte', 'MG');

insert into Cliente(CodCliente, Nome, Endereco, Bairro, Cidade, Estado)
values (3, 'Milena', 'Rua Henrique Gorceix 539', 'Padre Eustáquio', 'Belo Horizonte', 'MG');

insert into Cliente(CodCliente, Nome, Endereco, Bairro, Cidade, Estado)
values (4, 'Barbara', 'Rua Henrique Gorceix 539', 'Padre Eustáquio', 'Belo Horizonte', 'MG');

insert into Cliente(CodCliente, Nome, Endereco, Bairro, Cidade, Estado)
values (5, 'Paulo', 'Rua Henrique Gorceix 1747', 'Caiçara', 'Belo Horizonte', 'MG');


insert into Genero(CodGenero, Descricao)
values (1, 'Suspense');

insert into Genero(CodGenero, Descricao)
values (2, 'Terror');

insert into Genero(CodGenero, Descricao)
values (3, 'Ação');

insert into Genero(CodGenero, Descricao)
values (4, 'Comédia');

insert into Genero(CodGenero, Descricao)
values (5, 'Drama');


insert into Preco(Cor, Valor)
values ('O', 6.5);

insert into Preco(Cor, Valor)
values ('B', 3);

insert into Preco(Cor, Valor)
values ('P', 5);

insert into Preco(Cor, Valor)
values ('V', 8);

insert into Preco(Cor, Valor)
values ('R', 10);


insert into Filme(CodFilme, Nome, Cor, Status, CodGenero)
values (1, 'As barbas de Salmão', 'B', 0, 5);

insert into Filme(CodFilme, Nome, Cor, Status, CodGenero)
values (2, 'Matrix', 'R', 1, 3);

insert into Filme(CodFilme, Nome, Cor, Status, CodGenero)
values (3, 'As Branquelas', 'B', 0, 4);

insert into Filme(CodFilme, Nome, Cor, Status, CodGenero)
values (4, 'Premonição', 'V', 0, 2);

insert into Filme(CodFilme, Nome, Cor, Status, CodGenero)
values (5, 'Hulk', 'O', 0, 1);


insert into Locacao(CodLocacao, DataLocacao, CodFilme, DataDevolucao)
values (1, '2020-09-08', 2, null);

insert into Locacao(CodLocacao, DataLocacao, CodFilme, DataDevolucao)
values (2, '2020-03-08', 1, '2020-03-23');

insert into Locacao(CodLocacao, DataLocacao, CodFilme, DataDevolucao)
values (3, '2020-02-11', 3, '2020-02-13');

insert into Locacao(CodLocacao, DataLocacao, CodFilme, DataDevolucao)
values (4, '2020-07-01', 4, '2020-07-03');

insert into Locacao(CodLocacao, DataLocacao, CodFilme, DataDevolucao)
values (5, '2020-01-08', 5, '2020-01-15');
