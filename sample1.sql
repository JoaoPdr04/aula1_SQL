-- BASIC CONSOLE COMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABElE>   => Describe table 
-- git config --global user.name "Your Name"
-- git config --global user.email "your.email@example.com"

CREATE DATABASE empresa;

CREATE DOMAIN TIPO_ID CHAR(4);

CREATE DOMAIN D_NUM INTEGER CHECK (VALUE > 0 AND VALUE < 21); 

CREATE TABLE funcionario;

CREATE TABLE funcionario;
(
ident TIPO_ID,
nome VARCHAR(15) NOT NULL,
sobrenome VARCHAR(15) NOT NULL,
endereco VARCHAR(30),
dtnasc DATE,
salario DECIMAL(10,2),
sexo BOOLEAN,
supident TIPO_ID,
dnumero TIPO_ID NOT NULL,
PRIMARY KEY (ident)
);

CREATE TABLE dependente;
(
    fident TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    dtnasc DATE,
    sexo BOOLEAN,
    relacionamento VARCHAR(15) NOT NULL
);

CREATE TABLE DEPARTAMENTO
(
    numero D_NUM PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    gident TIPO_ID,
    dtinicio DATE,
    FOREIGN KEY (gident) REFERENCES funcionario(ident)
);

CREATE TABLE LOCALIZACOES
(
    dnumero D_NUM NOT NULL,
    localizacao VARCHAR(30) NOT NULL,
    PRIMARY KEY (dnumero, localizacao),
    FOREIGN KEY (dnumero) REFERENCES DEPARTAMENTO(numero)
);

CREATE TABLE PROJETO
(
    numero D_NUM PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    localizacao VARCHAR(30),
    dnumero D_NUM NOT NULL,
    FOREIGN KEY (dnumero) REFERENCES DEPARTAMENTO(numero)
);

CREATE TABLE TRABALHA_EM
(
    pnumero D_NUM NOT NULL,
    fident TIPO_ID NOT NULL,
    horas DECIMAL(4,2),
    PRIMARY KEY (pnumero, fident),
    FOREIGN KEY (pnumero) REFERENCES PROJETO(numero),
    FOREIGN KEY (fident) REFERENCES funcionario(ident)
);

