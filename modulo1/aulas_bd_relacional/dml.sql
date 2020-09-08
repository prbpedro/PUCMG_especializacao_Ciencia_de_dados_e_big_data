use pos_puc_mod_1_aulas;

delete from Dependente; 
delete from Empregado;

insert into Empregado(MatEmp, NomEmp, EndEmp, CidEmp)
values (11, 'Pedro', 'Endereço', 'SP');

insert into Empregado(MatEmp, NomEmp, EndEmp, CidEmp)
values (12, 'Paulo', 'Endereço', 'SP');

insert into Dependente(NomDep, DatNasDep, MatEmp, Sexo)
values ('PedroDep', '2020-01-01', 11, 'M');

update Dependente set Sexo = 'F' where MatEmp = 11 and NomDep like 'PedroDep';

update Empregado set Salario=1000, Comissao=10 where MatEmp = 11;

update Empregado set Salario=3000, Comissao=350 where MatEmp = 12;

delete from Dependente where NomDep like 'PedroDep';
