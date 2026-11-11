--atividade de inserção baseado no banco de dados da aula anterior

-- PARTE A - INSERÇÃO DE DADOS COM INSERT

-- Ex. 1 - Cadastro de cursos

INSERT INTO curso VALUES ('1', 'Engenharia da Computação', 3600);
INSERT INTO curso Values ('2', 'Análise e Desenvolvimento de Sistemas', 2400);
INSERT INTO curso Values ('3', 'Redes de Computadores', 2000);
INSERT INTO curso Values ('4', 'Gestão da Tecnologia da Informação', 2000);

-- Ex. 2 - Cadastro de alunos

INSERT INTO aluno VALUES ('1', 'Ana Souza', 2026001, '2005-03-15', 1);
INSERT INTO aluno VALUES ('2', 'Bruno Lima', 2026002, '2004-07-22', 1);
INSERT INTO aluno VALUES ('3', 'Carla Mendes', 2026003, '2003-01-10', 2);
INSERT INTO aluno VALUES ('4', 'Diego Santos', 2026004, '2003-11-05', 2);
INSERT INTO aluno VALUES ('5', 'Elisa Rocha', 2026005, '2005-09-18', 3); 
INSERT INTO aluno VALUES ('6', 'Felipe Alves', 2026006, '2004-04-30', 3);
INSERT INTO aluno VALUES ('7', 'Gabriela Costa', 2026007, '2006-06-12', 1);
INSERT INTO aluno (id_aluno, nome, matricula, id_curso) VALUES ('8', 'Henrique Martins', 2026008, 2);
INSERT INTO aluno VALUES ('9', 'Isabela Oliveira', 2026009, '2005-12-01', 1);
INSERT INTO aluno (id_aluno, nome, matricula, id_curso) VALUES ('10', 'João Pereira', 2026010, 3);

-- Ex. 3 - Cadastro de disciplinas

INSERT INTO disciplina VALUES ('1', 'Algoritmos', 80, 1);
INSERT INTO disciplina VALUES ('2', 'Banco de Dados I', 80, 1);
INSERT INTO disciplina VALUES ('3', 'Arquitetura de Computadores', 60, 1);
INSERT INTO disciplina VALUES ('4', 'Programação Web', 80, 2);
INSERT INTO disciplina VALUES ('5', 'Engenharia de Software', 60, 2); 
INSERT INTO disciplina VALUES ('6', 'Banco de Dados', 60, 1);
INSERT into disciplina values ('7', 'Redes de Computadores I', 80, 3);
INSERT INTO disciplina VALUES ('8', 'Segurança de Redes', 60, 3);
INSERT INTO disciplina VALUES ('9', 'Sistemas Operacionais', 60, 2);

-- Ex. 4 - Teste de Matrícula duplicada

INSERT INTO aluno VALUES ('11', 'Lucas Ferreira', 2026001, '2005-05-20', 1);

-- Ex. 5 - Teste de chave estrangeira

INSERT INTO disciplina VALUES ('10', 'Inteligência Artificial', 80, 99);