SELECT id_categoria, SUM(preco * estoque) AS valor_estoque
FROM produto
GROUP BY id_categoria
HAVING SUM(preco * estoque) > 10000
ORDER BY id_categoria;
