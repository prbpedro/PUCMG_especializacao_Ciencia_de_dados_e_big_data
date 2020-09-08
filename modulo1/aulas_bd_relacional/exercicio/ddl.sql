# Data Definition Language - DDL
CREATE SCHEMA IF NOT EXISTS pos_puc_mod_1_u1_exercicio CHARSET='latin1';

USE pos_puc_mod_1_u1_exercicio; 

DROP TABLE IF EXISTS Filme;
DROP TABLE IF EXISTS Genero;
DROP TABLE IF EXISTS Preco;
DROP TABLE IF EXISTS Locacao;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente(
    CodCliente int(10) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NULL,
    Bairro VARCHAR(20) NULL,
    Cidade VARCHAR(50) NULL,
    Estado CHAR(2) NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY(CodCliente)
);

CREATE TABLE Genero(   
    CodGenero int(3) NOT NULL,
    Descricao VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Genero PRIMARY KEY (CodGenero)
);

CREATE TABLE Preco(   
    Cor CHAR(2) NOT NULL,
    Valor float(10,2) NOT NULL,
    CONSTRAINT PK_Preco PRIMARY KEY (Cor)
);


CREATE TABLE Filme(   
    CodFilme int(3) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Cor CHAR(2) NOT NULL,
    Status CHAR(1) NOT NULL,
    CodGenero int(3) NOT NULL,
    CONSTRAINT PK_Filme PRIMARY KEY (CodFilme),
    CONSTRAINT FK_Filme_Genero FOREIGN KEY (CodGenero) REFERENCES Genero (CodGenero),
    CONSTRAINT FK_Filme_Preco FOREIGN KEY (Cor) REFERENCES Preco (Cor)
);

CREATE TABLE Locacao(   
    CodCliente int(10) NOT NULL,
    DataLocacao Date NOT NULL,
    CodFilme int(3) NOT NULL,
    DataDevolucao Date NULL,
    CONSTRAINT PK_Locacao PRIMARY KEY (CodCliente, DataLocacao, CodFilme),
    CONSTRAINT FK_Locacao_Filme FOREIGN KEY (CodFilme) REFERENCES Filme (CodFilme),
    CONSTRAINT FK_Locacao_Cliente FOREIGN KEY (CodCliente) REFERENCES Cliente (CodCliente)
);
