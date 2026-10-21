-- BASIC CONSOLE COMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABElE>   => Describe table 
-- git config --global user.name "Your Name"
-- git config --global user.email "your.email@example.com"

DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
\c empresa;
CREATE DOMAIN TIPO_ID CHAR(4);
CREATE DOMAIN D_NUM INTEGER CHECK (VALUE > 0 AND VALUE < 21); 

CREATE TABLE DEPARTAMENTO
(
    numero D_NUM PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    gident TIPO_ID,
    dtinicio DATE
);

CREATE TABLE FUNCIONARIO
(
ident TIPO_ID,
nome VARCHAR(15) NOT NULL,
sobrenome VARCHAR(15) NOT NULL,
endereco VARCHAR(30),
dtnasc DATE,
salario DECIMAL(10,2),
sexo VARCHAR(15),
supident TIPO_ID,
dnumero D_NUM NOT NULL,
PRIMARY KEY (ident),
FOREIGN KEY (supident) REFERENCES FUNCIONARIO(ident), 
-- então aqui temos a a chave estrangeira que referencia a própria tabela FUNCIONARIO, ou seja, 
-- um funcionário pode ter um supervisor que também é um funcionário.
FOREIGN KEY (dnumero) REFERENCES DEPARTAMENTO(numero)
);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT departamento_gident_fkey
FOREIGN KEY (gident) REFERENCES FUNCIONARIO(ident);

CREATE TABLE DEPENDENTE
(
    fident TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    dtnasc DATE,
    sexo VARCHAR(15),
    relacionamento VARCHAR(15) NOT NULL,
    PRIMARY KEY (fident, nome),
    FOREIGN KEY (fident) REFERENCES FUNCIONARIO(ident)
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
    FOREIGN KEY (fident) REFERENCES FUNCIONARIO(ident)
);