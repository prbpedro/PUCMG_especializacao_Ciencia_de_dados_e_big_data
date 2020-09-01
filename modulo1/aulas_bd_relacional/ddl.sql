# Data Definition Language - DDL
CREATE SCHEMA IF NOT EXISTS pos_puc_mod_1_aulas charset='latin1';

use pos_puc_mod_1_aulas; 

drop table if exists Dependente;
drop table if exists Empregado;

Create table Empregado(
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

Create table Dependente(   
	NomDep char(30),
    DatNasDep date,
    MatEmp smallint,
    Sexo char(2) null,
	Constraint PK_DEP primary Key (MatEmp, NomDep),
    constraint FK_EMP foreign key (MatEmp) references Empregado (MatEmp)
);

alter table Empregado add UfEmp char(2) null;
alter table Empregado drop column UfEmp;
alter table Dependente drop foreign key FK_EMP;
alter table Dependente add constraint FK_EMP foreign key (MatEmp) references Empregado (MatEmp);