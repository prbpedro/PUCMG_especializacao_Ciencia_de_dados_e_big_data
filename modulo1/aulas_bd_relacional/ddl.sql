# Data Definition Language - DDL
CREATE SCHEMA IF NOT EXISTS pos_puc_mod_1_aulas CHARSET='latin1';

USE pos_puc_mod_1_aulas; 

DROP TABLE IF EXISTS Dependente;
DROP TABLE IF EXISTS Empregado;

CREATE TABLE Empregado(
    MatEmp SMALLINT NOT NULL,
    NomEmp CHAR(30) NOT NULL,
    EndEmp CHAR(80) NULL,
    CidEmp CHAR(20) NULL,
    Bairro CHAR(20) NULL,
    Cargo CHAR(20) NULL,
    Sexo CHAR(2) NULL,
    Comissao FLOAT NULL,
    Salario FLOAT NULL,
    SalarioBruto FLOAT NULL,
    CodDepto SMALLINT,
    CodSupervisor SMALLINT,
    CONSTRAINT PK_EMP PRIMARY KEY(MatEmp)
);

CREATE TABLE Dependente(   
    NomDep CHAR(30),
    DatNasDep DATE,
    MatEmp SMALLINT,
    Sexo char(2) NULL,
    CONSTRAINT PK_DEP PRIMARY KEY (MatEmp, NomDep),
    CONSTRAINT FK_EMP FOREIGN KEY (MatEmp) REFERENCES Empregado (MatEmp)
);

ALTER TABLE Empregado ADD UfEmp CHAR(2) NULL;
ALTER TABLE Empregado DROP COLUMN UfEmp;
ALTER TABLE Dependente DROP FOREIGN KEY FK_EMP;
ALTER TABLE Dependente ADD CONSTRAINT FK_EMP FOREIGN KEY (MatEmp) REFERENCES Empregado (MatEmp);

alter table Empregado drop column Salario;
alter table Empregado add column Salario FLOAT null;
