# Data Definition Language - DDL
CREATE SCHEMA IF NOT EXISTS pos_puc_mod_1_prova_un_1 CHARSET='latin1';

USE pos_puc_mod_1_prova_un_1; 

DROP TABLE IF EXISTS T1;
DROP TABLE IF EXISTS T2;

CREATE TABLE T1(
    Id INT NOT NULL,
    X INT NOT NULL,
    Y INT NOT NULL,
    Z INT NOT NULL,
    CONSTRAINT PK_EMP PRIMARY KEY(Id)
);

CREATE TABLE T2(
    Id INT NOT NULL,
    A INT NOT NULL,
    B INT NOT NULL,
    CONSTRAINT PK_EMP PRIMARY KEY(Id)
);
