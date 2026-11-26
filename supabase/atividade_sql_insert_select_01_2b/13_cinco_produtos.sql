SELECT * FROM categoria;

INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES
    ('Monitor', 1200, 10, (SELECT id_categoria FROM categoria WHERE nome = 'Eletrônicos')),
    ('Cadeira', 650, 4, (SELECT id_categoria FROM categoria WHERE nome = 'Móveis')),
    ('Teclado USB', 150, 22, (SELECT id_categoria FROM categoria WHERE nome = 'Informática')),
    ('Caderno', 20, 48, (SELECT id_categoria FROM categoria WHERE nome = 'Papelaria')),
    ('Controle', 250, 8, (SELECT id_categoria FROM categoria WHERE nome = 'Games'));
