SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM categoria AS c
LEFT JOIN produto AS p ON p.id_categoria = c.id_categoria
ORDER BY c.id_categoria, p.id_produto;

SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM produto AS p
RIGHT JOIN categoria AS c ON c.id_categoria = p.id_categoria
ORDER BY c.id_categoria, p.id_produto;
