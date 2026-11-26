SELECT id_categoria, SUM(preco * estoque) AS valor_estoque
FROM produto
GROUP BY id_categoria
ORDER BY id_categoria;
