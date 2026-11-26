INSERT INTO produto (nome, preco, id_categoria)
VALUES ('Grampeador', 18.50, (SELECT id_categoria FROM categoria WHERE nome = 'Escritório'))
RETURNING *;

-- 1. O estoque inicial é 0.
-- 2. Ao omitir estoque no INSERT, o PostgreSQL aplica o DEFAULT 0 da coluna.
-- 3. O PostgreSQL gera id_produto pela sequência da coluna IDENTITY.
-- 4. RETURNING * devolve todas as colunas da linha recém-inserida,
--    incluindo o ID gerado e o estoque preenchido por padrão.
