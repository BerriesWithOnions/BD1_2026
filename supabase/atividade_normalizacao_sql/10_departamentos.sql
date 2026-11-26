-- Antes: FUNCIONARIO_DEPARTAMENTO(id_funcionario PK, nome_funcionario, salario,
-- id_departamento, nome_departamento, gerente_departamento).
-- a) id_funcionario → nome_funcionario, salario, id_departamento;
-- id_departamento → nome_departamento, gerente_departamento. Logo, o ID do
-- funcionário também determina transitivamente o nome e o gerente do departamento.
-- b–c) Cada célula tem um valor (1FN). A chave é simples e, pelas regras dadas,
-- não há dependência parcial de chave candidata (2FN).
-- d) Viola a 3FN: o departamento não identifica um funcionário e determina
-- atributos não primos.
-- e) Sem funcionários, não se cadastra um departamento; alterar só uma cópia
-- do gerente causa divergência; excluir o último funcionário apaga o departamento.
-- f–g) Depois: DEPARTAMENTO(id_departamento PK, nome_departamento, gerente_departamento)
-- e FUNCIONARIO(id_funcionario PK, nome_funcionario, salario, id_departamento FK).

BEGIN;
CREATE SCHEMA norm_10;
SET LOCAL search_path TO norm_10;

CREATE TABLE departamento (
    id_departamento bigint PRIMARY KEY,
    nome_departamento text NOT NULL,
    gerente_departamento text NOT NULL
);
CREATE TABLE funcionario (
    id_funcionario bigint PRIMARY KEY,
    nome_funcionario text NOT NULL,
    salario numeric(10,2) NOT NULL CHECK (salario >= 0),
    id_departamento bigint NOT NULL REFERENCES departamento
);
INSERT INTO departamento VALUES (10, 'TI', 'Carlos'), (20, 'Financeiro', 'Fernanda');
INSERT INTO funcionario VALUES
    (1, 'Ana', 3500, 10), (2, 'Bruno', 4200, 10), (3, 'Maria', 3100, 20),
    (4, 'Pedro', 3900, 10), (5, 'Julia', 3700, 20);

UPDATE funcionario SET salario = salario * 1.10 WHERE id_departamento = 10;
UPDATE departamento SET gerente_departamento = 'Helena' WHERE id_departamento = 20;
SELECT * FROM departamento ORDER BY id_departamento;
SELECT * FROM funcionario WHERE id_departamento = 10 ORDER BY id_funcionario;

-- o–p) A FK impede associar um funcionário ao departamento inexistente 99.
DO $$
BEGIN
    INSERT INTO funcionario VALUES (6, 'Rui', 3000, 99);
    RAISE EXCEPTION 'A chave estrangeira deveria ter impedido a inserção.';
EXCEPTION WHEN foreign_key_violation THEN
    RAISE NOTICE 'Departamento inexistente: a FK rejeitou a linha (23503).';
END;
$$;
COMMIT;
