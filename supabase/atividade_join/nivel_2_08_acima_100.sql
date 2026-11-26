SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM categoria AS c
LEFT JOIN produto AS p ON p.id_categoria = c.id_categoria
                       AND p.preco > 100;
