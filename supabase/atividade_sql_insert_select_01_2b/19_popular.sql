INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES
    ('Caneta', 4, 60, (SELECT id_categoria FROM categoria WHERE nome = 'Papelaria')),
    ('Mesa', 800, 3, (SELECT id_categoria FROM categoria WHERE nome = 'Móveis')),
    ('Organizador', 42, 15, (SELECT id_categoria FROM categoria WHERE nome = 'Escritório')),
    ('Hub USB', 89, 12, (SELECT id_categoria FROM categoria WHERE nome = 'Acessórios'));

-- Após os exercícios anteriores: 8 categorias e 15 produtos.
SELECT * FROM categoria;
SELECT * FROM produto;

SELECT p.nome AS produto, c.nome AS categoria
FROM produto AS p JOIN categoria AS c ON c.id_categoria = p.id_categoria
ORDER BY c.nome, p.nome;
