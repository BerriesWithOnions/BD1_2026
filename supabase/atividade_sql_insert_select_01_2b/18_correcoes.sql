-- A. Preço negativo viola CHECK (preco >= 0).
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Teclado', 150, 10, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'));

-- B. Omitir nome viola NOT NULL.
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Microfone', 250, 5, (SELECT id_categoria FROM categoria WHERE nome = 'Eletrônicos'));

-- C. Estoque negativo viola CHECK (estoque >= 0).
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Webcam', 300, 2, (SELECT id_categoria FROM categoria WHERE nome = 'Informática'));

-- D. Categoria inexistente viola a chave estrangeira.
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Headset', 450, 5, (SELECT id_categoria FROM categoria WHERE nome = 'Acessórios'));
