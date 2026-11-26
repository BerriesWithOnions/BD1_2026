-- a) Antes: ALUNO(id_aluno PK, nome_aluno, disciplina_1, disciplina_2, disciplina_3).
-- As três colunas representam ocorrências do mesmo relacionamento.
-- b) Procurar uma disciplina exige examinar várias colunas e há posições vazias.
-- c) Para cinco disciplinas, o modelo antigo precisaria de mais duas colunas.
-- d–e) Depois: ALUNO(id_aluno PK, nome_aluno), DISCIPLINA(id_disciplina PK, nome)
-- e MATRICULA(id_aluno FK, id_disciplina FK, PK(id_aluno, id_disciplina)).
-- A relação aluno–disciplina é N:N. Cada matrícula liga um aluno a uma disciplina.

BEGIN;
CREATE SCHEMA norm_06;
SET LOCAL search_path TO norm_06;

CREATE TABLE aluno (
    id_aluno bigint PRIMARY KEY,
    nome_aluno text NOT NULL
);
CREATE TABLE disciplina (
    id_disciplina bigint PRIMARY KEY,
    nome text NOT NULL
);
CREATE TABLE matricula (
    id_aluno bigint REFERENCES aluno,
    id_disciplina bigint REFERENCES disciplina,
    PRIMARY KEY (id_aluno, id_disciplina)
);
INSERT INTO aluno VALUES (1, 'Ana'), (2, 'Bruno'), (3, 'Maria');
INSERT INTO disciplina VALUES
    (10, 'Banco de Dados'), (20, 'Algoritmos'),
    (30, 'Engenharia de Software'), (40, 'Redes');
INSERT INTO matricula VALUES (1, 10), (1, 20), (1, 30), (2, 10), (2, 40), (3, 20);
SELECT * FROM matricula WHERE id_aluno = 1 ORDER BY id_disciplina;
COMMIT;
