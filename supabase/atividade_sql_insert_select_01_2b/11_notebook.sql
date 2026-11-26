SELECT * FROM categoria;

INSERT INTO produto (nome, preco, estoque, id_categoria, descricao)
VALUES ('Notebook', 3500.00, 5, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'),
        'Notebook para uso profissional');
