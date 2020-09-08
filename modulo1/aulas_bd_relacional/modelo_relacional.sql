use pos_puc_mod_1_aulas;

DROP TABLE IF EXISTS Dependente;
DROP TABLE IF EXISTS Trabalha_Em;
DROP TABLE IF EXISTS Conta;
DROP TABLE IF EXISTS Projeto;
DROP TABLE IF EXISTS Empregado;
DROP TABLE IF EXISTS Departamento;

Create table Empregado
(
   MatEmp smallint not null,
   NomEmp char(30) not null,
   EndEmp char(80) null,
   CidEmp char(20) null,
   Bairro char(20) null,
   Cargo char(20) null,
   Sexo char(2) null,
   Comissao float null,
   Salario float null,
   SalarioBruto float null,
   CodDepto smallint,
   CodSupervisor smallint,
   Constraint PK_EMP primary Key(MatEmp)
);

Create table Departamento
(
   CodDepto smallint not null,
   DeptoNome char(30) not null,
   Constraint PK_DEPART primary Key(codDepto)
);

Create table Projeto
(
   CodProjeto smallint not null,
   ProjNome char(30) not null,
   Constraint PK_PROJ primary Key(CodProjeto)
);

Create table Conta
(
   CodConta smallint not null,
   CodCliente smallint not null,
   Constraint PK_CONTA primary Key(CodConta)
);

Create table Trabalha_Em
(
   MatEmp smallint not null,
   CodProjeto smallint not null,
   Horas float not null,
   Constraint PK_TRAB primary Key(MatEmp, CodProjeto)
);

Create table Dependente
(
   NomDep char(30),
   DatNasDep date,
   MatEmp smallint,
   Sexo char(2) null,
   Constraint PK_DEP primary Key (MatEmp, NomDep)
);

Alter table Dependente ADD constraint FK_EMP_DEP foreign key (MatEmp) references Empregado (MatEmp);

Alter table Empregado ADD constraint FK_EMP_DEPART foreign key (CodDepto) references Departamento (codDepto);

Alter table Empregado ADD constraint FK_EMP_SUP foreign key (CodSupervisor) references Empregado (MatEmp);

Alter table Conta ADD constraint FK_CONTA_EMP foreign key (CodCliente) references Empregado (MatEmp);

Alter table Trabalha_Em ADD constraint FK_TRAB_EMP foreign key (MatEmp) references Empregado (MatEmp);

Alter table Trabalha_Em ADD constraint FK_TRAB_PROJ foreign key (CodProjeto) references Projeto (CodProjeto);

INSERT INTO Departamento (codDepto, deptoNome) 
VALUES (1, 'Pesquisa');

INSERT INTO Departamento (codDepto, deptoNome) 
VALUES (2, 'TI');

INSERT INTO Departamento (codDepto, deptoNome) 
VALUES (3, 'Matemática');

INSERT INTO Departamento (codDepto, deptoNome) 
VALUES (4, 'Estatística');

INSERT INTO Empregado (MatEmp, NomEmp, EndEmp , CidEmp, Bairro, Cargo, Sexo, Comissao, Salario, SalarioBruto, CodDepto, CodSupervisor) 
VALUES (11, 'Maria Ramos', 'Rua Y', 'Belo Horizonte', 'Savassi', 'Presidente', 'F', 10, 35000, 35000, 1, null);

INSERT INTO Empregado (MatEmp, NomEmp, EndEmp , CidEmp, Bairro, Cargo, Sexo, Comissao, Salario, SalarioBruto, CodDepto, CodSupervisor) 
VALUES (10, 'Marcos Ramos', 'Rua X', 'Itabira', 'Ita', 'Vendedor', 'M', 10, 1000, 1000, 1, 11);

INSERT INTO Empregado (MatEmp, NomEmp, EndEmp , CidEmp, Bairro, Cargo, Sexo, Comissao, Salario, SalarioBruto, CodDepto, CodSupervisor) 
VALUES (12, 'José Silva', 'Rua S', 'Belo Horizonte', 'Savassi', 'Vendedor', 'M', 10, 1000, 1000, 2, 11);

INSERT INTO Empregado (MatEmp, NomEmp, EndEmp , CidEmp, Bairro, Cargo, Sexo, Comissao, Salario, SalarioBruto, CodDepto, CodSupervisor) 
VALUES (13, 'Ana', 'Rua A', 'Belo Horizonte', 'Pampulha', 'Vendedor', 'F', 10, 1000, 1000, null, 11);

INSERT INTO Dependente (NomDep, DatNasDep, MatEmp, Sexo) 
VALUES ('Carlos Ramos', '2003-01-10',10, 'M');

INSERT INTO Dependente (NomDep, DatNasDep, MatEmp, Sexo) 
VALUES ('Joao Andrade', '2003-01-10',11, 'M');

INSERT INTO Projeto (CodProjeto, ProjNome) 
VALUES (1, 'Física');
INSERT INTO Projeto (CodProjeto, ProjNome) 
VALUES (2, 'Matemática');

INSERT INTO Trabalha_Em (MatEmp, CodProjeto, Horas) 
VALUES (10, 1, 20);

INSERT INTO Trabalha_Em (MatEmp, CodProjeto, Horas) 
VALUES (10, 2, 20);

INSERT INTO Trabalha_Em (MatEmp, CodProjeto, Horas) 
VALUES (11, 1, 20);

INSERT INTO Trabalha_Em (MatEmp, CodProjeto, Horas) 
VALUES (11, 2, 30);

INSERT INTO Trabalha_Em (MatEmp, CodProjeto, Horas) 
VALUES (12, 1, 10);

INSERT INTO Conta(CodConta, CodCliente) 
VALUES (1, 10);

INSERT INTO Conta (CodConta, CodCliente) 
VALUES (2, 11);

INSERT INTO Conta (CodConta, CodCliente) 
VALUES (3, 11);

INSERT INTO Conta (CodConta, CodCliente) 
VALUES (4, 12);
