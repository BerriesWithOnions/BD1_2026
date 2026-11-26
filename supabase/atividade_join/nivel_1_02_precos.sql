SELECT p.nome AS produto, p.preco, c.nome AS categoria
FROM produto AS p
INNER JOIN categoria AS c ON c.id_categoria = p.id_categoria
ORDER BY p.preco DESC, p.id_produto;
