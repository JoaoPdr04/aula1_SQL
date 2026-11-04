
-- ESSA VERSÃO DO CÓDIGO TEM ALGUMAS COSRREÇÕES DE IA

-- BASIC CONSOLE COMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABLE>    => Describe table 

\c postgres;
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
\c empresa;


CREATE DOMAIN tipo_id CHAR(4);
CREATE DOMAIN d_num INTEGER CHECK (VALUE > 0 AND VALUE < 21); 

CREATE TABLE departamento
(
    numero d_num PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    gident tipo_id,
    dtinicio DATE
);

CREATE TABLE funcionario
(
    ident tipo_id,
    nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(15) NOT NULL,
    endereco VARCHAR(30),
    dtnasc DATE,
    salario DECIMAL(10,2),
    sexo VARCHAR(15),
    supident tipo_id,
    dnumero d_num NOT NULL,
    PRIMARY KEY (ident)
);

ALTER TABLE departamento
ADD CONSTRAINT departamento_gident_fkey
FOREIGN KEY (gident) REFERENCES funcionario(ident);

CREATE TABLE dependente
(
    fident tipo_id,
    nome VARCHAR(15) NOT NULL,
    dtnasc DATE,
    sexo VARCHAR(15),
    relacionamento VARCHAR(15) NOT NULL,
    PRIMARY KEY (fident, nome),
    FOREIGN KEY (fident) REFERENCES funcionario(ident)
);

CREATE TABLE localizacoes
(
    dnumero d_num NOT NULL,
    localizacao VARCHAR(30) NOT NULL,
    PRIMARY KEY (dnumero, localizacao),
    FOREIGN KEY (dnumero) REFERENCES departamento(numero)
);

CREATE TABLE projeto
(
    numero d_num PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    localizacao VARCHAR(30),
    dnumero d_num NOT NULL,
    FOREIGN KEY (dnumero) REFERENCES departamento(numero)
);

CREATE TABLE trabalha_em
(
    pnumero d_num NOT NULL,
    fident tipo_id NOT NULL,
    horas DECIMAL(4,2),
    PRIMARY KEY (pnumero, fident),
    FOREIGN KEY (pnumero) REFERENCES projeto(numero),
    FOREIGN KEY (fident) REFERENCES funcionario(ident)
);

CREATE TABLE chamada
(
    prontuario VARCHAR(15),
    nome VARCHAR(50),
    time_coracao VARCHAR(50),
    PRIMARY KEY (prontuario)
);

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_departamento FOREIGN KEY (dnumero) REFERENCES departamento (numero);

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_superior FOREIGN KEY (supident) REFERENCES funcionario (ident);

--

ALTER TABLE funcionario
ALTER supident SET DEFAULT 5;

ALTER TABLE funcionario
ALTER sexo TYPE VARCHAR(1);

ALTER TABLE departamento
DROP dnumero RESTRICT; -- NÃO DEIXA DELETAR SE TIVER OUTRO OBJETO RELACIONADO

ALTER TABLE departamento
DROP dnumero CASCADE; -- DELETA O OBJETO E SEUS RELACIONAMENTO


