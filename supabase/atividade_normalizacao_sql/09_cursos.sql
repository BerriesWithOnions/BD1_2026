-- Antes: ALUNO_CURSO(id_aluno, nome_aluno, id_curso, nome_curso, coordenador).
-- a) A PK é id_aluno.
-- b–c) id_aluno → nome_aluno, id_curso; id_curso → nome_curso, coordenador.
-- Por transitividade, id_aluno também determina nome_curso e coordenador.
-- d) Os valores são atômicos e a única chave candidata é simples: não há
-- dependência parcial, portanto a relação está na 2FN.
-- e) id_curso não é superchave de ALUNO_CURSO e determina dois atributos
-- não primos. Essa dependência viola a 3FN.
-- f–h) Depois: CURSO(id_curso PK, nome_curso, coordenador) e
-- ALUNO(id_aluno PK, nome_aluno, id_curso FK → CURSO).

BEGIN;
CREATE SCHEMA norm_09;
SET LOCAL search_path TO norm_09;

CREATE TABLE curso (
    id_curso bigint PRIMARY KEY,
    nome_curso text NOT NULL,
    coordenador text NOT NULL
);
CREATE TABLE aluno (
    id_aluno bigint PRIMARY KEY,
    nome_aluno text NOT NULL,
    id_curso bigint NOT NULL REFERENCES curso
);
INSERT INTO curso VALUES
    (10, 'Sistemas de Informação', 'Carlos'),
    (20, 'Ciência da Computação', 'Fernanda'),
    (30, 'Engenharia de Software', 'Roberto');
INSERT INTO aluno VALUES
    (1, 'Ana', 10), (2, 'Bruno', 10), (3, 'Maria', 20),
    (4, 'Pedro', 30), (5, 'Julia', 20);

UPDATE curso SET coordenador = 'Marcos' WHERE id_curso = 10;
SELECT * FROM curso WHERE id_curso = 10;
-- n) Os alunos referenciam o curso 10. O coordenador fica apenas em curso,
-- e o identificador do curso continuou igual.
COMMIT;
