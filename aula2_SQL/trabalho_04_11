--Modelo de dados - cursos, alunos e disciplinas

\c postgres;
DROP DATABASE IF EXISTS bi3033988_ifsp;
CREATE DATABASE bi3033988_ifsp;
\c bi3033988_ifsp;

CREATE TABLE curso
(
    id_curso INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL
);

ALTER TABLE curso
ADD CONSTRAINT pk_curso PRIMARY KEY (id_curso),
ADD CONSTRAINT ck_curso_carga_horaria CHECK (carga_horaria > 0);

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
 

CREATE TABLE disciplina
(
    id_disciplina INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL,
    id_curso INTEGER NOT NULL
);

ALTER TABLE disciplina 
ADD CONSTRAINT pk_disciplina PRIMARY KEY (id_disciplina), 
ADD CONSTRAINT ck_disciplina_carga_horaria CHECK (carga_horaria > 0),
ADD CONSTRAINT fk_disciplina_curso FOREIGN KEY (id_curso) REFERENCES curso (id_curso);
