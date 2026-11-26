INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES
    ('Monitor', 799.90, 4, (SELECT id_categoria FROM categoria WHERE nome = 'Informática')),
    ('Caneta Azul', 2.50, 80, (SELECT id_categoria FROM categoria WHERE nome = 'Escritório')),
    ('Suporte para Celular', 29.90, 12, (SELECT id_categoria FROM categoria WHERE nome = 'Acessórios')),
    ('Caixa de Som', 149.00, 5, (SELECT id_categoria FROM categoria WHERE nome = 'Eletrônicos'));

SELECT * FROM produto;
