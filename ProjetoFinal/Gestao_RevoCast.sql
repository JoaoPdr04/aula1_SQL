--Modelo de Dados (DDL)

\c postgres;
DROP DATABASE IF EXISTS gestao_revocast;
CREATE DATABASE gestao_revocast;
\c gestao_revocast;

CREATE TABLE episodio
(
    id_episodio INTEGER NOT NULL
)

CREATE TABLE membro_equipe
(
    id_membro INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    curso VARCHAR(100) NOT NULL,
--o que mais é muito importante para categorizar os membros da equipe??
)

ALTER TABLE membro_equipe
ADD CONSTRAINT pk_membro 

CREATE TABLE aluno
(
    id_aluno INTEGER,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    data_nascimento DATE,
    id_curso INTEGER NOT NULL
);

ALTER TABLE aluno
ADD CONSTRAINT pk_aluno PRIMARY KEY (id_aluno), 
ADD CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
ADD CONSTRAINT uq_aluno_matricula UNIQUE (matricula);