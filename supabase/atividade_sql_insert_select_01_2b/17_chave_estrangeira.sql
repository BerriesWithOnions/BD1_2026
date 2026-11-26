-- O banco deve recusar: a categoria 9999 não existe nos dados da lista.
INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES ('Headset', 450.00, 5, 9999);
-- A FK rejeita o registro (23503) para preservar a integridade referencial:
-- todo produto precisa apontar para uma categoria existente.
