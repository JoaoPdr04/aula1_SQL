-- continuação da atividade da aula mas agora fazendo as verificações (DQL)

-- PARTE B - CONSULTAS COM SELECT

-- Consultas básicas

SELECT * FROM curso;
SELECT nome, matricula FROM aluno;
SELECT * FROM aluno order by nome;
SELECT * FROM disciplina order by carga_horaria desc, nome asc;

-- Consultas com filtros

SELECT * FROM aluno WHERE id_curso = 1;
SELECT * FROM disciplina WHERE carga_horaria >= 80;
SELECT * FROM aluno WHERE data_nascimento < '2005-01-01';
SELECT * FROM aluno WHERE nome LIKE 'A%';
SELECT * FROM aluno WHERE data_nascimento IS NULL;
SELECT * FROM aluno WHERE id_curso IN (1,3);
SELECT * FROM disciplina WHERE carga_horaria BETWEEN 60 and 80;

-- Consulta com relacionamentos

SELECT aluno.nome, curso.nome FROM aluno, curso WHERE aluno.id_curso = curso.id_curso;

SELECT disciplina.nome, disciplina.carga_horaria, curso.nome FROM disciplina, curso WHERE disciplina.id_curso = curso.id_curso;

-- ver porque a declaração muda...

SELECT aluno.nome, aluno.matricula FROM aluno WHERE aluno.id_curso = 1;

SELECT aluno.nome AS nome_aluno, aluno.matricula AS matricula_aluno, curso.nome AS nome_curso FROM aluno
INNER JOIN curso ON aluno.id_curso = curso.id_curso
WHERE curso.nome = 'Engenharia da Computação';

-- Consultas com funções de agregação

SELECT COUNT(*) FROM aluno;
SELECT MAX(carga_horaria), MIN(carga_horaria) FROM disciplina;
SELECT AVG(carga_horaria) FROM disciplina;
SELECT curso.nome, COUNT(aluno.id_aluno) FROM curso, aluno WHERE curso.id_curso = aluno.id_curso GROUP BY curso.nome;
SELECT curso.nome, SUM(disciplina.carga_horaria) FROM curso, disciplina WHERE curso.id_curso = disciplina.id_curso GROUP BY curso.nome;

SELECT 
    c.nome AS nome_curso,
    COUNT(a.id_aluno) AS quantidade_alunos
FROM curso c
INNER JOIN aluno a ON c.id_curso = a.id_curso
GROUP BY c.id_curso, c.nome
HAVING COUNT(a.id_aluno) >= 3;