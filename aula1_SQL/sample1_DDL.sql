-- BASIC CONSOLE COMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABElE>   => Describe table 
-- git config --global user.name "JoaoPdr04"
-- git config --global user.email "jpfdo24@gmail.com"

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
-- FOREIGN KEY (supident) REFERENCES FUNCIONARIO(ident), 
-- então aqui temos a a chave estrangeira que referencia a própria tabela FUNCIONARIO, ou seja, 
-- um funcionário pode ter um supervisor que também é um funcionário.
-- FOREIGN KEY (dnumero) REFERENCES DEPARTAMENTO(numero)
);

-- ALTER TABLE DEPARTAMENTO
-- ADD CONSTRAINT departamento_gident_fkey
-- FOREIGN KEY (gident) REFERENCES FUNCIONARIO(ident);

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

CREATE TABLE CHAMADA
(
    prontuario VARCHAR(15),
    nome VARCHAR(50),
    time_coracao VARCHAR(50),
    PRIMARY KEY (prontuario)
)

CREATE TABLE chamada
(
    prontuario VARCHAR(15),
    nome varchar(50),
    time_coracao varchar(50),
    PRIMARY KEY (prontuario)
);

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_departamento FOREIGN KEY (dnumero) REFERENCES departamento (numero);
-- então aqui temos uma forma mais eficiente de declarar chaves primárias, onde essa... 
-- declaração é mais correta e com menos chance de dar errada na questão de ordem de criação

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_superior FOREIGN KEY (supident) REFERENCES departamento (ident);

-- empresa=# INSERT INTO CHAMADA VALUES ('bi3033988', 'Joao Pedro Ferreira de Oliveira');
-- empresa=# select * from chamada order by nome;
-- empresa=# UPDATE CHAMADA SET time_coracao = 'Santos' WHERE prontuario = 'bi3033988';