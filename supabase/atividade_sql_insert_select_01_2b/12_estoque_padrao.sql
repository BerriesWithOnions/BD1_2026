INSERT INTO produto (nome, preco, id_categoria, descricao)
VALUES ('Mouse sem fio', 89.90, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'), 'Mouse óptico sem fio');

SELECT * FROM produto;
-- O estoque do mouse é 0, pois a coluna omitida possui DEFAULT 0.
