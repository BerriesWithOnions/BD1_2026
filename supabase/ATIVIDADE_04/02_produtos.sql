-- A consulta pelo nome único recupera o ID real de cada categoria.
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES
    ('Teclado Mecânico', 250.00, 10, (SELECT id_categoria FROM categoria WHERE nome = 'Informática')),
    ('Mouse Sem Fio', 120.00, 15, (SELECT id_categoria FROM categoria WHERE nome = 'Informática')),
    ('Caderno', 25.90, 30, (SELECT id_categoria FROM categoria WHERE nome = 'Escritório')),
    ('Cabo USB-C', 39.90, 20, (SELECT id_categoria FROM categoria WHERE nome = 'Acessórios')),
    ('Fone Bluetooth', 180.00, 8, (SELECT id_categoria FROM categoria WHERE nome = 'Eletrônicos'));

SELECT * FROM produto;

-- Como id_produto foi omitido, o PostgreSQL obteve o próximo valor da
-- sequência da coluna IDENTITY para cada produto inserido.
