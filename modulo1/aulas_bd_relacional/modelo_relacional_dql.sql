select distinct codcliente from Conta;

select NomEmp, Cargo
from Empregado
where bairro like 'Savassi';

select NomEmp, Cargo
from Empregado
where NomEmp like '_a%';

select *
from Empregado
where (Salario between 30000 and 40000) and CodDepto = 1;

select *
from Empregado
where (Salario between 30000 and 40000) or CodDepto = 1;

select *
from Empregado
where Cargo in ('Vendedor', 'Presidente');

select *
from Empregado
where Comissao is not null and CodDepto = 1;

select max(Salario), min(Salario), sum(Salario), avg(Salario), count(Salario)
from Empregado;

select NomEmp
from Empregado 
order by NomEmp; # ASC

select NomEmp
from Empregado 
order by NomEmp desc; # ASC

select CodDepto, count(*), avg(Salario)
from Empregado 
group by CodDepto;

select P.CodProjeto, P.ProjNome, count(*)
from Projeto P
inner join Trabalha_Em T on P.CodProjeto = T.CodProjeto 
group by P.CodProjeto, P.ProjNome;

select P.CodProjeto, P.ProjNome, count(*)
from Projeto P
inner join Trabalha_Em T on P.CodProjeto = T.CodProjeto 
group by P.CodProjeto, P.ProjNome
having count(*) >= 2;

select NomEmp
from Empregado
where SalarioBruto = (
	select max(Salario)
	From Empregado
);

#Sem pé nem cabeça, exemplo da aula
select distinct MatEmp, Horas
from Trabalha_Em
where Horas in (
	select Horas
	from Trabalha_Em
    where MatEmp = '10'
);

select NomEmp
from Empregado
where Salario > ALL(
	select Salario
	from Empregado
    where CodDepto = 2
);

select NomEmp
from Empregado as E
where E.MatEmp IN (
	select MatEmp
	from Dependente
    where Sexo = E.Sexo
);

select E.NomEmp, E.EndEmp from Empregado E
inner join Departamento D on E.CodDepto = D.CodDepto
where D.DeptoNome like 'Pesquisa';

select * from Empregado E
left outer join Departamento D on E.CodDepto = D.CodDepto;

select * from Empregado E
full outer join Departamento D on E.CodDepto = D.CodDepto;

select * from Empregado E
right outer join Departamento D on E.CodDepto = D.CodDepto;

#Produto Cartesiano
select * from Empregado E
cross join Departamento D;

select E.NomEmp, P.ProjNome from Empregado E
inner join Trabalha_Em T on E.MatEmp = T.MatEmp
inner join Projeto P on T.CodProjeto = P.CodProjeto;
