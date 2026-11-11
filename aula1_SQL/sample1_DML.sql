-- DML - DATA MANIPULATION LANGUAGE
-- INSERT, UPDATE, DELETE

-- A linha abaixo foi comentada para não gerar erro no console:
-- INSERT INTO tabela (col1, col2, ..., coln) VALUES (val1, val2, ..., valn);

INSERT INTO departamento (nome, numero) VALUES ('financeiro', 1);
INSERT INTO departamento (nome, numero) VALUES ('comercial', 2);
INSERT INTO departamento (nome, numero) VALUES ('juridico', 3);

INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
        VALUES ('1', 'joao', 'oliveira', 'rua jundiai', '2005-04-24', 1000, 'm', NULL, 1);

-- Alterado o ident do gui para '2' para não conflitar com o do joao
INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
        VALUES ('2', 'gui', 'peres', 'aracatuba', '2004-10-16', 1000, 'm', NULL, 2);

INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
        VALUES ('3', 'victor', 'tokumo', 'marilia', '2004-09-25', 1000, 'm', NULL, 3);

--para a chamada
--INSERT INTO chamada (prontuario, nome, o_que_eh_ddl) VALUES ('BI3033988', 'Joao Pedro Ferreira de Oliveira', 'Sao os comandos utilizados para criacao e modificacao dos objetos de um banco de dados');