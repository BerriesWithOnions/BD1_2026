-- Previsão: o banco recusará o registro porque nome é obrigatório.
INSERT INTO produto (preco, estoque, id_categoria)
VALUES (250.00, 5, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'));
-- Erro esperado: not_null_violation (23502). O produto não é cadastrado.
